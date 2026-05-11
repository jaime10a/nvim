local map = vim.keymap.set

map("n", "{", "{zz", { desc = "Previous paragraph and center" })
map("n", "}", "}zz", { desc = "Next paragraph and center" })
map("n", "N", "Nzzzv", { desc = "Previous search result and center" })
map("n", "n", "nzzzv", { desc = "Next search result and center" })
map("n", "<C-i>", "<C-i>zz", { desc = "Jump forward and center" })
map("n", "<C-o>", "<C-o>zz", { desc = "Jump back and center" })
map("n", "*", "*zzzv", { desc = "Search word forward and center" })
map("n", "#", "#zzzv", { desc = "Search word backward and center" })
map("n", "]m", "]mzz", { desc = "Next method and center" })
map("n", "[m", "[mzz", { desc = "Previous method and center" })

map("n", "U", "<C-r>", { desc = "Redo" })
map("n", "<leader>n", "<cmd>set relativenumber!<cr>", { desc = "Toggle relative numbers" })
map("n", "H", "^", { desc = "First non-blank character" })
map("n", "L", "$", { desc = "End of line" })
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

map("n", "<leader>q", "<cmd>wqa<cr>", { desc = "Write and quit all" })
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Write file" })

map("n", "<Up>", "<cmd>wincmd k<cr>", { desc = "Move to upper window" })
map("n", "<Down>", "<cmd>wincmd j<cr>", { desc = "Move to lower window" })
map("n", "<Left>", "<cmd>wincmd h<cr>", { desc = "Move to left window" })
map("n", "<Right>", "<cmd>wincmd l<cr>", { desc = "Move to right window" })

map("n", "<C-Up>", "<cmd>resize -2<cr>", { desc = "Shrink window height" })
map("n", "<C-Down>", "<cmd>resize +2<cr>", { desc = "Grow window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Shrink window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Grow window width" })

map("v", "J", ":move '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "K", ":move '<-2<cr>gv=gv", { desc = "Move selection up" })

map("n", "<C-S>", ":%s/", { desc = "Substitute in file" })
map("n", "<leader>gf", "<cmd>edit <cfile><cr>", { desc = "Edit file under cursor" })
map("n", "<Tab>", "<C-^>zz", { desc = "Alternate buffer" })

map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })
map("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
map("n", "<leader>xx", vim.diagnostic.setqflist, { desc = "Diagnostics quickfix" })
map("n", "<leader>xd", vim.diagnostic.setloclist, { desc = "Diagnostics loclist" })
map("n", "<leader>X", "<cmd>cclose<bar>lclose<cr>", { desc = "Close diagnostic lists" })
