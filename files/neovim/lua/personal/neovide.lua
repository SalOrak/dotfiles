if not vim.g.neovide then
	return
end

local set = vim.keymap.set




--- Font configuration
local font = {
	default_name = "Iosevka NFP",
	default_size = 30,
	current_size = 30,
	step = 3,
}

local neovide_set_font = function(name, size)
	if not size then
		font.current_size = font.default_size
	end

	local name = name or font.default_name
	local size = size or font.default_size
	local guifont = string.format("%s:h%s",name,size)
	vim.o.guifont = guifont
end

local neovide_increase_font_size = function()
	font.current_size = font.current_size + font.step
	neovide_set_font(font.default_name, font.current_size)
end

local neovide_decrease_font_size = function()
	font.current_size = font.current_size -  font.step
	neovide_set_font(font.default_name, font.current_size)
end


neovide_set_font(font.default_name, font.default_size)

set({"n", "v", "i"}, "<c-->", neovide_decrease_font_size)
set({"n", "v", "i"}, "<c-$>", neovide_decrease_font_size)
set({"n", "v", "i"}, "<c-+>", neovide_increase_font_size)
set({"n", "v", "i"}, "<c-#>", neovide_increase_font_size)
set({"n", "v", "i"}, "<c-=>", neovide_set_font)

vim.g.neovide_refresh_rate = 100
