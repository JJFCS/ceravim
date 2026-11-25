
vim.pack.add({
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/folke/noice.nvim",
})

-- taken from https://github.com/folke/noice.nvim suggested setup
require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
		},
	},
	messages = {
		enabled = false,
	},
	-- you can enable a preset for easier configuration
	cmdline = {
		enabled = true,
		view = "cmdline_popup",
	},
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})

vim.api.nvim_create_autocmd("InsertEnter", { desc = "dismiss noice plugin messages when editing resumes",
	group = vim.api.nvim_create_augroup("onnceraDismissNoice", { clear = true }),
	callback = function()
		vim.cmd("Noice dismiss")
	end,
})

