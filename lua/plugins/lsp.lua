local servers = {
    "pyright",
    "ruff",
    "clangd",
    "vtsls",
    "marksman",
    "rust_analyzer",
    "zls",
    "lua_ls",
}

return {
    {
        "saghen/blink.cmp",
        event = "InsertEnter",
        version = "1.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        opts = {
            keymap = { preset = "default" },
            appearance = {
                nerd_font_variant = "mono",
            },
            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 300,
                },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            signature = {
                enabled = true,
            },
        },
        opts_extend = { "sources.default" },
    },
    {
        "mason-org/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
        opts = {},
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        cmd = { "MasonToolsInstall", "MasonToolsInstallSync", "MasonToolsUpdate", "MasonToolsUpdateSync" },
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = {
                "tree-sitter-cli",
                "stylua",
                "ruff",
                "clang-format",
                "prettier",
            },
            auto_update = false,
            run_on_start = false,
            debounce_hours = 24,
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "saghen/blink.cmp",
            { "mason-org/mason.nvim", opts = {} },
            {
                "mason-org/mason-lspconfig.nvim",
                opts = {
                    ensure_installed = servers,
                    automatic_enable = true,
                },
            },
        },
        config = function()
            vim.diagnostic.config({
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                virtual_text = {
                    spacing = 4,
                    source = "if_many",
                },
                float = {
                    border = "rounded",
                    source = true,
                },
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                                "${3rd}/luv/library",
                            },
                        },
                        completion = {
                            callSnippet = "Replace",
                        },
                    },
                },
            })

            vim.lsp.config("clangd", {
                cmd = { "clangd", "--background-index", "--clang-tidy" },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("jaime-lsp", { clear = true }),
                callback = function(event)
                    local bufnr = event.buf
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    local map = function(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
                    end

                    map("n", "K", vim.lsp.buf.hover, "Hover")
                    map("n", "gd", "<cmd>FzfLua lsp_definitions<cr>", "Go to definition")
                    map("n", "gD", "<cmd>FzfLua lsp_declarations<cr>", "Go to declaration")
                    map("n", "gi", "<cmd>FzfLua lsp_implementations<cr>", "Go to implementation")
                    map("n", "gr", "<cmd>FzfLua lsp_references<cr>", "References")
                    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
                    map("n", "<leader>r", vim.lsp.buf.rename, "Rename")

                    if client and client.server_capabilities.documentHighlightProvider then
                        local highlight_group = vim.api.nvim_create_augroup("jaime-lsp-highlight-" .. bufnr, {
                            clear = true,
                        })

                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            group = highlight_group,
                            buffer = bufnr,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            group = highlight_group,
                            buffer = bufnr,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end,
            })
        end,
    },
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff_organize_imports", "ruff_format" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                markdown = { "prettier" },
                rust = { "rustfmt", lsp_format = "fallback" },
                zig = { "zigfmt", lsp_format = "fallback" },
            },
            format_on_save = {
                timeout_ms = 1500,
                lsp_format = "fallback",
            },
            notify_on_error = true,
            notify_no_formatters = false,
        },
    },
}
