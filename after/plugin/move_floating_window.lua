function CodeOutput()

local current_window = vim.fn.winnr()
local current_window_id = vim.api.nvim_get_current_win()
local position = vim.api.nvim_win_get_position(current_window_id)
local config = vim.api.nvim_win_get_config(current_window_id)

print(current_window)
print(current_window_id)
print(position)
print("Row: ", position[1], "Col: ", position[2])
print("Floating : ", config.relative)
print("Width: ", config.width, "Height: ", config.height)

end


function MoveFloatingWindow(direction)


	-- Took away change size do to already have presets
	-- Ctrl-w +/- for Height
	-- Ctrl-w >/< for Width (Can type integer before keybinding to add value)

	local newRowPos = 0
	local newColPos = 0
	
	if direction == "up" then

		newRowPos = newRowPos -2
	elseif direction == "down" then

		newRowPos = newRowPos + 2
	elseif direction == "right" then

		newColPos = newColPos + 4
	else

		newColPos = newColPos -4
	end

	-- Get the current window number
	local current_window = vim.fn.winnr()

	-- Get the window ID of the current window
	local current_window_id = vim.api.nvim_get_current_win()


	-- Get the (row, col) position of the current window
	local position = vim.api.nvim_win_get_position(current_window_id)
	
	--Determine if current window is a floating window.. if it isnt one of the follow positions should be zero.
	if position[1] ~= 0 or position[2] ~= 0 then
	
		-- Get the window configuration
		local config = vim.api.nvim_win_get_config(current_window_id)

		-- Check if the window is floating
		if config.relative ~= '' then
			print('Floating Window Info:')
			print('Row:', config.row)
			print('Col:', config.col)
			print('Width:', config.width)
			print('Height:', config.height)
		else
			print('Not a floating window.')
		end

		-- Save the current window state
		local prev_state = {
			bufnr = vim.fn.bufnr("%"),  -- Current buffer number
			line = vim.fn.line("."),     -- Current cursor line
			col = vim.fn.col("."),       -- Current cursor column
			win_config = vim.api.nvim_win_get_config(0),  -- Current window configuration
		}



		buf = vim.api.nvim_create_buf(false, true) -- create new emtpy buffer

		vim.api.nvim_buf_set_option(prev_state.bufnr, 'bufhidden', 'wipe')

		-- set some options
		local opts = {
			border = "rounded",
			style = "minimal",
			relative = "editor",
			width = config.width,
			height = config.height,
			row = position[1] + newRowPos,
			col = position[2] + newColPos
		}

		-- and finally create it with buffer attached
		win = vim.api.nvim_open_win(prev_state.bufnr, true, opts)

		-- Window Configuration (Personal Preference)
		vim.cmd(":highlight NormalFloat guibg=0")
		vim.cmd(":set number")
		vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='magenta' })
		vim.api.nvim_set_hl(0, 'LineNr', { fg='green'})
		vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='magenta' })
		vim.cmd(":redraw!")

	
		findOldWindow(position, newRowPos, newColPos)


	else
		print("not a floating window!")
	end

end

function findOldWindow(position, newRowPos, newColPos)

	-- Repeat getting the window properties to determine if neovim switched to the right window
	-- The window the neovim should switch to by the end should be a window with the same previous windows
	-- position. We can make a loop to hopefully switch until the old window is found and removed.

	
	local newCurrentWindow = vim.fn.winnr()
	local newCurrentWindowID = vim.api.nvim_get_current_win()
	local newWindowPosition
	
	repeat

		vim.cmd(":wincmd w")
		newCurrentWindow = vim.fn.winnr()	

		newCurrentWindowID = vim.api.nvim_get_current_win()
		
		newWindowPosition = vim.api.nvim_win_get_position(newCurrentWindowID)



		
	until(newWindowPosition[1] == position[1] and newWindowPosition[2] == position[2])
	vim.cmd(":q")

	local breakLoop = 1
	repeat

		vim.cmd(":wincmd w")
		newCurrentWindow = vim.fn.winnr()	

		newCurrentWindowID = vim.api.nvim_get_current_win()
		
		newWindowPosition = vim.api.nvim_win_get_position(newCurrentWindowID)

		breakLoop = breakLoop + 1

		if breakLoop == 10 then
			break
		end
		

	until(newWindowPosition[1] == position[1]+newRowPos and newWindowPosition[2] == position[2]+newColPos)

end




