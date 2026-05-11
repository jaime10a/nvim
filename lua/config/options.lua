local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = ","

local function prepend_path(path)
    if vim.fn.isdirectory(path) == 1 and not vim.env.PATH:find(path, 1, true) then
        vim.env.PATH = path .. ":" .. vim.env.PATH
    end
end

prepend_path(vim.fn.expand("~/.local/share/mise/installs/node/lts/bin"))
prepend_path(vim.fn.stdpath("data") .. "/mason/bin")

opt.number = true
opt.relativenumber = true
opt.numberwidth = 4

opt.clipboard = "unnamedplus"

opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.smartindent = true

opt.splitbelow = true
opt.splitright = true
opt.wrap = false
opt.breakindent = true
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.mouse = "a"

opt.showmode = false
opt.showtabline = 1
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"

opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 500
