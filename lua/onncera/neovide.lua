
--** TODO
-- scale factor
--**


if vim.g.neovide then
	vim.g.neovide_input_macos_option_key_is_meta = "both"
	vim.o.guifont = "SF Mono:h16:w-1"  -- the `w' controls the width shrinking
	vim.opt.linespace = -3

	-- this makes neovide feel snappier like terminal neovim . removing animations
	vim.g.neovide_cursor_animation_length = 0  -- controls how long cursor takes to animate from one position to another
	vim.g.neovide_cursor_short_animation_length = 0  -- similar to above but for horizontal short movements (things like C-f and C-b)
	vim.g.neovide_cursor_trail_size = 0  -- controls how much cursor stretches behind itself during movement
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_cursor_vfx_mode = ""  -- controls additional visual effects when moving cursor . set to no effects
	vim.g.neovide_position_animation_length = 0  -- controls animation of windows when changing position
	vim.g.neovide_scroll_animation_length = 0  -- do not want smooth scrolling . this gives us instant scrolling
	vim.g.neovide_scroll_animation_far_lines = 0  -- controls how many lines are animated when scrolling further than one screen . we jump directly to destination
	vim.g.neovide_floating_shadow = true  -- shadows could help distinguish floating windows better
	vim.g.neovide_floating_blur_amount_x = 0  -- controls the blur radius behind transparent floating windows
	vim.g.neovide_floating_blur_amount_y = 0

	vim.g.neovide_scale_factor = 1.0

	-- how autocmd works
	-- > `nvim_create_autocmd' tells neovim to perform an action when an event occurs
	-- > `VimEnter' is the event that happens after neovim finishes starting up

	vim.api.nvim_create_autocmd("VimEnter", {
		once = true,  -- the callback is only ran onced
		callback = function()  -- callback is the lua code that needs to be executed
			-- @bindings
			vim.keymap.set("n", "<C-?>", "<Cmd>redo<CR>", { desc = "redo" })
			vim.keymap.set("x", "<C-?>", "<Cmd>redo<CR>", { desc = "redo" })
			vim.keymap.set("i", "<C-?>", "<Esc><Cmd>redo<CR>i", {
				desc = "redo and resume Insert mode",
			})

			vim.keymap.set("n", "<C-x><C-=>", function()
				vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.1
			end, { desc = "zoom ins" })
			vim.keymap.set("n", "<C-x><C-->", function()
				vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / 1.1
			end, { desc = "zoom out" })
			vim.keymap.set("n", "<C-=>", function()
				vim.g.neovide_scale_factor = 1.0
			end, { desc = "reset zoom" })
		end,
	})

	vim.cmd.colorscheme("catppuccin")

else
	require("onncera.plugins.theme")
	vim.cmd.colorscheme("rose-pine")
end

