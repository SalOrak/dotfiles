return {
	'numToStr/Comment.nvim',
	config = function()
		require('Comment').setup({
			extra = {
				eol = 'gce' -- End of line 
			},
		});
	end,
}
