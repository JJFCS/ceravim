
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

require("telescope").setup({
	defaults = {
		mappings = {
			i = { ["<C-g>"] = actions.close },
			n = { ["<C-g>"] = actions.close },
		},
	},
})

vim.keymap.set("n", "<leader>ff", builtin.find_files) ; vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)

