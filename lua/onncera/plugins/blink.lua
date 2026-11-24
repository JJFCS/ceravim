
--** TODO
-- update once LSP comes in
--**


vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },
})

require("blink.cmp").setup({
	keymap = {
		preset = "none",
		-- @bindings
		['<M-\\>'] =  { 'show', 'hide', 'fallback' },
		['<S-Tab>'] = { 'select_prev', 'fallback' },
		['<Tab>'] =   { 'select_next', 'fallback' },
		['<C-p>'] =   { 'scroll_documentation_up', 'fallback' },
		['<C-n>'] =   { 'scroll_documentation_down', 'fallback' },
		['<CR>'] =    { 'accept', 'fallback' },
	},
	completion = {
		list = {
			selection = { preselect = false, auto_insert = false },
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
		},
	},
	cmdline = { enabled = false },
	fuzzy = { implementation = "lua" },
})

