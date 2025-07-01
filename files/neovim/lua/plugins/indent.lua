return {
	'echasnovski/mini.indentscope',
	version = '*',
	config = function()
		local r = require('mini.indentscope')
		r.setup({
			options = {
				n_lines = 1000,
			}
		})
	end,
}
