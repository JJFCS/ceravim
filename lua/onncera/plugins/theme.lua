
vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
})

require("rose-pine").setup({
	styles = {
		bold = false, italic = false,
		transparency = true,
	},
})

