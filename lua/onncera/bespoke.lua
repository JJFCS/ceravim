
--** TODO
-- look through this super cool way of using FZF to look up api and documentation https://github.com/james-orcales/big_bang/blob/master/dotfiles/common/.config/nvim/init.lua
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


function M.onncera_copy_filepath()
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


function M.onncera_speedbar_toggle()
	-- toggles between opening and closing the speedbar buffer
	vim.cmd.Lexplore()
end


return M

