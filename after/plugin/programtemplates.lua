function open_Window(command)

	if command == "pm" then
		vim.cmd(":enew")
		vim.cmd(":set fillchars=eob:\\ ")
		vim.cmd(":set laststatus=0")
		vim.cmd(":setlocal nonumber norelativenumber")
	end

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

	vim.cmd(":highlight NormalFloat guibg=0")

	vim.cmd(":Ex")

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
