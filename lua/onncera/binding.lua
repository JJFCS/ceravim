
--** TODO
-- make sure the whole file and bindings are good
-- modes arrangement would be better i believe . continue from cut copy paste section
--**


-- emulating emacs bindings into neovim
-- ============================================================
local f = require("onncera.bespoke")


-- INSERT MODE
vim.keymap.set("i", "<C-g>", "<C-o>")  -- use one normal mode command then puts us back into insert mode
vim.keymap.set("i", "<C-l>", "<C-o>zz", { desc = "center the current line" })
vim.keymap.set("i", "<C-a>", f.onncera_beg_of_line_insert, { expr = true, desc = "toggle beg of line" })
vim.keymap.set("i", "<C-e>", "<End>")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "<C-d>", "<Del>")
-- how CTRL-N and CTRL-p behave when there is an autocomplete popup menu visible vs when there isn't
vim.keymap.set("i", "<C-n>", "<Down>") ; vim.keymap.set("i", "<C-p>", "<up>")
vim.keymap.set("i", "<C-b>", "<Left>") ; vim.keymap.set("i", "<C-f>", "<Right>")
vim.keymap.set("i", "<M-f>", "<C-Right>") ; vim.keymap.set("i", "<M-b>", "<C-Left>")


-- NORMAL MODE
vim.keymap.set("n", "<C-b>", "h") ; vim.keymap.set("n", "<C-n>", "j") ; vim.keymap.set("n", "<C-p>", "k") ; vim.keymap.set("n", "<C-f>", "l")
vim.keymap.set("n", "<C-a>", f.onncera_beg_of_line, { expr = true, desc = "toggle beg of line" }) ; vim.keymap.set("n", "<C-e>", "$")
vim.keymap.set("n", "<M-f>", "e")
vim.keymap.set("n", "<M-b>", "b")
vim.keymap.set("n", "<C-l>", "zz", { desc = "center current line" })
vim.keymap.set("n", "<M-d>", "de", { desc = "boom through the next word end" })
vim.keymap.set("n", "<C-d>", "x")
vim.keymap.set("n", "<C-h>", "X")

vim.keymap.set("n", "<C-Space>", "v")  -- like setting a mark in emacs
vim.keymap.set("n", "<M-up>", "<C-u>zz", { desc = "prev page and recenter" }) ; vim.keymap.set("n", "<M-down>", "<C-d>zz", { desc = "next page and recenter" })
vim.keymap.set("n", "<C-Up>", "{", { desc = "backward paragraph" }) ; vim.keymap.set("n", "<C-Down>", "}", { desc = "forwards paragraph" })


-- VISUAL MODE
vim.keymap.set("x", "<C-b>", "h") ; vim.keymap.set("x", "<C-n>", "j") ; vim.keymap.set("x", "<C-p>", "k") ; vim.keymap.set("x", "<C-f>", "l")
vim.keymap.set("x", "<C-a>", f.onncera_beg_of_line, { expr = true, desc = "toggle beg of line" }) ; vim.keymap.set("x", "<C-e>", "$")
vim.keymap.set("x", "<M-f>", "e")
vim.keymap.set("x", "<M-b>", "b")
vim.keymap.set("x", "<C-l>", "zz",  { desc = "center the current line" })

vim.keymap.set("x", "<C-Space>", "<C-\\><C-n>", { desc = "end the selection" })
vim.keymap.set("x", "<M-up>", "<C-b>", { desc = "extend up a page" }) ; vim.keymap.set("x", "<M-down>",  "<C-f>", { desc = "extend down a page" })
vim.keymap.set("x", "<C-Up>", "{", { desc = "backward paragraph" }) ; vim.keymap.set("x", "<C-Down>", "}", { desc = "forwards paragraph" })


-- cut , copy , paste
vim.keymap.set("n", "<C-y>", '"+P', { desc = "paste from system clipboard" })
vim.keymap.set("x", "<C-y>", '"+P', { desc = "paste from system clipboard" })
vim.keymap.set("n", "<C-k>", f.onncera_kill_line, { expr = true, desc = "cut to the end of the line" })
vim.keymap.set("x", "<C-w>", "d", { desc = "boom selected text" })
vim.keymap.set("x", "<M-w>", "y", { desc = "copy selected text" })
vim.keymap.set("i", "<C-o>", "<Esc>O", { desc = "open line at cursor" })
vim.keymap.set("n", "<M-Backspace>", "db", { desc = "delete backward a word" })
vim.keymap.set("n", "<C-o>", "O<Esc>", { desc = "open line at cursor" })


-- undo/redo. enter starts and undo block for the new line
vim.keymap.set("n", "<C-/>", "<Cmd>undo<CR>", { desc = "undo" })
vim.keymap.set("x", "<C-/>", "<Cmd>undo<CR>", { desc = "undo" })
vim.keymap.set("i", "<C-/>", "<Esc><Cmd>undo<CR>i", { desc = "undo and resume Insert mode" })
vim.keymap.set("n", "<C-S-/>", "<Cmd>redo<CR>", { desc = "redo" })
vim.keymap.set("x", "<C-S-/>", "<Cmd>redo<CR>", { desc = "redo" })
vim.keymap.set("i", "<C-S-/>", "<Esc><Cmd>redo<CR>i", { desc = "redo and resume Insert mode" })
vim.keymap.set("i", "<CR>", "<C-g>u<CR>", { desc = "newline and a new undo block" })  -- every time we return a new line , we create an undo checkpoint .. this gives us a more granular undo and not big chunks


-- window commands
vim.keymap.set({ "n", "x" }, "<C-x>0", "<Cmd>confirm close<CR>", { desc = "close this window" })
vim.keymap.set({ "n", "x" }, "<C-x>1", "<Cmd>only<CR>", { desc = "keep only this window" })
vim.keymap.set({ "n", "x" }, "<C-x>o", "<Cmd>wincmd w<CR>", { desc = "focus the next window" })


-- clear multicursor
vim.keymap.set('n', '<C-q>', function()
	vim.api.nvim_buf_clear_namespace(0, vim.api.nvim_create_namespace 'nvim.multicursor', 0, -1)
end, { desc = 'clear multicursors' })


-- non emacs binds
-- ============================================================
vim.keymap.set("n", "J", "mzJ`z")  -- join lines . taken from theprimeagen
vim.keymap.set("n", "n", "nzzzv")  -- isearch but allows you to stay in the center of the screen
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>")
vim.keymap.set("n", "<leader>fp", f.onncera_copy_filepath)
vim.keymap.set("n", "<leader>sb", f.onncera_speedbar_toggle)

vim.keymap.set("v", "<", "<gv", { desc = "indent lefts and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "indent right and reselect" })
vim.keymap.set("n", "<leader><leader>", function()  -- sources the current file as a nvim config
	vim.cmd("so")
end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")  -- like emacs move text
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")  -- from theprimeagen

vim.keymap.set("n", "<leader>vv", "v",     { desc = "visual chars mode" })
vim.keymap.set("x", "<leader>vv", "v",     { desc = "visual chars mode" })
vim.keymap.set("n", "<leader>vl", "V",     { desc = "visual lines mode" })
vim.keymap.set("x", "<leader>vl", "V",     { desc = "visual lines mode" })
vim.keymap.set("n", "<leader>vb", "<C-v>", { desc = "visual block mode" })
vim.keymap.set("x", "<leader>vb", "<C-v>", { desc = "visual block mode" })

