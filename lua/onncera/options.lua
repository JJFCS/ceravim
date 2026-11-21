
vim.g.mapleader = " "

-- themes & transparency
vim.cmd.colorscheme("catppuccin")  -- TODO .. find other themes - wildcharm (built in)

-- basics settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.showbreak = "‡ "
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.selection = "exclusive"

-- indentation & whitespaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4 ; vim.opt.expandtab = false ; vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.g.python_recommended_style = 0  -- disable's PYTHON's indentation overrides

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- search settings
vim.opt.smartcase = true ; vim.opt.ignorecase = true
vim.opt.incsearch = true ; vim.opt.hlsearch = false

-- visual settings
vim.opt.termguicolors = true
vim.opt.colorcolumn = "100" ; vim.opt.signcolumn = "yes"
vim.opt.showmatch = false
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

