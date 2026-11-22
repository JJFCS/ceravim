
-- TODO .. make sure the whole file and bindings are good

-- ============================================================
-- emulating emacs bindings into neovim
-- ============================================================


local f = require("onncera.bespoke")
local clear_mc = '<Cmd>lua require("onncera.mc").clear()<CR>'


-- let me gooo
vim.keymap.set("i", "<C-g>", "<Esc>" .. clear_mc, { desc = "complete editing then clear cursors" })
vim.keymap.set("n", "<C-g>", clear_mc .. "<Esc>", { desc = "clear cursors and exit to Normal" })
vim.keymap.set("o", "<C-g>", clear_mc .. "<Esc>", { desc = "clear cursors and exit to Normal" })
vim.keymap.set("v", "<C-g>", clear_mc .. "<Esc>", { desc = "clear cursors and exit to Normal" })
vim.keymap.set("c", "<C-g>", clear_mc .. "<C-c>", { desc = "clear cursors and cancel command line" })
vim.keymap.set("t", "<C-g>", clear_mc .. "<C-\\><C-n>", { desc = "clear cursors and exit Terminal mode" })


-- normal mode
vim.keymap.set("n", "<C-b>", "h", { desc = "go back a character" })
vim.keymap.set("n", "<C-n>", "j", { desc = "go down one line" })
vim.keymap.set("n", "<C-p>", "k", { desc = "go up one line" })
vim.keymap.set("n", "<C-f>", "l", { desc = "go forward a character" })
vim.keymap.set("n", "<C-a>", f.onncera_beg_of_line, { expr = true, desc = "toggle beg of line" })
vim.keymap.set("n", "<C-e>", "$", { desc = "end of line" })

vim.keymap.set("n", "<M-f>", "w", { desc = "moves the cursor forwards to the start of the next word" })
vim.keymap.set("n", "<M-b>", "b", { desc = "moves the cursor backward to the start of the previous word" })

vim.keymap.set("n", "<C-Space>", "v", { desc = "start a character selection" })  -- like setting a mark in emacs
vim.keymap.set("n", "<C-v>", "<C-d>zz", { desc = "next page" })
vim.keymap.set("n", "<M-v>", "<C-u>zz", { desc = "prev page" })

vim.keymap.set("n", "<M-d>", "dw", { desc = "boom through the next word end" })
vim.keymap.set("n", "<C-l>", "zz", { desc = "center current line" })
vim.keymap.set("n", "<M-S-,>", f.onncera_beg_of_buffer, { desc = "beg of buffer" })
vim.keymap.set("n", "<M-S-.>", f.onncera_end_of_buffer, { desc = "end of buffer" })


-- visual mode
vim.keymap.set("x", "<C-b>", "h", { desc = "extend back a character" })
vim.keymap.set("x", "<C-n>", "j", { desc = "extend down one line" })
vim.keymap.set("x", "<C-p>", "k", { desc = "extend up one line" })
vim.keymap.set("x", "<C-f>", "l", { desc = "extend forward a character" })
vim.keymap.set("x", "<C-a>", f.onncera_beg_of_line, { expr = true, desc = "toggle beg of line" })
vim.keymap.set("x", "<C-e>", "$", { desc = "extend to the end of the line" })

vim.keymap.set("x", "<M-f>", "e", { desc = "extend through the next word end" })
vim.keymap.set("x", "<M-b>", "b", { desc = "extend back to the prev word start" })

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

-- <C-\\><C-o> lets us execute one normal mode command then return to insert mode (TODO .. mc)
vim.keymap.set("i", "<M-f>", "<C-Right>", { desc = "forwards to a word end" })
vim.keymap.set("i", "<M-b>", "<C-Left>",  { desc = "backward to a word start" })

vim.keymap.set("i", "<C-Space>", "<C-\\><C-o>v", { desc = "start a character selection" })
vim.keymap.set("i", "<C-v>", "<C-\\><C-o><C-f>", { desc = "next page" })
vim.keymap.set("i", "<M-v>", "<C-\\><C-o><C-b>", { desc = "prev page" })

vim.keymap.set("i", "<C-l>", "<C-\\><C-o>zz",  { desc = "center the current line" })
vim.keymap.set("i", "<M-S-,>", f.onncera_beg_of_buffer, { desc = "beg of buffer" })
vim.keymap.set("i", "<M-S-.>", f.onncera_end_of_buffer, { desc = "end of buffer" })

-- how CTRL-N and CTRL-p behave when there is an autocomplete popup menu visible vs when there isn't
vim.keymap.set("i", "<C-n>", f.onncera_next_line, { expr = true, desc = "next suggestion or line" })
vim.keymap.set("i", "<C-p>", f.onncera_prev_line, { expr = true, desc = "prev suggestion or line" })


-- cut , copy , paste , using vim registers. Visual P preserves the pasted register
-- removing conflicting CTRL-W diagnostic mappings
for _, key in ipairs({ "<C-w>d", "<C-w><C-d>" }) do
	if vim.fn.maparg(key, "n") ~= "" then
		vim.keymap.del("n", key)
	end
end

vim.keymap.set("n", "<C-y>", '"+P', { desc = "paste from system clipboard" })
vim.keymap.set("x", "<C-y>", '"+P', { desc = "paste from system clipboard" })

vim.keymap.set("n", "<C-w>", "diw", { desc = "boom the word under the cursor" })
vim.keymap.set("n", "<M-w>", "yiw", { desc = "copy the word under the cursor" })
vim.keymap.set("n", "<C-d>", "x", { desc = "delete forwards a character" })
vim.keymap.set("n", "<C-h>", "X", { desc = "delete backward a character" })
vim.keymap.set("n", "<C-k>", f.onncera_kill_line, { expr = true, desc = "cut to the end of the line" })

vim.keymap.set("x", "<C-w>", "d", { desc = "boom selected text" })
vim.keymap.set("x", "<M-w>", "y", { desc = "copy selected text" })

vim.keymap.set("i", "<C-w>", "<C-w>", { desc = "delete backward a word" })
vim.keymap.set("i", "<C-d>", "<Del>", { desc = "delete forwards a character" })
vim.keymap.set("i", "<C-h>", "<Backspace>", { desc = "delete backward a character" })
vim.keymap.set("i", "<M-d>", "<Esc>lce", { desc = "cut forward through a word end" })
vim.keymap.set("i", "<M-Backspace>", "<C-w>", { desc = "delete backward a word" })
vim.keymap.set("i", "<C-y>", f.onncera_yanks, { expr = true, desc = "accept suggestion or yank" })


-- this is for inserting/opening a new line
vim.keymap.set("i", "<C-o>", f.onncera_open_line, { desc = "Open line at cursor" })
vim.keymap.set("n", "<C-o>", f.onncera_open_line, { desc = "Open line at cursor" })
-- this is for visual mode .. first exits visual mode
vim.keymap.set("x", "<C-o>", function()
    vim.api.nvim_feedkeys(vim.keycode("<Esc>"), "nx", false)
    onncera_open_line()
end, { desc = "Open line at selection end" })


-- undo/redo. enter starts and undo block for the new line
vim.keymap.set("n", "<C-/>", "<Cmd>undo<CR>", { desc = "undo" })
vim.keymap.set("x", "<C-/>", "<Cmd>undo<CR>", { desc = "undo" })
vim.keymap.set("i", "<C-/>", "<Esc><Cmd>undo<CR>i", { desc = "undo and resume Insert mode" })
vim.keymap.set("n", "<C-S-/>", "<Cmd>redo<CR>", { desc = "redo" })
vim.keymap.set("x", "<C-S-/>", "<Cmd>redo<CR>", { desc = "redo" })
vim.keymap.set("i", "<C-S-/>", "<Esc><Cmd>redo<CR>i", { desc = "redo and resume Insert mode" })
vim.keymap.set("i", "<CR>", "<C-g>u<CR>", { desc = "newline and a new undo block" })  -- every time we return a new line , we create an undo checkpoint .. this gives us a more granular undo and not big chunks


-- searching like isearch
vim.keymap.set("n", "<C-s>", "nzzzv")
vim.keymap.set("n", "<C-r>", "Nzzzv")


-- M-x and command line editing
vim.keymap.set("n", "<M-x>", ":",      { desc = "run a command" })
vim.keymap.set("x", "<M-x>", "<Esc>:", { desc = "run a command" })
vim.keymap.set("i", "<M-x>", "<Esc>:", { desc = "run a command" })
vim.keymap.set("c", "<C-y>", "<C-r>+", { desc = "paste the unnamed register" })
vim.keymap.set("c", "<C-k>", f.onncera_kill_cmd_line, { expr = true, desc = "delete to end cmd line" })
vim.keymap.set("c", "<C-s>", "<C-g>", { desc = "visit the next incremental search match" })
vim.keymap.set("c", "<C-r>", f.onncera_reverse_search_cmd_line, {
	expr = true,
	desc = "prev search match or insert register"
})


-- i love this navigation keybinds
vim.keymap.set("n", "<C-Down>", "}", { desc = "forwards paragraph" })
vim.keymap.set("x", "<C-Down>", "}", { desc = "forwards paragraph" })
vim.keymap.set("n", "<C-Up>", "{", { desc = "backward paragraph" })
vim.keymap.set("x", "<C-Up>", "{", { desc = "backward paragraph" })
vim.keymap.set("i", "<C-Down>", "<C-\\><C-o>}", { desc = "forwards paragraph" })
vim.keymap.set("i", "<C-Up>", "<C-\\><C-o>{", { desc = "backward paragraph" })


-- mc's
local mc = require("onncera.mc")
-- note F33 is equivalent to CTRL-F9 , F34 is CTRL-f10 , etc...
vim.keymap.set("n", "<F33>", mc.mark_previous, { desc = "mark previous occurrence or line" })
vim.keymap.set("x", "<F33>", mc.mark_previous, { desc = "mark previous occurrence or line" })
vim.keymap.set("n", "<F34>", mc.mark_next, { desc = "mark next occurrence or line" })
vim.keymap.set("x", "<F34>", mc.mark_next, { desc = "mark next occurrence or line" })
vim.keymap.set("n", "<F35>", mc.skip_previous, { desc = "skip to previous occurrence or line" })
vim.keymap.set("x", "<F35>", mc.skip_previous, { desc = "skip to previous occurrence or line" })
vim.keymap.set("n", "<F36>", mc.skip_next, { desc = "skip to next occurrence or line" })
vim.keymap.set("x", "<F36>", mc.skip_next, { desc = "skip to next occurrence or line" })

f.onncera_map_insert_mc("<F33>", "mark_previous") -- Ctrl-F09
f.onncera_map_insert_mc("<F34>", "mark_next")     -- Ctrl-F10
f.onncera_map_insert_mc("<F35>", "skip_previous") -- Ctrl-F11
f.onncera_map_insert_mc("<F36>", "skip_next")     -- Ctrl-F12


-- case management
vim.keymap.set("x", "<C-x><C-u>", "U", { desc = "Uppercase selected text" })
vim.keymap.set("x", "<C-x><C-l>", "u", { desc = "Lowercase selected text" })
vim.keymap.set("n", "<C-x><C-u>", "gUiw", { desc = "Uppercase the current word" })
vim.keymap.set("n", "<C-x><C-l>", "guiw", { desc = "Lowercase the current word" })


-- file , buffer , and window commands (perhaps include in the future) todo
-- vim.keymap.set({ "n", "x", "i" }, "<C-x>k", "<Cmd>confirm bdelete<CR>", { desc = "Close this buffer" })
-- vim.keymap.set({ "n", "x", "i" }, "<C-x>0", "<Cmd>confirm close<CR>", { desc = "Close this window" })
-- vim.keymap.set({ "n", "x", "i" }, "<C-x>1", "<Cmd>only<CR>", { desc = "Keep only this window" })
-- vim.keymap.set({ "n", "x", "i" }, "<C-x>o", "<Cmd>wincmd w<CR>", { desc = "Focus the next window" })
-- vim.keymap.set("n", "<C-x><C-f>", ":edit ", { desc = "Open a file" })
-- vim.keymap.set("x", "<C-x><C-f>", "<Esc>:edit ", { desc = "Open a file" })
-- vim.keymap.set("i", "<C-x><C-f>", "<Esc>:edit ", { desc = "Open a file" })
-- vim.keymap.set("n", "<C-x>b", ":buffer ", { desc = "Choose a buffer with completion" })
-- vim.keymap.set("x", "<C-x>b", "<Esc>:buffer ", { desc = "Choose a buffer with completion" })
-- vim.keymap.set("i", "<C-x>b", "<Esc>:buffer ", { desc = "Choose a buffer with completion" })
-- vim.keymap.set({ "n", "x", "i" }, "<C-x><C-b>", "<Cmd>buffers<CR>", { desc = "List buffers" })


-- keyboard macros TODO


-- ============================================================
-- non emacs binds
-- ============================================================


vim.keymap.set("n", "J", "mzJ`z")  -- join lines . taken from theprimeagen
vim.keymap.set('n', '<leader>tn', ":tabnew<CR>", { desc = 'new tab' })
vim.keymap.set('n', '<leader>tx', ":tabclose<CR>", { desc = 'close tab' })
vim.keymap.set('n', '<leader>to', f.onncera_open_file_in_tab, { desc = 'open file in new tab' })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "prev buffer" })
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "find file" })
vim.keymap.set("n", "<leader>fe", ":Explore<CR>", { desc = "open file explorer" })
vim.keymap.set("v", "<", "<gv", { desc = "indent lefts and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "indent right and reselect" })
vim.keymap.set("n", "<leader><leader>", function()  -- sources the current file as a nvim config
	vim.cmd("so")
end)
vim.keymap.set("n", "<leader>fp", f.onncera_copy_file_path, { desc = "copy absolute file path" })

-- floating terminal
local ft = require("onncera.ft")
vim.keymap.set("n", "<leader>ft", ft.FloatingTerminal, { noremap = true, silent = true, desc = "toggle floating terminal" })
vim.keymap.set("t", "<C-g>", ft.CloseFloatingTerminal, { noremap = true, silent = true, desc = "close floating terminal from terminal mode" })


-- toggle comments and reindents
-- > decided to not bind anything to these
-- > time to make use of the defaults : "gcc" or "gc" or "==" or "="
-- > on most occasions visual mode (x) will use one less binding than normal mode so gcc becomes gc


-- TODO .. i think this is about quickfix list .. taken from theprimeagen
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

