
-- emulating emacs keybinds into neovim MUAHAHAHA

vim.keymap.set("c" , "<C-g>" , "<Esc>" , { desc = "EXIT command-line MODE"})
vim.keymap.set("i" , "<C-g>" , "<Esc>" , { desc = "EXIT insert MODE"})
vim.keymap.set("n" , "<C-g>" , "<Esc>" , { desc = "EXIT normal MODE"})
vim.keymap.set("o" , "<C-g>" , "<C-\\><C-n>" , { desc = "EXIT operator-pending MODE"})
vim.keymap.set("t" , "<C-g>" , "<C-\\><C-n>" , { desc = "EXIT terminal MODE"})  -- this exits terminal mode
vim.keymap.set("v" , "<C-g>" , "<Esc>" , { desc = "EXIT visual MODE"})


-- normal mode
vim.keymap.set("n", "<C-b>", "h", { desc = "go back a character" })
vim.keymap.set("n", "<C-n>", "j", { desc = "go down one line" })
vim.keymap.set("n", "<C-p>", "k", { desc = "go up one line" })
vim.keymap.set("n", "<C-f>", "l", { desc = "go forward a character" })

vim.keymap.set("n", "<M-f>", "w", { desc = "moves the cursor forwards to the start of the next word" })
vim.keymap.set("n", "<M-b>", "b", { desc = "moves the cursor backward to the start of the previous word" })

vim.keymap.set("n", "<C-a>", "0", { desc = "beg of line" })  -- TODO .. how to toggle beg of line & first char?
vim.keymap.set("n", "<C-e>", "$", { desc = "end of line" })

vim.keymap.set("n", "<M-{>", "{", { desc = "prev paragraph" })
vim.keymap.set("n", "<M-}>", "}", { desc = "next paragraph" })

vim.keymap.set("n", "<C-Space>", "v", { desc = "start a character selection" })  -- like setting a mark in emacs
vim.keymap.set("n", "<C-v>", "<C-f>", { desc = "next page" })
vim.keymap.set("n", "<M-v>", "<C-b>", { desc = "prev page" })

vim.keymap.set("n", "<C-l>", "zz", { desc = "center current line" })
vim.keymap.set("n", "<M-<>", "gg", { desc = "beginning of buffer" })
vim.keymap.set("n", "<M->>", "G$", { desc = "end of buffer" })


-- visual mode
vim.keymap.set("x", "<C-f>", "<Right>", { desc = "Extend forward a character" })
vim.keymap.set("x", "<C-b>", "<Left>", { desc = "Extend backward a character" })
vim.keymap.set("x", "<C-n>", "gj", { desc = "Extend down a screen line" })
vim.keymap.set("x", "<C-p>", "gk", { desc = "Extend up a screen line" })
vim.keymap.set("x", "<M-f>", "e", { desc = "Extend through the next word end" })
vim.keymap.set("x", "<M-b>", "b", { desc = "Extend back to the previous word start" })
vim.keymap.set("x", "<C-a>", "0", { desc = "Extend to the beginning of the line" })
vim.keymap.set("x", "<C-e>", "$", { desc = "Extend to the end of the line" })
vim.keymap.set("x", "<M-m>", "^", { desc = "Extend to the first nonblank character" })
vim.keymap.set("x", "<M-{>", "{", { desc = "Extend to the previous paragraph" })
vim.keymap.set("x", "<M-}>", "}", { desc = "Extend to the next paragraph" })
vim.keymap.set("x", "<M-<>", "gg0", { desc = "Extend to the beginning of the buffer" })
vim.keymap.set("x", "<M->>", "G$", { desc = "Extend to the end of the buffer" })
vim.keymap.set("x", "<C-v>", "<C-f>", { desc = "Extend down a page" })
vim.keymap.set("x", "<M-v>", "<C-b>", { desc = "Extend up a page" })
vim.keymap.set("x", "<C-l>", "zz", { desc = "Center the current line" })
vim.keymap.set("x", "<C-Space>", "<C-\\><C-n>", { desc = "End the selection" })
vim.keymap.set("x", "<C-@>", "<C-\\><C-n>", { desc = "End the selection" })





