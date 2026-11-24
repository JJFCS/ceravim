
--** TODO
-- telescope to sort alphabetical
-- swap to snacks picker .. maybe ..
--**


vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",  -- dependency for telescope . must come first
	"https://github.com/nvim-telescope/telescope.nvim",
})

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

require("telescope").setup({
	defaults = {
		mappings = {
			-- @bindings
			i = { ["<C-c>"] = actions.close },
			n = { ["<C-c>"] = actions.close },
		},
	},
})

-- @bindings
vim.keymap.set("n", "<leader>ff", builtin.find_files) ; vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)

