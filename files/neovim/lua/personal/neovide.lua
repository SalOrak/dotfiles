if not vim.g.neovide then
	return
end

local set = vim.keymap.set

local scale = {
	default = 1.0,
	step = 1.25,
	current = 1.0,
}


local neovide_increase_scale = function()
	scale.current = math.min(scale.current * scale.step, 1.8)
	vim.g.neovide_scale_factor = scale.current
end

local neovide_decrease_scale = function()
	scale.current = math.max(scale.current * (1 / scale.step), 0.5)
	vim.g.neovide_scale_factor = scale.current
end

local neovide_restore_scale = function()
	vim.g.neovide_scale_factor = scale.default
end


set({"n", "v", "i"}, "<c-->", neovide_decrease_scale)
set({"n", "v", "i"}, "<c-$>", neovide_decrease_scale)
set({"n", "v", "i"}, "<c-+>", neovide_increase_scale)
set({"n", "v", "i"}, "<c-#>", neovide_increase_scale)
set({"n", "v", "i"}, "<c-=>", neovide_restore_scale)

vim.g.neovide_refresh_rate = 100
