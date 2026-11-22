
-- TODO .. see TJ video on floating terminal and see if we want to implement that instead

-- credits to .. https://github.com/radleylewis/nvim-lite
-- floating terminal

local M = {}

local terminal_state = { buf = nil, win = nil, is_open = false }

local function FloatingTerminal()
	-- If terminal is already open, close it (toggle behavior)
	if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
		vim.api.nvim_win_close(terminal_state.win, false)
		terminal_state.is_open = false
		return
	end

	-- Create buffer if it doesn't exist or is invalid
	if not terminal_state.buf or not vim.api.nvim_buf_is_valid(terminal_state.buf) then
		terminal_state.buf = vim.api.nvim_create_buf(false, true)
		-- Set buffer options for better terminal experience
		vim.bo[terminal_state.buf].bufhidden = 'hide'
	end

	-- Calculate window dimensions
	local w   = math.floor( vim.o.columns * 0.8)
	local h   = math.floor( vim.o.lines   * 0.8)
	local row = math.floor((vim.o.lines   - h) / 2)
	local col = math.floor((vim.o.columns - w) / 2)

	-- Create the floating window
	terminal_state.win = vim.api.nvim_open_win(terminal_state.buf, true, {
		relative = 'editor', width = w, height = h, style = 'minimal', border = 'rounded',
		row = row,
		col = col,
	})

	-- Set transparency for the floating window
	vim.wo[terminal_state.win].winblend = 0
	vim.wo[terminal_state.win].winhighlight = 'Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder'

	-- Define highlight groups for transparency
	vim.api.nvim_set_hl(0, "FloatingTermNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatingTermBorder", { bg = "none", })

	-- Start terminal if not already running
	local has_terminal = false
	local lines = vim.api.nvim_buf_get_lines(terminal_state.buf, 0, -1, false)
	for _, line in ipairs(lines) do
		if line ~= "" then
			has_terminal = true
			break
		end
	end

	if not has_terminal then
		vim.fn.termopen(os.getenv("SHELL"))
	end

	terminal_state.is_open = true
	vim.cmd("startinsert")

	-- Set up auto-close on buffer leave
	vim.api.nvim_create_autocmd("BufLeave", {
		buffer = terminal_state.buf,
		callback = function()
			if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
				vim.api.nvim_win_close(terminal_state.win, false)
				terminal_state.is_open = false
			end
		end,
		once = true
	})
end

-- Function to explicitly close the terminal
local function CloseFloatingTerminal()
	if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
		vim.api.nvim_win_close(terminal_state.win, false)
		terminal_state.is_open = false
	end
end

M.FloatingTerminal = FloatingTerminal
M.CloseFloatingTerminal = CloseFloatingTerminal

return M

