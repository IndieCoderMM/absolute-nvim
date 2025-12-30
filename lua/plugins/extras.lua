return {
	{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	{
		"vague-theme/vague.nvim",
		lazy = false,
		priority = 1000, -- make sure to load this before all the other plugins
		config = function()
			require("vague").setup({
				transparent = false,
			})
			vim.cmd("colorscheme vague")
		end,
	},
	{ "wakatime/vim-wakatime", lazy = false },
}
