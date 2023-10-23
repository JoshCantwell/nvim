function personalnote()

	buf = vim.api.nvim_create_buf(false, true) -- Create empty buffer

	vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

	-- get dimensions of current window
	local width = vim.api.nvim_get_option("columns")
	local height = vim.api.nvim_get_option("lines")

	-- calculate our floating window sizzez
	local win_height = math.ceil(height * 0.4 - 4) 
	local win_width = math.ceil(width * 0.4)

	-- and its starting position
	local row = math.ceil((height - win_height)/2 - 1)
	local col = math.ceil((width - win_width)/ 2)

	-- set options
	local opts = {
		border = "rounded",
		style = "minimal",
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col	
	}

	-- create window with created buffer attached
	win = vim.api.nvim_open_win(buf, true, opts)

	vim.cmd(":edit ~/Documents/PersonalNotes/PersonalNotes.txt") 

	vim.api.nvim_set_hl(0, 'FloatBorder', {bg='#3B4252', fg='#5E81AC'})
	vim.api.nvim_set_hl(0, 'NormalFloat', {bg='#3B4252'})
	vim.api.nvim_set_hl(0, 'TelescopeNormal', {bg='#3B4252'})
	vim.api.nvim_set_hl(0, 'TelescopeBorder', {bg='#3B4252'})
	vim.api.nvim_set_option('wrapscan', false)

	vim.api.nvim_command("colorscheme bluloco")
	vim.api.nvim_set_hl(win, 'Visual', { sp='#121BBB'})



end
