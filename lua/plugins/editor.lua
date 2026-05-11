local parsers = {
    "bash",
    "c",
    "cpp",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "zig",
    "lua",
    "luadoc",
    "vim",
    "vimdoc",
    "query",
    "json",
}

local filetypes = {
    "bash",
    "c",
    "cpp",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "markdown",
    "python",
    "rust",
    "zig",
    "lua",
    "vim",
    "vimdoc",
    "json",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "neovim-treesitter/treesitter-parser-registry" },
        lazy = false,
        build = ":TSUpdate",
        opts = {
            install_dir = vim.fn.stdpath("data") .. "/site",
        },
        config = function(_, opts)
            local treesitter = require("nvim-treesitter")

            treesitter.setup(opts)

            if vim.fn.executable("tree-sitter") == 1 then
                treesitter.install(parsers)
            end

            vim.api.nvim_create_user_command("TSInstallConfigured", function()
                if vim.fn.executable("tree-sitter") == 0 then
                    vim.notify("tree-sitter-cli is required. Run :MasonToolsInstall first.", vim.log.levels.WARN)
                    return
                end

                treesitter.install(parsers)
            end, {})

            vim.api.nvim_create_autocmd("FileType", {
                pattern = filetypes,
                callback = function(event)
                    local lang = vim.treesitter.language.get_lang(event.match)

                    if not lang then
                        return
                    end

                    local ok = pcall(vim.treesitter.start, event.buf, lang)

                    if ok then
                        vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },
    {
        "nvim-mini/mini.nvim",
        event = "VeryLazy",
        config = function()
            require("mini.ai").setup({ n_lines = 500 })
            require("mini.pairs").setup()
            require("mini.surround").setup()
        end,
    },
}
