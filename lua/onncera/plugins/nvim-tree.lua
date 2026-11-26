
--** TODO
-- setup bindings
--**


vim.pack.add({
	"https://github.com/nvim-tree/nvim-tree.lua",
})

require("nvim-tree").setup({
	view = {
		width = "20%",
		signcolumn = "yes",
	},
	renderer = {
		root_folder_label = false,
		indent_markers = {
			enable = true,
			icons  = {
				edge = "|",
				item = "‡",
				corner = "¤",
				none = " ",
			},
		},
		icons = {
			show = {
				bookmarks = false,
				diagnostics = false,
				file = true,
				folder = true,
				folder_arrow = false,
				git = false,
				hidden = false,
				modified = false,
			},
		},
	}, on_attach = function(bufnr)
		local api = require("nvim-tree.api")

		-- @bindings
		vim.keymap.set("n", "-", api.tree.change_root_to_parent, {
			buffer = bufnr,
			desc = "go to parent directory",
		})
	end,
})

--   vim.keymap.set("n",          "<BS>",           api.node.navigate.parent_close,     opts("Close Directory"))
--   vim.keymap.set("n",          "<CR>",           api.node.open.edit,                 opts("Open"))

--   vim.keymap.set("n",          "<Tab>",          api.node.open.preview,              opts("Open Preview"))
--
--
--   vim.keymap.set("n",          "-",              api.tree.change_root_to_parent,     opts("Up"))
--   vim.keymap.set("n",          "a",              api.fs.create,                      opts("Create File Or Directory"))
--   vim.keymap.set({ "n", "x" }, "c",              api.fs.copy.node,                   opts("Copy"))
--   vim.keymap.set({ "n", "x" }, "d",              api.fs.remove,                      opts("Delete"))
--   vim.keymap.set({ "n", "x" }, "D",              api.fs.trash,                       opts("Trash"))
--   vim.keymap.set("n",          "E",              api.tree.expand_all,                opts("Expand All"))
--   vim.keymap.set("n",          "g?",             api.tree.toggle_help,               opts("Help"))
--   vim.keymap.set({ "n", "x" }, "gy",             api.fs.copy.absolute_path,          opts("Copy Absolute Path"))
--   vim.keymap.set("n",          "o",              api.node.open.edit,                 opts("Open"))
--   vim.keymap.set("n",          "O",              api.node.open.no_window_picker,     opts("Open: No Window Picker"))
--   vim.keymap.set("n",          "p",              api.fs.paste,                       opts("Paste"))
--   vim.keymap.set("n",          "gp",             api.fs.move,                        opts("Move"))
--   vim.keymap.set("n",          "P",              api.node.navigate.parent,           opts("Parent Directory"))
--   vim.keymap.set("n",          "q",              api.tree.close,                     opts("Close"))
--   vim.keymap.set("n",          "r",              api.fs.rename,                      opts("Rename"))
--   vim.keymap.set("n",          "R",              api.tree.reload,                    opts("Refresh"))
--   vim.keymap.set("n",          "S",              api.tree.search_node,               opts("Search"))
--   vim.keymap.set("n",          "u",              api.fs.rename_full,                 opts("Rename: Full Path"))
--   vim.keymap.set("n",          "W",              api.tree.collapse_all,              opts("Collapse All"))
--   vim.keymap.set({ "n", "x" }, "x",              api.fs.cut,                         opts("Cut"))
--   vim.keymap.set("n",          "y",              api.fs.copy.filename,               opts("Copy Name"))
--   vim.keymap.set("n",          "Y",              api.fs.copy.relative_path,          opts("Copy Relative Path"))

-- @bindings
vim.keymap.set("n", "<leader>sb", "<Cmd>NvimTreeToggle<CR>")

