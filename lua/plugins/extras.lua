return {
	{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	{
		"alvarosevilla95/luatab.nvim",
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("luatab").setup({
				devicon = function()
					return ""
				end,
				windowCount = function()
					return ""
				end,
			})
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
		config = function()
			require("onedarkpro").setup({
				highlights = {
					-- Override the selection color
					CurSearch = { fg = "#c678dd", bg = "#414858" },
					["@variable"] = { fg = "#abb2bf" },
					["@variable.builtin"] = { fg = "#e5c07b" },
					DiagnosticHint = { link = "NonText" },
					MatchParen = { link = "IncSearch" },
					-- ["@string"] = { link = "Normal" },
				},
				plugins = {
					all = false,
					mason = true,
					blink_cmp = true,
					gitsigns = true,
					treesitter = true,
					telescope = true,
				},
			})

			vim.cmd("colorscheme onedark")
		end,
	},
	-- lazy.nvim
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			picker = {},
			terminal = {},
			input = {},
		},
	},
	-- {
	-- 	"vague-theme/vague.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("vague").setup({
	-- 			transparent = false,
	-- 		})
	-- 		vim.cmd("colorscheme vague")
	-- 	end,
	-- },
	{ "wakatime/vim-wakatime", lazy = false },
	{ -- Quick navs between buffers
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({})

			-- basic telescope configuration
			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end

			vim.keymap.set("n", ";e", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Harpoon: [E]xplore window" })

			vim.keymap.set("n", ";a", function()
				harpoon:list():add()
			end, { desc = "Harpoon: [A]dd current buffer" })

			vim.keymap.set("n", ";r", function()
				harpoon:list():remove()
			end, { desc = "Harpoon: [R]emove current buffer" })

			vim.keymap.set("n", ";p", function()
				harpoon:list():prev()
			end, { desc = "Harpoon: Toggle [P]revious buffer" })

			vim.keymap.set("n", ";n", function()
				harpoon:list():next()
			end, { desc = "Harpoon: Toggle [N]ext buffer" })

			vim.keymap.set("n", ";c", function()
				harpoon:list():clear()
			end, { desc = "Harpoon: [C]lear buffers list" })

			-- vim.keymap.set('n', ';1', function()
			--   harpoon:list():select(1)
			-- end)
			-- vim.keymap.set('n', ';2', function()
			--   harpoon:list():select(2)
			-- end)
			-- vim.keymap.set('n', ';3', function()
			--   harpoon:list():select(3)
			-- end)
			-- vim.keymap.set('n', ';4', function()
			--   harpoon:list():select(4)
			-- end)
		end,
	},
	{ -- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
		keys = {
			{ "<leader>st", "<cmd>TodoTelescope<CR>", desc = "[S]earch [T]odo" },
		},
	},
	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
		keys = {
			{ "<leader>tu", "<cmd>lua require('undotree').toggle()<cr>", desc = "[T]oggle [U]ndo Tree" },
		},
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
				per_filetype = {
					["html"] = {
						enable_close = false,
					},
				},
			})
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			heading = {
				enabled = true,
				sign = true,
				position = "inline",
			},
		},
	},
}
