--Author: Josh Cantwell

-- Map Leader
vim.g.mapleader = " "

--intro


-- File Exploring
vim.keymap.set("n", "<leader>fe", function()

	vim.cmd(":Lexplore 15")
end)
vim.keymap.set("n", "<leader>pv", function()
	vim.cmd(":Ex")

end)
vim.keymap.set("n", '<leader>ww', '<C-w>w')

-- Tab Navigation
vim.keymap.set("n", "<C-S-h>", function()

	vim.cmd(":tabprevious")

end)
vim.keymap.set("n", "<C-S-l>", function()

	vim.cmd(":tabnext")

end)


--.h/.cpp file template
vim.keymap.set("n", "<leader>cc", function()
	local cppClass = vim.fn.input("C++ Class Name: ")
	if cppClass == "" then

	else
		cppClassTemplate(cppClass)
	end
end)

--Quick Format(For floating window)
vim.keymap.set("n", "<leader>ln", function()

	vim.cmd(":set number")
end)

vim.keymap.set("n", "<A-k>", function()

	local direction = "up"

	 MoveFloatingWindow(direction)

end)
vim.keymap.set("n", "<A-j>", function()

	local direction = "down"

	 MoveFloatingWindow(direction)

end)
vim.keymap.set("n", "<A-l>", function()

	local direction = "right"

	 MoveFloatingWindow(direction)

end)

vim.keymap.set("n", "<A-h>", function()

	local direction = "left"

	 MoveFloatingWindow(direction)

end)


vim.keymap.set("n", "<leader>fd", function()

	local direction = "Height"

	 ResizeFloatingWindow(direction)

 end)
vim.keymap.set("n", "<leader>fu", function()

	local direction = "NegH"

	 ResizeFloatingWindow(direction)

 end)
vim.keymap.set("n", "<leader>fr", function()

	local direction = "Width"

	 ResizeFloatingWindow(direction)

 end)
vim.keymap.set("n", "<leader>fl", function()

	local direction = "NegW"

	 ResizeFloatingWindow(direction)

 end)
vim.keymap.set("n", "<leader>pm", function()

	 open_Window("pm")

end)

vim.keymap.set("n", "<leader>pw", function()

	 open_Window("pw")

end)
