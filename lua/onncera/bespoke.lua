
--** TODO
-- COOL USE OF FZF TO LOOK UP API & DOCUMENTATION ---> https://www.youtube.com/watch?v=FdQ5FZSGLK8&t=605s
--**


local M = {}


function M.onncera_kill_line()
	-- this kills to the end of the line or removes an empty line
	if vim.fn.getline(".") == "" then
		return "dd"
	else
		return "D"
	end
end


function M.onncera_beg_of_line()
	-- toggle between the absolute beginning and first non whitespace character
	if vim.fn.col(".") == 1 then
		return "^"
	else
		return "0"
	end
end


function M.onncera_beg_of_line_insert()
	-- toggle between the absolute beginning and first non whitespace character
	-- when in insert mode
	local cols = vim.fn.col(".")
	local line = vim.fn.getline(".")

	if cols == 1 and line:match("^%s+%S") then
		return "<C-Right>"
	else
		return "<Home>"
	end
end


return M

