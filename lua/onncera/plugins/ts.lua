
vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

-- install missing parsers and their matching queries
require("nvim-treesitter").install({
	"bash",
	"c",
	"cpp",
	"go",
	"html",
	"java",
	"javascript",
	"json",
	"json5",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"regex",
	"rust",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",

})

-- start highlighting when a buffer has a parser and highlight query
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("onnceraTreesitter", { clear = true }),
	callback = function(event)
		if vim.bo[event.buf].buftype ~= "" then
			return
		end

		local lang = vim.treesitter.language.get_lang(event.match)
		if lang
			and vim.treesitter.language.add(lang)
			and vim.treesitter.query.get(lang, "highlights")
			then
				vim.treesitter.start(event.buf, lang)
			end
		end,
	})

