
--** TODO
-- SORT ALPHABETICAL
--**


-- RUN `make' IN THE FZF PLUGIN DIRECTORY AND WAIT FOR THE BUILD TO FINISH
local function build_fzf(path)
	local result = vim.system({ "make" }, { cwd = path, text = true }):wait()
	if result.code ~= 0 then
		error("TELESCOPE FZF BUILD FAILED..\n" .. (result.stderr or ""))
	end
end

-- RUN `make' AGAIN WHEN VIM.PACK UPDATES FZF
vim.api.nvim_create_autocmd("PackChanged", { desc = "REBUILD TELESCOPE FZF ON UPDATE",
	group = vim.api.nvim_create_augroup("onnceraTelescopeFZFBuild", { clear = true }),
	callback = function(event)
		local plugin = event.data
		if plugin.spec.name == "telescope-fzf-native.nvim" and plugin.kind == "update" then
			build_fzf(plugin.path)
		end
	end,
})

vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",  -- dependency for telescope . must come first
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",  -- extension
})

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

require("telescope").setup({
	defaults = {
		mappings = {
			-- @bindings
			i = { ["<C-c>"] = actions.close, ["<CR>"] = "select_vertical" },
			n = { ["<C-c>"] = actions.close, ["<CR>"] = "select_vertical" },
		},
	},
})

-- GETS THE INSTALLED FZF CHECKOUT AND CHECK THAT IT IS ACTIVE IN THIS SESSION
local fzf = vim.pack.get({ "telescope-fzf-native.nvim" }, { info = false })[1]
if fzf and fzf.active then
	if not vim.uv.fs_stat(fzf.path .. "/build/libfzf.so") then
		build_fzf(fzf.path)
	end
	require("telescope").load_extension("fzf")
end

-- @bindings
vim.keymap.set("n", "<leader>fg", builtin.live_grep) ; vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fh", builtin.help_tags) ; vim.keymap.set("n", "<leader>fb", builtin.buffers)

