
--** some tips
-- `gn' to focus on a specific directories
-- `i'  to cycle between different list styles
--**

vim.g.netrw_hide = 0 ; vim.g.netrw_liststyle = 3   -- shows hidden ; tree view . 'enter' expands or shrinks
vim.g.netrw_banner = 0 ; vim.g.netrw_winsize = 20  -- hides help & status banner at the top ; 20% win width
vim.g.netrw_bufsettings = "noma nomod nobl nowrap ro"
vim.g.netrw_sort_by = "name"
vim.g.netrw_sort_direction = "normal"
vim.g.netrw_sort_options = "i"

local separator = "\31"
vim.g.netrw_sepchr = separator
vim.g.netrw_sort_sequence = table.concat({
	[[^\.\.\/$]],     -- parents directories
	[[^\.\/$]],       -- current directories
	[[^\.[^/]\+$]],   -- hiddens files
	[[^\.[^/]*\/$]],  -- hiddens directories
	"*",  -- regular files
	[[^\%(\d\{3}]] .. separator .. [[\)\@![^.][^/]*\/$]],  -- regular directories
}, ",")

-- do not show tablines in netrw . show every where else
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "FileType" }, {
	group = vim.api.nvim_create_augroup("onnceraNetrwTablines", { clear = true }),
	callback = vim.schedule_wrap(function()
		vim.o.showtabline = vim.bo.filetype == "netrw" and 0 or 2
	end),
})

local icon_ns = vim.api.nvim_create_namespace("onncera.netrw-icons")
local tree_prefix = vim.regex([[^\%([|│] \)\+]])
local icon = "‡"

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("onnceraNetrwIcons", { clear = true }), pattern = "netrw",
	callback = vim.schedule_wrap(function(event)
		local buf = event.buf
		if not vim.api.nvim_buf_is_loaded(buf) then
			return
		end

		vim.api.nvim_buf_clear_namespace(buf, icon_ns, 0, -1)
		if vim.bo[buf].filetype ~= "netrw" or vim.b[buf].netrw_liststyle ~= 3 then
			return
		end

		local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
		local first_entry = vim.b[buf].netrw_bannercnt or 1

		for row = first_entry, #lines do
			local line = lines[row]
			local _, col = tree_prefix:match_str(line)
			local is_dir = line:sub(-1) == "/"

			if col then
				local highlight = is_dir and "Directory" or "Special"
				vim.api.nvim_buf_set_extmark(buf, icon_ns, row - 1, col, {
					virt_text = { { icon .. " ", highlight } },
					virt_text_pos = "inline",
				})
			end

			if is_dir then
				vim.api.nvim_buf_set_extmark(buf, icon_ns, row - 1, #line - 1, {
					virt_text = { { " " } },
					virt_text_pos = "overlay",
					hl_mode = "combine",
				})
			end
		end
	end),
})

