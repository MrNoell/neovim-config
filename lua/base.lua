vim.cmd("autocmd!")

-- IDK WHAT TO NAME THIS SHIT
vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.title = true
vim.opt.scrolloff = 10
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.mouse = 'a'

-- ENCODING
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- STATUS LINE
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.showmode = false

-- SEARCHING
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- INDENTING
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- HIGHLIGHTS | split it into its own file
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0 -- idk
vim.opt.pumblend = 5 -- idk
vim.opt.wildoptions = "pum"
vim.opt.background = "dark"

-- KEYMAPS | split it into its own file
local keymap = vim.keymap

keymap.set('n', 'x', "\"_x")
keymap.set('n', '+', "<C-a>")
keymap.set('n', '-', "<C-x>")
keymap.set('n', "<C-a>", "gg<S-v>G")

keymap.set('', "<C-l>", "<C-w>l")
keymap.set('', "<C-k>", "<C-w>k")
keymap.set('', "<C-j>", "<C-w>j")
keymap.set('', "<C-h>", "<C-w>h")

keymap.set('', "<C-n>", ":Lex<CR>")

-- FUTURE ME'S PROBLEM 
--vim.g.netrw_keepdir = 0
--vim.g.netrw_winsize = 17
--vim.g.netrw_banner = 0
--vim.g.netrw_liststyle = 3
--vim.g.netrw_browse_split = 4
--vim.g.netrw_localcopydircmd = 'cp -r'


-- PLUGINS | split it into its own file
vim.cmd[[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	require('lualine').setup {
		options = {
			theme = "tokyonight",
			component_separators = '',
			section_separators = { left = '', right = '' },
		}
	}
    use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
    }
	require'nvim-treesitter.configs'.setup {
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		}
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'neovim/nvim-lspconfig'
	use 'folke/tokyonight.nvim'
	vim.cmd[[colorscheme tokyonight-night]]
end)
