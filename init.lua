-- Basic settings
vim.g.mapleader = " " -- Set leader key to space
vim.g.maplocalleader = " " -- Set local leader key (NEW)
vim.g.have_nerd_font = true
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true -- Highlight current line
vim.opt.wrap = true -- Dont wrap lines
vim.opt.scrolloff = 10 -- Keep lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep columns left/right of cursor

-- Indentation
vim.opt.tabstop = 2 -- Tab width
vim.opt.shiftwidth = 2 -- Indent width
vim.opt.softtabstop = 2 -- Soft tab stop
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive if uppercase in search
vim.opt.hlsearch = true -- Don't highlight search results
vim.opt.incsearch = true -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- How long to show matching bracket
vim.opt.cmdheight = 1 -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect" -- Completion options
vim.opt.showmode = false -- Don't show mode in command line
vim.opt.pumheight = 10 -- Popup menu height
vim.opt.pumblend = 10 -- Popup menu transparency
vim.opt.winblend = 0 -- Floating window transparency
vim.o.winborder = "rounded"
vim.opt.conceallevel = 0 -- Don't hide markup
vim.opt.concealcursor = "" -- Don't hide cursor line markup
vim.opt.lazyredraw = true -- Don't redraw during macros
vim.opt.synmaxcol = 300 -- Syntax highlighting limit

-- File handling
vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup before writing
vim.opt.swapfile = false -- Don't create swap files
vim.opt.undofile = true -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
vim.opt.updatetime = 300 -- Faster completion
vim.opt.timeoutlen = 500 -- Key timeout duration
vim.opt.ttimeoutlen = 0 -- Key code timeout
vim.opt.autoread = true -- Auto reload files changed outside vim
vim.opt.autowrite = false -- Don't auto save

-- Behavior settings
vim.opt.hidden = true -- Allow hidden buffers
vim.opt.errorbells = false -- No error bells
vim.opt.backspace = "indent,eol,start" -- Better backspace behavior
vim.opt.autochdir = false -- Dont auto change directory
-- vim.opt.iskeyword:append("-") -- Treat dash as part of word
vim.opt.path:append("**") -- include subdirectories in search
vim.opt.selection = "exclusive" -- Selection behavior
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
vim.opt.modifiable = true -- Allow buffer modifications
vim.opt.encoding = "UTF-8" -- Set encoding

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- ============================================================================
-- KEY MAPS
-- ============================================================================

local mapKey = vim.keymap.set

-- Better paste behavior
mapKey("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Delete without yanking
mapKey({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Buffer navigation
mapKey("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
mapKey("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- Better window navigation
mapKey("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
mapKey("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
mapKey("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
mapKey("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting & Resizing
mapKey("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
mapKey("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
mapKey("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
mapKey("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
mapKey("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
mapKey("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Move lines up/down
mapKey("n", "<A-d>", ":m .+1<CR>==", { desc = "Move line down" })
mapKey("n", "<A-u>", ":m .-2<CR>==", { desc = "Move line up" })
mapKey("v", "<A-u>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
mapKey("v", "<A-d>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

-- Better indenting in visual mode
mapKey("v", "<", "<gv", { desc = "Indent left and reselect" })
mapKey("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Utils
mapKey("n", "<C-y>", "ggVG", { desc = "Select all" })
mapKey("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open quickfix list" })
mapKey("n", "<leader>k", vim.diagnostic.open_float, { desc = "See diagnostic message" })
mapKey("n", "<leader>n", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
mapKey("n", "<leader>N", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })

-- Increment/decrement
mapKey("n", "+", "<C-a>", { desc = "Increment number" })
mapKey("n", "-", "<C-x>", { desc = "Decrement number" })

-- Center screen when jumping
mapKey("n", "n", "nzzzv", { desc = "Next search result" })
mapKey("n", "N", "Nzzzv", { desc = "Previous search result" })
mapKey("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
mapKey("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })

-- Find file
mapKey("n", "<leader>ff", ":find ", { desc = "Find file" })

-- Clear highlights on search when pressing <Esc> in normal mode
mapKey("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- ============================================================================
-- USEFUL FUNCTIONS
-- ============================================================================

-- Toggle file explorer
mapKey("n", "<leader>e", function()
	if vim.bo.filetype == "netrw" then
		vim.cmd("b#")
	else
		vim.cmd("Explore")
	end
end, { desc = "Toggle file explorer" })

-- Copy Full File-Path
mapKey("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path", silent = true })

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		local line = mark[1]
		local ft = vim.bo.filetype
		if
			line > 0
			and line <= lcount
			and vim.fn.index({ "commit", "gitrebase", "xxd" }, ft) == -1
			and not vim.o.diff
		then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

-- ============================================================================
-- FLOATING TERMINAL
-- ============================================================================

-- terminal
local terminal_state = {
	buf = nil,
	win = nil,
	is_open = false,
}

local function FloatingTerminal()
	-- If terminal is already open, close it (toggle behavior)
	if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
		vim.api.nvim_win_close(terminal_state.win, false)
		terminal_state.is_open = false
		return
	end

	-- Create buffer if it doesn't exist or is invalid
	if not terminal_state.buf or not vim.api.nvim_buf_is_valid(terminal_state.buf) then
		terminal_state.buf = vim.api.nvim_create_buf(false, true)
		-- Set buffer options for better terminal experience
		vim.api.nvim_buf_set_option(terminal_state.buf, "bufhidden", "hide")
	end

	-- Calculate window dimensions
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	-- Create the floating window
	terminal_state.win = vim.api.nvim_open_win(terminal_state.buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	-- Set transparency for the floating window
	vim.api.nvim_win_set_option(terminal_state.win, "winblend", 0)

	-- Set transparent background for the window
	vim.api.nvim_win_set_option(
		terminal_state.win,
		"winhighlight",
		"Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder"
	)

	-- Define highlight groups for transparency
	vim.api.nvim_set_hl(0, "FloatingTermNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatingTermBorder", { bg = "none" })

	-- Start terminal if not already running
	local has_terminal = false
	local lines = vim.api.nvim_buf_get_lines(terminal_state.buf, 0, -1, false)
	for _, line in ipairs(lines) do
		if line ~= "" then
			has_terminal = true
			break
		end
	end

	if not has_terminal then
		vim.fn.termopen(os.getenv("SHELL"))
	end

	terminal_state.is_open = true
	vim.cmd("startinsert")

	-- Set up auto-close on buffer leave
	vim.api.nvim_create_autocmd("BufLeave", {
		buffer = terminal_state.buf,
		callback = function()
			if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
				vim.api.nvim_win_close(terminal_state.win, false)
				terminal_state.is_open = false
			end
		end,
		once = true,
	})
end

-- Function to explicitly close the terminal
local function CloseFloatingTerminal()
	if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
		vim.api.nvim_win_close(terminal_state.win, false)
		terminal_state.is_open = false
	end
end

-- Key mappings
mapKey("n", "<leader>`", FloatingTerminal, { noremap = true, silent = true, desc = "Toggle floating terminal" })
mapKey("t", "<Esc>", function()
	if terminal_state.is_open then
		vim.api.nvim_win_close(terminal_state.win, false)
		terminal_state.is_open = false
	end
end, { noremap = true, silent = true, desc = "Close floating terminal from terminal mode" })

-- ============================================================================
-- TABS
-- ============================================================================

-- Tab display settings
vim.opt.showtabline = 1 -- Always show tabline (0=never, 1=when multiple tabs, 2=always)
vim.opt.tabline = "" -- Use default tabline (empty string uses built-in)

-- Transparent tabline appearance
vim.cmd([[
  hi TabLineFill guibg=NONE ctermfg=242 ctermbg=NONE
]])

-- Alternative navigation (more intuitive)
mapKey("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
mapKey("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })

-- Tab moving
mapKey("n", "<leader>tm", ":tabmove<CR>", { desc = "Move tab" })
mapKey("n", "<leader>t>", ":tabmove +1<CR>", { desc = "Move tab right" })
mapKey("n", "<leader>t<", ":tabmove -1<CR>", { desc = "Move tab left" })

-- Function to open file in new tab
local function open_file_in_tab()
	vim.ui.input({ prompt = "File to open in new tab: ", completion = "file" }, function(input)
		if input and input ~= "" then
			vim.cmd("tabnew " .. input)
		end
	end)
end

-- Function to duplicate current tab
local function duplicate_tab()
	local current_file = vim.fn.expand("%:p")
	if current_file ~= "" then
		vim.cmd("tabnew " .. current_file)
	else
		vim.cmd("tabnew")
	end
end

-- Function to close tabs to the right
local function close_tabs_right()
	local current_tab = vim.fn.tabpagenr()
	local last_tab = vim.fn.tabpagenr("$")

	for i = last_tab, current_tab + 1, -1 do
		vim.cmd(i .. "tabclose")
	end
end

-- Function to close tabs to the left
local function close_tabs_left()
	local current_tab = vim.fn.tabpagenr()

	for i = current_tab - 1, 1, -1 do
		vim.cmd("1tabclose")
	end
end

-- Enhanced keybindings
mapKey("n", "<leader>tO", open_file_in_tab, { desc = "Open file in new tab" })
mapKey("n", "<leader>td", duplicate_tab, { desc = "Duplicate current tab" })
mapKey("n", "<leader>tr", close_tabs_right, { desc = "Close tabs to the right" })
mapKey("n", "<leader>tL", close_tabs_left, { desc = "Close tabs to the left" })

-- Function to close buffer but keep tab if it's the only buffer in tab
local function smart_close_buffer()
	local buffers_in_tab = #vim.fn.tabpagebuflist()
	if buffers_in_tab > 1 then
		vim.cmd("bdelete")
	else
		-- If it's the only buffer in tab, close the tab
		vim.cmd("tabclose")
	end
end
mapKey("n", "<leader>bd", smart_close_buffer, { desc = "Smart close buffer/tab" })

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.lsp"),
	require("plugins.git"),
	require("plugins.telescope"),
	require("plugins.mini"),
	require("plugins.ai"),
	require("plugins.extras"),
})
