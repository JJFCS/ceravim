
--** TODO
-- NIL
--**


vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- themes & transparency
vim.cmd.colorscheme("catppuccin")

-- basics settings
vim.opt.number = true ; vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "‡ "
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.selection = "exclusive"

-- indentation & whitespaces
vim.opt.tabstop = 8
vim.opt.softtabstop = 8 ; vim.opt.expandtab = false ; vim.opt.shiftwidth = 8
vim.opt.smartindent = true ; vim.opt.breakindent = true

vim.g.python_recommended_style = 0  -- disable's PYTHON's indentation overrides

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- search settings
vim.opt.smartcase = true ; vim.opt.ignorecase = true
vim.opt.incsearch = true ; vim.opt.hlsearch = false

-- visual settings
vim.opt.termguicolors = true
vim.opt.colorcolumn = "100" ; vim.opt.cursorline = true
vim.opt.completeopt = "menuone,noinsert,noselect" ; vim.opt.signcolumn = "yes"

-- file handling
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.updatetime = 50

-- behavior settings
vim.opt.hidden = true
vim.opt.clipboard:append("unnamedplus")  -- TODO .. this uses the system's clipboard. want?
vim.opt.path:append("**")
vim.opt.isfname:append("@-@")
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"  -- preview substitutions live as you type!
vim.opt.timeoutlen = 1000

-- tabs
vim.opt.showtabline = 2  -- (0 = never or 1 = when there are multiple tabs or 2 = always)
vim.opt.tabline = ""  -- default tabline (empty string uses the default)

-- custom netrw
require("onncera.netrw")

-- neovim gui
require("onncera.neovide")

