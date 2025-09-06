return {
	'kylechui/nvim-surround',
    version = "^3.0.0",
    lazy = "false",
    config = function()   
        require('nvim-surround').setup()
    end
}
