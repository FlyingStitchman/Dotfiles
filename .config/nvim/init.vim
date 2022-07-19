" (Neo)vim Configuration 
" By Flying_Stitchman
" 4 Jan 2022

 " Basic Configuration

syntax on
set hlsearch
set ignorecase
set number
set noswapfile
inoremap jk <ESC>
let mapleader = "`"

 " Make Lines Wrap Properly
set linebreak
set wrap
 " True Color Support
if has('nvim')
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum
  set termguicolors
endif
colorscheme cwcolors

 " Highlight Trailing Spaces
let c_space_errors=1

set noincsearch

 " Plugs
call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()
 " C Syntax highlighting
lua << EOF
require'lspconfig'.ccls.setup{
	init_options = {
		highlight = {
			lsRanges = true;
			}
		}
	}
EOF

 " Color Themes
colorscheme tokyonight
