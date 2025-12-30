return {
	{
		"NickvanDyke/opencode.nvim",
		keys = {
			{
				"<leader>oa",
				function()
					require("opencode").ask("@this: ", { submit = true })
				end,
				mode = { "n", "x" },
				desc = "Ask opencode",
			},
			{
				"<leader>os",
				function()
					require("opencode").select()
				end,
				mode = { "n", "x" },
				desc = "Execute opencode action",
			},
			{
				"<leader>op",
				function()
					require("opencode").prompt("@this")
				end,
				mode = { "n", "x" },
				desc = "Add to opencode",
			},
			{
				"<leader>oo",
				function()
					require("opencode").toggle()
				end,
				mode = { "n", "t" },
				desc = "Toggle opencode",
			},
		},
		config = function()
			---@type opencode.Opts
			vim.g.opencode_opts = {
				provideer = {
					enabled = "wezterm",
				},
			}
			-- Required for `opts.events.reload`.
			vim.o.autoread = true
		end,
	},
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({})
		end,
	},
}
