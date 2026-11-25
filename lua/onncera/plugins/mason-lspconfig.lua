
vim.pack.add({
	"https://github.com/mason-org/mason-lspconfig.nvim",
})

local servers = { "lua_ls", "clangd", "pyright" }

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_enable = servers,
})

