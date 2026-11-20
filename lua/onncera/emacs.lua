
-- emulating emacs keybinds into neovim MUAHAHAHA
-- custom functions
local function onncera_beg_of_buffer()
    -- moves the cursor to the absolute beg of the current buffer
    vim.api.nvim_win_set_cursor(0, { 1, 0 })
end

local function onncera_end_of_buffer()
    -- moves the cursor to the absolute end of the current buffer
    local last_line = vim.api.nvim_buf_line_count(0)
    local text = vim.api.nvim_buf_get_lines(0, last_line - 1, last_line, false)[1]
    local last_cols = #text  -- this gets the length of the string in bytes

    vim.api.nvim_win_set_cursor(0, { last_line, last_cols })
end


vim.keymap.set("c", "<C-g>", "<Esc>", { desc = "EXIT command-line MODE"})
vim.keymap.set("i", "<C-g>", "<Esc>", { desc = "EXIT insert MODE"})
vim.keymap.set("n", "<C-g>", "<Esc>", { desc = "EXIT normal MODE"})
vim.keymap.set("o", "<C-g>", "<C-\\><C-n>", { desc = "EXIT operator-pending MODE"})
vim.keymap.set("t", "<C-g>", "<C-\\><C-n>", { desc = "EXIT terminal MODE"})  -- this exits terminal mode
vim.keymap.set("v", "<C-g>", "<Esc>", { desc = "EXIT visual MODE"})


-- normal mode
vim.keymap.set("n", "<C-b>", "h", { desc = "go back a character" })
vim.keymap.set("n", "<C-n>", "j", { desc = "go down one line" })
vim.keymap.set("n", "<C-p>", "k", { desc = "go up one line" })
vim.keymap.set("n", "<C-f>", "l", { desc = "go forward a character" })
vim.keymap.set("n", "<C-a>", "0", { desc = "beg of line" })  -- TODO .. how to toggle beg of line & first char?
vim.keymap.set("n", "<C-e>", "$", { desc = "end of line" })

vim.keymap.set("n", "<M-f>", "w", { desc = "moves the cursor forwards to the start of the next word" })
vim.keymap.set("n", "<M-b>", "b", { desc = "moves the cursor backward to the start of the previous word" })
vim.keymap.set("n", "<M-{>", "{", { desc = "prev paragraph" })
vim.keymap.set("n", "<M-}>", "}", { desc = "next paragraph" })

vim.keymap.set("n", "<C-Space>", "v", { desc = "start a character selection" })  -- like setting a mark in emacs
vim.keymap.set("n", "<C-v>", "<C-f>", { desc = "next page" })
vim.keymap.set("n", "<M-v>", "<C-b>", { desc = "prev page" })

vim.keymap.set("n", "<C-l>", "zz",  { desc = "center current line" })
vim.keymap.set("n", "<M-S-,>", onncera_beg_of_buffer, { desc = "beg of buffer" })
vim.keymap.set("n", "<M-S-.>", onncera_end_of_buffer, { desc = "end of buffer" })


-- visual mode
vim.keymap.set("x", "<C-b>", "h", { desc = "extend back a character" })
vim.keymap.set("x", "<C-n>", "j", { desc = "extend down one line" })
vim.keymap.set("x", "<C-p>", "k", { desc = "extend up one line" })
vim.keymap.set("x", "<C-f>", "l", { desc = "extend forward a character" })
vim.keymap.set("x", "<C-a>", "0", { desc = "extend to the beginning of the line" })
vim.keymap.set("x", "<C-e>", "$", { desc = "extend to the end of the line" })

vim.keymap.set("x", "<M-f>", "e", { desc = "extend through the next word end" })
vim.keymap.set("x", "<M-b>", "b", { desc = "extend back to the prev word start" })
vim.keymap.set("x", "<M-{>", "{", { desc = "extend to the prev paragraph" })
vim.keymap.set("x", "<M-}>", "}", { desc = "extend to the next paragraph" })

vim.keymap.set("x", "<C-Space>", "<C-\\><C-n>", { desc = "end the selection" })
vim.keymap.set("x", "<C-v>", "<C-f>", { desc = "extend down a page" })
vim.keymap.set("x", "<M-v>", "<C-b>", { desc = "extend up a page" })

vim.keymap.set("x", "<C-l>", "zz",  { desc = "center the current line" })
vim.keymap.set("x", "<M-S-,>", onncera_beg_of_buffer, { desc = "extend to the beg of the buffer" })
vim.keymap.set("x", "<M-S-.>", onncera_end_of_buffer, { desc = "extend to the end of the buffer" })


-- insert mode
vim.keymap.set("i", "<C-b>", "<C-\\><C-o>h", { desc = "go back a character" })
vim.keymap.set("i", "<C-f>", "<C-\\><C-o>l", { desc = "go forward a character" })
vim.keymap.set("i", "<C-a>", "<C-\\><C-o>0", { desc = "beg of line" })
vim.keymap.set("i", "<C-e>", "<C-\\><C-o>$", { desc = "end of line" })

-- <C-\\><C-o> lets us execute one normal mode command then return to insert mode
vim.keymap.set("i", "<M-f>", "<C-\\><C-o>w", { desc = "forwards to a word end" })
vim.keymap.set("i", "<M-b>", "<C-\\><C-o>b", { desc = "backward to a word start" })
vim.keymap.set("i", "<M-{>", "<C-\\><C-o>{", { desc = "prev paragraph" })
vim.keymap.set("i", "<M-}>", "<C-\\><C-o>}", { desc = "next paragraph" })

vim.keymap.set("i", "<C-Space>", "<C-\\><C-o>v", { desc = "start a character selection" })
vim.keymap.set("i", "<C-v>", "<C-\\><C-o><C-f>", { desc = "next page" })
vim.keymap.set("i", "<M-v>", "<C-\\><C-o><C-b>", { desc = "prev page" })

vim.keymap.set("i", "<C-l>", "<C-\\><C-o>zz",  { desc = "center the current line" })
vim.keymap.set("i", "<M-S-,>", onncera_beg_of_buffer, { desc = "beg of buffer" })
vim.keymap.set("i", "<M-S-.>", onncera_end_of_buffer, { desc = "end of buffer" })

-- how CTRL-N and CTRL-p behave when there is an autocomplete popup menu visible vs when there isn't
-- move down or select next completion
vim.keymap.set("i", "<C-n>", function()
    if vim.fn.pumvisible() == 1 then
        return "<C-n>"
    else
        return "<C-\\><C-o>gj"
    end
end, { expr = true, desc = "next autocomplete suggestion or normal behavior" })

-- move up   or select prev completion
vim.keymap.set("i", "<C-p>", function()
    if vim.fn.pumvisible() == 1 then
        return "<C-p>"
    else
        return "<C-\\><C-o>gk"
    end
end, { expr = true, desc = "prev autocomplete suggestion or normal behavior" })


-- cut , copy , paste , using vim registers. Visual P preserves the pasted register

