return {
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			require("mini.surround").setup({
				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					add = "sa", -- Add surrounding in Normal and Visual modes
					delete = "sd", -- Delete surrounding
					find = "sf", -- Find surrounding (to the right)
					find_left = "sF", -- Find surrounding (to the left)
					highlight = "sh", -- Highlight surrounding
					replace = "sr", -- Replace surrounding
					update_n_lines = "sn", -- Update `n_lines`

					suffix_last = "l", -- Suffix to search with "prev" method
					suffix_next = "n", -- Suffix to search with "next" method
				},

				n_lines = 30, -- Number of lines to search for surroundings
			})

			-- Automatically pair quotes, parenthesis, brackets, etc.
			require("mini.pairs").setup()

			-- Jump to filter words by a labeled char
			--
			require("mini.jump2d").setup()

			-- Status line
			--
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			-- Notification
			require("mini.notify").setup()

			-- Start dashboard
			local starter = require("mini.starter")
			starter.setup({
				autoopen = true,
				evaluate_single = true,
				items = {
					starter.sections.telescope(),
				},
				content_hooks = {
					starter.gen_hook.adding_bullet(),
					starter.gen_hook.aligning("center", "center"),
				},
				query_updaters = "abcdefghilmnopqrstuvwxyz0123456789_-.",
				-- Whether to disable showing non-error feedback
				silent = true,
				header = table.concat({
					"██╗███╗   ██╗██████╗ ██╗███████╗ ██████╗ ██████╗ ██████╗ ███████╗██████╗",
					"██║████╗  ██║██╔══██╗██║██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔══██╗",
					"██║██╔██╗ ██║██║  ██║██║█████╗  ██║     ██║   ██║██║  ██║█████╗  ██████╔╝",
					"██║██║╚██╗██║██║  ██║██║██╔══╝  ██║     ██║   ██║██║  ██║██╔══╝  ██╔══██╗",
					"██║██║ ╚████║██████╔╝██║███████╗╚██████╗╚██████╔╝██████╔╝███████╗██║  ██║",
					"╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝",
					"                                                                         ",
				}, "\n"),
			})

			-- File explorer
			--
			local MiniFiles = require("mini.files")
			MiniFiles.setup({
				mappings = {
					close = "\\",
					go_in = "<CR>",
					go_in_plus = "<CR>",
					go_out = "h",
					go_out_plus = "H",
					mark_goto = "'",
					mark_set = "m",
					reset = "<Esc>",
					reveal_cwd = "@",
					show_help = "g?",
					synchronize = "=",
					trim_left = "<",
					trim_right = ">",
				},
			})

			vim.keymap.set("n", "\\", function()
				if not MiniFiles.close() then
					local buf = vim.api.nvim_buf_get_name(0)
					MiniFiles.open(buf)
				end
			end, { desc = "Toggle Mini files" })

			local miniclue = require("mini.clue")
			miniclue.setup({
				-- Explicitly opt-in for set of common keys to trigger clue window
				triggers = {
					{ mode = "n", keys = "<Leader>" }, -- Leader triggers
					{ mode = "x", keys = "<Leader>" },
					{ mode = "n", keys = "\\" }, -- mini.basics
					{ mode = "n", keys = "[" }, -- mini.bracketed
					{ mode = "n", keys = "]" },
					{ mode = "x", keys = "[" },
					{ mode = "x", keys = "]" },
					{ mode = "i", keys = "<C-x>" }, -- Built-in completion
					{ mode = "n", keys = "g" }, -- `g` key
					{ mode = "x", keys = "g" },
					{ mode = "n", keys = "'" }, -- Marks
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },
					{ mode = "n", keys = '"' }, -- Registers
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },
					{ mode = "n", keys = "<C-w>" }, -- Window commands
					{ mode = "n", keys = "z" }, -- `z` key
					{ mode = "x", keys = "z" },
				},

				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
				window = {
					config = { anchor = "SE", row = "auto", col = "auto", width = "auto" },
				},
			})
		end,
	},
}
