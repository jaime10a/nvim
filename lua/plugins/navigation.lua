return {
    {
        "karb94/neoscroll.nvim",
        keys = {
            {
                ",",
                function()
                    require("neoscroll").scroll(-vim.wo.scroll, true, 350)
                end,
                desc = "Smooth half-page up",
            },
            {
                "m",
                function()
                    require("neoscroll").scroll(vim.wo.scroll, true, 350)
                end,
                desc = "Smooth half-page down",
            },
        },
        opts = {
            hide_cursor = false,
            easing_function = "quadratic",
        },
    },
    {
        "ibhagwan/fzf-lua",
        cmd = "FzfLua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { ";f", "<cmd>FzfLua files<cr>", desc = "Find files" },
            { ";g", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
            { ";G", "<cmd>FzfLua live_grep_resume<cr>", desc = "Resume grep" },
            { ";b", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
            { ";h", "<cmd>FzfLua help_tags<cr>", desc = "Help tags" },
            { ";o", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
            { ";q", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix" },
            { ";l", "<cmd>FzfLua loclist<cr>", desc = "Location list" },
            { ";p", "<cmd>FzfLua complete_path<cr>", desc = "Complete path" },
            { ";z", ":FzfLua ", desc = "FzfLua command" },
            { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
            { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
            { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
            { "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
        },
        opts = {
            winopts = {
                height = 0.85,
                width = 0.9,
                preview = {
                    layout = "flex",
                },
            },
        },
    },
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        keys = {
            { "-", "<cmd>Oil<cr>", desc = "Open Oil" },
            { "<leader>t", "<cmd>Oil<cr>", desc = "Open Oil" },
            { "<leader>e", "<cmd>Oil<cr>", desc = "Open Oil" },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            default_file_explorer = true,
            delete_to_trash = true,
            columns = { "icon" },
            view_options = {
                show_hidden = true,
            },
        },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>j",
                function()
                    require("flash").jump()
                end,
                mode = { "n", "x", "o" },
                desc = "Flash jump",
            },
            {
                "<leader>J",
                function()
                    require("flash").treesitter()
                end,
                mode = { "n", "x", "o" },
                desc = "Flash treesitter",
            },
        },
    },
}
