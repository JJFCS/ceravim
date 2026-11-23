
--** TODO
-- make sure the whole file and bindings are good . continue from file buffers section
--**


-- emulating emacs bindings into neovim
-- ============================================================
local f = require("onncera.bespoke")


-- this is going to get me cancelled
vim.keymap.set("c", "<C-g>", "<C-c>")
vim.keymap.set("i", "<C-g>", "<Esc>")
vim.keymap.set("n", "<C-g>", "<Esc>")
vim.keymap.set("o", "<C-g>", "<Esc>")
vim.keymap.set("v", "<C-g>", "<Esc>")
vim.keymap.set("t", "<C-g>", "<C-\\><C-n>")


-- normal mode
vim.keymap.set("n", "<C-b>", "h")
vim.keymap.set("n", "<C-n>", "j")
vim.keymap.set("n", "<C-p>", "k")
vim.keymap.set("n", "<C-f>", "l")
vim.keymap.set("n", "<C-a>", f.onncera_beg_of_line, { expr = true, desc = "toggle beg of line" })
vim.keymap.set("n", "<C-e>", "$")

vim.keymap.set("n", "<C-d>", "x", { desc = "delete forwards a character" })
vim.keymap.set("n", "<C-h>", "X", { desc = "delete backward a character" })

vim.keymap.set("n", "<M-f>", "e")
vim.keymap.set("n", "<M-b>", "b")

vim.keymap.set("n", "<C-Space>", "v")  -- like setting a mark in emacs
vim.keymap.set("n", "<C-v>", "<C-d>zz", { desc = "next page and recenter" })
vim.keymap.set("n", "<M-v>", "<C-u>zz", { desc = "prev page and recenter" })

vim.keymap.set("n", "<M-d>", "de", { desc = "boom through the next word end" })
vim.keymap.set("n", "<C-l>", "zz", { desc = "center current line" })
vim.keymap.set("n", "<M-S-,>", f.onncera_beg_of_buffer, { desc = "beg of buffer" })
vim.keymap.set("n", "<M-S-.>", f.onncera_end_of_buffer, { desc = "end of buffer" })


-- visual mode
vim.keymap.set("x", "<C-b>", "h")
vim.keymap.set("x", "<C-n>", "j")
vim.keymap.set("x", "<C-p>", "k")
vim.keymap.set("x", "<C-f>", "l")
vim.keymap.set("x", "<C-a>", f.onncera_beg_of_line, { expr = true, desc = "toggle beg of line" })
vim.keymap.set("x", "<C-e>", "$")

vim.keymap.set("x", "<M-f>", "e")
vim.keymap.set("x", "<M-b>", "b")

vim.keymap.set("x", "<C-Space>", "<C-\\><C-n>", { desc = "end the selection" })
vim.keymap.set("x", "<C-v>", "<C-f>", { desc = "extend down a page" })
vim.keymap.set("x", "<M-v>", "<C-b>", { desc = "extend up a page" })

vim.keymap.set("x", "<C-l>", "zz",  { desc = "center the current line" })
vim.keymap.set("x", "<M-S-,>", f.onncera_beg_of_buffer, { desc = "extend to the beg of the buffer" })
vim.keymap.set("x", "<M-S-.>", f.onncera_end_of_buffer, { desc = "extend to the end of the buffer" })

vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv")  -- like emacs move text
vim.keymap.set("v", "<M-Up>",   ":m '<-2<CR>gv=gv")  -- from theprimeagen


-- insert mode
vim.keymap.set("i", "<C-a>", f.onncera_beg_of_line_insert, { expr = true, desc = "toggle beg of line" })
vim.keymap.set("i", "<C-f>", "<Right>", { desc = "go forward a character" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "end of line" }) ; vim.keymap.set("i", "<C-b>", "<Left>", { desc = "go back a character" })

-- how CTRL-N and CTRL-p behave when there is an autocomplete popup menu visible vs when there isn't
vim.keymap.set("i", "<C-n>", f.onncera_next_line, { expr = true, desc = "next suggestion or line" })
vim.keymap.set("i", "<C-p>", f.onncera_prev_line, { expr = true, desc = "prev suggestion or line" })

vim.keymap.set("i", "<M-b>", "<C-Left>") ; vim.keymap.set("i", "<M-f>", "<C-Right>")
vim.keymap.set("i", "<C-l>", "<C-\\><C-o>zz",  { desc = "center the current line" })

vim.keymap.set("i", "<C-d>", "<Del>", { desc = "delete forwards a character" })
vim.keymap.set("i", "<C-h>", "<Backspace>", { desc = "delete backward a character" })


-- cut , copy , paste
vim.keymap.set("n", "<C-y>", '"+P', { desc = "paste from system clipboard" })
vim.keymap.set("x", "<C-y>", '"+P', { desc = "paste from system clipboard" })
vim.keymap.set("n", "<C-k>", f.onncera_kill_line, { expr = true, desc = "cut to the end of the line" })
vim.keymap.set("x", "<C-w>", "d", { desc = "boom selected text" })
vim.keymap.set("x", "<M-w>", "y", { desc = "copy selected text" })
vim.keymap.set("i", "<C-o>", "<Esc>O", { desc = "open line at cursor" })
vim.keymap.set("i", "<M-Backspace>", "<C-w>", { desc = "delete backward a word" })
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


-- i love this navigation keybinds
vim.keymap.set("n", "<C-Down>", "}", { desc = "forwards paragraph" })
vim.keymap.set("x", "<C-Down>", "}", { desc = "forwards paragraph" })
vim.keymap.set("n", "<C-Up>", "{", { desc = "backward paragraph" })
vim.keymap.set("x", "<C-Up>", "{", { desc = "backward paragraph" })


-- case management
vim.keymap.set("x", "<C-x><C-u>", "U", { desc = "Uppercase selected text" })
vim.keymap.set("x", "<C-x><C-l>", "u", { desc = "Lowercase selected text" })
vim.keymap.set("n", "<C-x><C-u>", "gUiw", { desc = "Uppercase the current word" })
vim.keymap.set("n", "<C-x><C-l>", "guiw", { desc = "Lowercase the current word" })


-- window commands
vim.keymap.set({ "n", "x" }, "<C-x>0", "<Cmd>confirm close<CR>", { desc = "close this window" })
vim.keymap.set({ "n", "x" }, "<C-x>1", "<Cmd>only<CR>", { desc = "keep only this window" })
vim.keymap.set({ "n", "x" }, "<C-x>o", "<Cmd>wincmd w<CR>", { desc = "focus the next window" })


-- keyboard macros TODO
-- TODO .. CTRL-g should cancel the recording
vim.keymap.set("n", "<C-x>(", "qq", { desc = "start recording a macro in register q" })
vim.keymap.set("n", "<C-x>)", [[reg_recording() != '' ? 'q' : '']], { expr = true, desc = "stop recording the macro" })
vim.keymap.set("n", "<C-x>e", "@q", { desc = "replay the macro in register q" })


-- non emacs binds
-- ============================================================
local clear_mc = '<Cmd>lua require("onncera.bespoke").onncera_clear_mc()<CR>'
vim.keymap.set("n", "<leader>mc", clear_mc, { desc = "clear multicursors" })

vim.keymap.set("n", "J", "mzJ`z")  -- join lines . taken from theprimeagen
vim.keymap.set("n", "n", "nzzzv")  -- isearch but allows you to stay in the center of the screen
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('n', '<leader>tn', ":tabnew<CR>", { desc = 'new tab' })
vim.keymap.set('n', '<leader>tx', ":tabclose<CR>", { desc = 'close tab' })
vim.keymap.set('n', '<leader>to', f.onncera_open_file_in_tab, { desc = 'open file in new tab' })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "prev buffer" })
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "find file" })
vim.keymap.set("n", "<leader>fe", ":Explore<CR>", { desc = "open file explorer" })
vim.keymap.set("n", "<leader>sb", f.onncera_speedbar_toggle, { desc = "open file side explorer" })

vim.keymap.set("v", "<", "<gv", { desc = "indent lefts and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "indent right and reselect" })
vim.keymap.set("n", "<leader><leader>", function()  -- sources the current file as a nvim config
	vim.cmd("so")
end)
vim.keymap.set("n", "<leader>fp", f.onncera_copy_file_path, { desc = "copy absolute file path" })


-- cancel unfinished emacs style command prefixes
local prefixes = {
	"<C-x>",
	"<leader>",
	"<leader>b",
	"<leader>f",
	"<leader>s",
	"<leader>t",
}

for _, prefix in ipairs(prefixes) do
	vim.keymap.set({ "n", "x" }, prefix .. "<C-g>", "<Esc>", {
		desc = "Cancel pending prefix"
	})
end

