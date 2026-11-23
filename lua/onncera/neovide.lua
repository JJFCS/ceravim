
--** TODO
-- NIL
--**


if vim.g.neovide then
	vim.g.neovide_input_macos_option_key_is_meta = "both"
	vim.o.guifont = "SF Mono:h16:w-1"  -- the `w' controls the width shrinking
	vim.opt.linespace = -3

	-- how autocmd works
	-- > `nvim_create_autocmd' tells neovim to perform an action when an event occurs
	-- > `VimEnter' is the event that happens after neovim finishes starting up

	vim.api.nvim_create_autocmd("VimEnter", {
		once = true,  -- the callback is only ran onced
		callback = function()  -- callback is the lua code that needs to be executed
			local f = require("onncera.bespoke")

			-- neovide may report option+shift+,/. as meta+</>
			-- support both representations including visual-mode selection
			for _, key in ipairs({ "<M-<>", "<M-S-,>" }) do
				vim.keymap.set({ "n", "x" }, key, f.onncera_beg_of_buffer, {
					desc = "beginning of buffer",
				})
			end

			for _, key in ipairs({ "<M->>", "<M-S-.>" }) do
				vim.keymap.set({ "n", "x" }, key, f.onncera_end_of_buffer, {
					desc = "end of buffer",
				})
			end

			-- in Neovide Ctrl+Shift+/ can arrive as Ctrl+?
			-- keep Ctrl+/ (undo) and the shared redo mappings intact
			vim.keymap.set("n", "<C-?>", "<Cmd>redo<CR>", { desc = "redo" })
			vim.keymap.set("x", "<C-?>", "<Cmd>redo<CR>", { desc = "redo" })
			vim.keymap.set("i", "<C-?>", "<Esc><Cmd>redo<CR>i", {
				desc = "redo and resume Insert mode",
			})
		end,
	})
end


