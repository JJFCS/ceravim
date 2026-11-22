
-- TODO
-- mc fixes .. CTRL-k , CTRL-o .. insert mode is still weird (this line is all for insert mode)
-- mc fixes .. bind follow mode to something easier
-- think we just use normal and visual mode as those works out of the box . for insert mode we just use normal stuff but not emacs bindings

-- Neovim 0.13 native multicursor mappings
local api, fn = vim.api, vim.fn
local namespace = api.nvim_create_namespace("nvim.multicursor")
local M = {}

local function visual_selection()
	local anchor, cursor = fn.getpos("v"), fn.getpos(".")
	local text = table.concat(fn.getregion(anchor, cursor, { type = "v" }), "\n")
	if text == "" then
		return
	end

	local first = fn.getregionpos(anchor, cursor, { type = "v", bounds = true })[1][1]
	return {
		origin = { first[2], math.max(first[3] - 1, 0) },
		pattern = [[\V\C]] .. fn.escape(text, "\\"):gsub("\n", [[\n]]),
		length = #text,
		tick = api.nvim_buf_get_changedtick(0),
	}
end

local function text_session(origin)
	local state = vim.b.onncera_mc_text
	if state and state.tick == api.nvim_buf_get_changedtick(0)
		and vim.deep_equal(state.origin, origin)
		and #api.nvim_buf_get_extmarks(0, namespace, 0, -1, { limit = 1 }) > 0
	then
		return state
	end
	vim.b.onncera_mc_text = nil
end

local function adjacent_line(pivot, direction)
	local row = pivot[1] + direction
	if row < 1 or row > api.nvim_buf_line_count(0) then
		return
	end

	local column = fn.virtcol({ pivot[1], pivot[2] + 1 }, true)[1]
	local line = api.nvim_buf_get_lines(0, row - 1, row, false)[1]
	if column >= fn.virtcol({ row, #line + 1 }) then
		return { row, #line }
	end
	return { row, fn.virtcol2col(0, row, column) - 1 }
end

local function byte_offset(pos)
	return api.nvim_buf_get_offset(0, pos[1] - 1) + pos[2]
end

local function matching_occurrence(state, pivot, direction)
	local view = fn.winsaveview()
	api.nvim_win_set_cursor(0, pivot)
	local pivot_start = byte_offset(pivot)
	local pivot_end = pivot_start + state.length
	local flags = direction == -1 and "bnW" or "nW"

	-- Search each possible start, then reject candidates that overlap the pivot.
	local lookahead = [[\%(]] .. state.pattern .. [[\)\@=]]
	local ok, match = pcall(fn.searchpos, lookahead, flags, 0, 0, function()
		local start = byte_offset(api.nvim_win_get_cursor(0))
		return (start < pivot_end and start + state.length > pivot_start) and 1 or 0
	end)
	fn.winrestview(view)
	if not ok then
		error(match)
	end
	if match[1] > 0 then
		return { match[1], match[2] - 1 }
	end
end

local function mark(direction, skip)
	if vim.v.cascading then return end

	local mode = fn.mode()
	local visual = mode == "v"
	if mode ~= "n" and not visual then
		vim.notify("Select text with characterwise Visual mode (v)")
		return
	end

	local origin = api.nvim_win_get_cursor(0)
	local state, edge
	if visual then
		state = visual_selection()
		if not state then return end
		origin = state.origin
	else
		state = text_session(origin)
		local bound = direction == -1 and 0 or -1
		local origin_pos = { origin[1] - 1, origin[2] }
		edge = api.nvim_buf_get_extmarks(0, namespace, bound, origin_pos, { limit = 1 })[1]
	end

	if state and skip and not edge then
		vim.notify("Mark an occurrence on this side first")
		return
	end

	local pivot = edge and { edge[2] + 1, edge[3] } or origin
	local target
	if state then
		target = matching_occurrence(state, pivot, direction)
	else
		target = adjacent_line(pivot, direction)
	end
	if not target then
		vim.notify(state and "No further matching occurrence" or "Reached the buffer edge")
		return
	end

	if visual then
		api.nvim_buf_clear_namespace(0, namespace, 0, -1)
		vim.cmd.normal({ args = { vim.keycode("<Esc>") }, bang = true })
		api.nvim_win_set_cursor(0, origin)
		vim.b.onncera_mc_text = state
	end
	if state then
		-- Start cgn's match exactly at the primary or replay cursor.
		fn.setreg("/", [[\%#]] .. state.pattern)
	end

	vim.bo.follow = false
	api.nvim_buf_set_extmark(0, namespace, target[1] - 1, target[2], {})
	if skip and edge then
		api.nvim_buf_del_extmark(0, namespace, edge[1])
	end
end

function M.mark_previous()
	mark(-1, false)
end

function M.mark_next()
	mark(1, false)
end

function M.skip_previous()
	mark(-1, true)
end

function M.skip_next()
	mark(1, true)
end

function M.clear()
	api.nvim_buf_clear_namespace(0, namespace, 0, -1)
	vim.b.onncera_mc_text = nil
end

return M

