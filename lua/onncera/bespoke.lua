
-- TODO .. NIL

local M = {}


function M.onncera_beg_of_buffer()
	vim.api.nvim_win_set_cursor(0, { 1, 0 })
end


function M.onncera_end_of_buffer()
	local last_line = vim.api.nvim_buf_line_count(0)
	local text = vim.api.nvim_buf_get_lines(0, last_line - 1, last_line, false)[1]
	local last_cols = #text  -- this gets the length of the string in bytes

	vim.api.nvim_win_set_cursor(0, { last_line, last_cols })
end


function M.onncera_kill_line()
	-- this kills to the end of the line or removes an empty line
	if vim.fn.getline(".") == "" then
		return "dd"
	else
		return "D"
	end
end


function M.onncera_kill_cmd_line()
	-- delete everything from the cursor to the end of the command line
	-- get the current command line text and cursor position
	local text = vim.fn.getcmdline()
	local cols = vim.fn.getcmdpos()

	-- keep only the text before the cursor
	local remaining = text:sub(1, cols - 1)

	-- replace the command line with the remaining text
	vim.fn.setcmdline(remaining)

	return ""
end


function M.onncera_yanks()
	-- accepts a completion suggestion or paste from the unnamed register
	if vim.fn.pumvisible() == 1 then
		return "<C-y>"
	else
		return "<C-r><C-o>+"
	end
end


function M.onncera_open_line()
	-- open a new line at the cursor without moving to the new line. mode based features
	local cursor = vim.api.nvim_win_get_cursor(0)  -- get the current cursor position
	local line = cursor[1]
	local cols = cursor[2]

	-- insert a newline at the cursor position
	vim.api.nvim_buf_set_text(0, line - 1, cols, line - 1, cols, { "", "" })

	-- return the cursor to its original position
	vim.api.nvim_win_set_cursor(0, { line, cols })

	-- enter insert mode
	vim.cmd("startinsert")
end


function M.onncera_reverse_search_cmd_line()
	-- move to the previous search match or insert a register
	local cmd_type = vim.fn.getcmdtype()  -- get the current command line type

	if cmd_type == "/" or cmd_type == "?" then
		return "<C-t>"
	else
		return "<C-r>"
	end
end


function M.onncera_map_insert_mc(key, action)
	local command = '<Cmd>lua require("onncera.mc").' .. action .. '()<CR>'
	vim.keymap.set("i", key, "<Esc>" .. command .. "gi")
end


function M.onncera_next_line()
	-- move down one line or select the next autocomplete suggestion
	if vim.fn.pumvisible() == 1 then
		return "<C-n>"
	else
		return "<Down>"
	end
end


function M.onncera_prev_line()
	-- move up   one line or select the prev autocomplete suggestion
	if vim.fn.pumvisible() == 1 then
		return "<C-p>"
	else
		return "<Up>"
	end
end


function M.onncera_open_file_in_tab()
	-- open file in new tab
	vim.ui.input({ prompt = 'File to open in new tab: ', completion = 'file' }, function(input)
		if input and input ~= '' then
			vim.cmd('tabnew ' .. input)
		end
	end)
end


function M.onncera_copy_file_path()
	-- get the absolute file path of the current buffer and copy to the system clipboard
	-- get the absolute path of the current file
	local path = vim.fn.expand("%:p")
	
	vim.fn.setreg("+", path)  -- copy path to system clipboard
	print("file:", path)
end


function M.onncera_beg_of_line()
	-- toggle between the absolute beginning and first non whitespace character
	-- check whether we're already at column zero
	if vim.fn.col(".") == 1 then
		return "^"
	else
		return "0"
	end
end


function M.onncera_beg_of_line_insert()
	-- toggle between the absolute beginning and first non whitespace character in insert mode
	local col = vim.fn.col(".")
	local line = vim.fn.getline(".")

	if col == 1 and line:match("^%s+%S") then
		return "<C-Right>"
	else
		return "<Home>"
	end
end


return M

