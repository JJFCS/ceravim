
vim.g.mapleader = " "

-- themes & transparency
vim.cmd.colorscheme("wildcharm")  -- some other good ones : sorbet or wildcharm

-- basics settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = true  -- TODO .. how can we include a wrap character like in helix?
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4 ; vim.opt.expandtab = true ; vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- search settings
vim.opt.smartcase = true ; vim.opt.ignorecase = true
vim.opt.incsearch = true ; vim.opt.hlsearch = true

-- visual settings
vim.opt.termguicolors = true
vim.opt.colorcolumn = "100" ; vim.opt.signcolumn = "yes"
vim.opt.showmatch = true
vim.opt.completeopt = "menuone,noinsert,noselect"

-- file handling
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.updatetime = 50

-- behavior settings
vim.opt.hidden = true
vim.opt.clipboard:append("unnamedplus")  -- TODO .. this uses the system's clipboard. want?

