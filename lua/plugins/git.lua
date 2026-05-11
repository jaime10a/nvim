return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")
                local map = vim.keymap.set

                map("n", "]h", gitsigns.next_hunk, { buffer = bufnr, desc = "Next git hunk" })
                map("n", "[h", gitsigns.prev_hunk, { buffer = bufnr, desc = "Previous git hunk" })
                map("n", "<leader>gp", gitsigns.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
                map("n", "<leader>gb", gitsigns.blame_line, { buffer = bufnr, desc = "Blame line" })
            end,
        },
    },
    {
        "NeogitOrg/neogit",
        cmd = "Neogit",
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "ibhagwan/fzf-lua",
        },
        opts = {
            disable_commit_confirmation = true,
            integrations = {
                diffview = true,
                fzf_lua = true,
            },
        },
    },
}
