function open_Window()
	buf = vim.api.nvim_create_buf(false, true) -- create new emtpy buffer

	vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

	-- get dimensions
	local width = vim.api.nvim_get_option("columns")
	local height = vim.api.nvim_get_option("lines")

	-- calculate our floating window size
	local win_height = math.ceil(height * 0.4 - 4)
	local win_width = math.ceil(width * 0.4)

	-- and its starting position
	local row = math.ceil((height - win_height) / 2 - 1)
	local col = math.ceil((width - win_width) / 2)

	-- set some options
	local opts = {
		border = "rounded",
		style = "minimal",
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col
	}

	-- and finally create it with buffer attached
	win = vim.api.nvim_open_win(buf, true, opts)


	vim.cmd(":edit init.lua")
	vim.api.nvim_set_hl(0, 'FloatBorder', {bg='#3B4252', fg='#5E81AC'})
	vim.api.nvim_set_hl(0, 'NormalFloat', {bg='#3B4252'})
	vim.api.nvim_set_hl(0, 'TelescopeNormal', {bg='#3B4252'})
	vim.api.nvim_set_hl(0, 'TelescopeBorder', {bg='#3B4252'})
	
	vim.api.nvim_buf_set_option(buf, "modifiable", true)
	vim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:Normal')
	vim.api.nvim_set_option('wrapscan', false)
	vim.api.nvim_command("colorscheme bluloco")
	vim.api.nvim_set_hl(win, 'Visual', { sp='#121BBB'})

	

end
function test()
	local buf = vim.api.nvim_create_buf(false, true)
	local opts = {
	}

	vim.api.nvim_open_term(buf,opts)
end
function cppClassTemplate(cppClass)
	file = io.open(cppClass..".h", "w")
	file:write(
	"#ifndef "..cppClass.."_h\n"..
	"#define "..cppClass.."_h\n\n"..
	"class "..cppClass.."{\n\n"..
	"\n\npublic:\n\n\t"..cppClass.."();\n\t~"..cppClass.."();"..
	"\n\nprivate:\n\n\n};\n\n\n".. 

	"#endif /* "..cppClass.."_h*/")
	file:close()
	file2 = io.open(cppClass..".cpp", "w")
	file2:write(
	"#include \""..cppClass..".h\"\n\n\n"..
	cppClass.."::"..cppClass.."(){\n\n\n}\n\n"..
	cppClass.."::~"..cppClass.."(){\n\n\n}"
	)
	file2:close();
	vim.cmd.Ex()



end
