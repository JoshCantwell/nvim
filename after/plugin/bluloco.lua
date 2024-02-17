require("bluloco").setup({
	style = "auto",               -- "auto" | "dark" | "light"
	transparent = false,
	italics = false,
	terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
	guicursor   = true,
})

vim.opt.termguicolors = true

vim.cmd('colorscheme bluloco')
vim.cmd(":highlight Normal guibg=none")
vim.cmd("set number relativenumber")
vim.cmd(":highlight Comment ctermfg=darkgray guifg=cyan")
vim.cmd(":set termguicolors")
vim.cmd(":hi Cursor guifg=green guibg=green")
vim.cmd(":hi Cursor2 guifg=red guibg=red")
vim.cmd(":set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50")


vim.api.nvim_set_hl(0, "Cursor", {fg='#cc9900', bg='#339966'})
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='magenta' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='green'})
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='magenta' })
