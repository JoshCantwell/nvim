vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", '<leader>ww', '<C-w>w')
vim.keymap.set("n", "<leader>cc", function()
	local cppClass = vim.fn.input("C++ Class Name: ")
	if cppClass == "" then

	else
		cppClassTemplate(cppClass)
	end
end)


vim.keymap.set("n", "<leader>pm", function()

	 open_Window()

end)

