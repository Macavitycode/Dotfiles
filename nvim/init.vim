"#############################################################################
"  _       _ _         _           
" (_)     (_) |       (_)          
"  _ _ __  _| |___   ___ _ __ ___  
" | | '_ \| | __\ \ / / | '_ ` _ \ 
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"
"
"#############################################################################

" This file goes in ~/.config/nvim/init.vim


"Plugins
"-----------------------------------------------------------------------------

" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Calling plugins
call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'tpope/vim-fugitive'           " Git integration
    Plug 'mbbill/undotree'              " Gives a file changes tree
    Plug 'itchyny/lightline.vim'        " Status line plugin
    Plug 'crusoexia/vim-monokai'        " Monokai colorshceme
    Plug 'tomasr/molokai'               " Molokai colourscheme
    Plug 'preservim/nerdcommenter'      " Commenter
    Plug 'jiangmiao/auto-pairs'         " Gives automatic bracket pairs
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " Tree sitter
    Plug 'preservim/nerdtree'           " Nerd Tree

    Plug 'francoiscabrol/ranger.vim'    " Ranger in nvim
    Plug 'rbgrouleff/bclose.vim'        " Ranger Dependancy in nvim

    " Plug 'taketwo/vim-ros'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" Vim settings
"-----------------------------------------------------------------------------

syntax on                               " For syntax highlighting

colorscheme monokai                     " Set colorscheme from here

set termguicolors                       " Actual bright color support
set t_Co=256                            " Support 256 colours in terminal.

filetype plugin on                      "Checks for filetype
hi Normal guibg=NONE ctermbg=NONE       
set laststatus=2 noshowmode             " Always shows status in airline
                                        " Makes background same as terminal
set noerrorbells visualbell             " No sounds on errors
set ruler                               " Shows cursor position
set tabstop=4 softtabstop=4 expandtab   " Sets tabs's width (tabs -> spaces)
set shiftwidth=4                        " Shifts 4 spaces (Indenting)(V + >)
set smartindent autoindent              " Auto indents from indented line
set nu nowrap                           " Shows line numbers, no wrapping
set ignorecase smartcase                " Disables case sensitive search
set noswapfile nobackup                 " Disables swapfiles
set undodir=~/.config/nvim/undodir      " Sets undodir (make this dir)
set undofile                            " Sets undofiles for every file
set incsearch hlsearch                  " Enables incremental search

set path+=**                            " Allows vim to look through files
set clipboard+=unnamedplus
set mouse=a                             " Allows mouse usage in terminal

filetype plugin on


" Plugin settings
"-----------------------------------------------------------------------------

let g:monokai_term_italic = 0           " Disables comment italics
let g:monokai_gui_italic = 0            " Disables comment italics for gui

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDAltDelims_xml = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

let g:molokai_original = 1
let g:rehash256 = 1

nnoremap <C-_> :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <C-_> :call nerdcommenter#Comment(0,"toggle")<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>l  <Plug>(coc-format-selected)
nmap <leader>l  <Plug>(coc-format-selected)

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


" Remaps
"-----------------------------------------------------------------------------

let mapleader = " "                     " Sets <leader> key

nnoremap <C-h> <C-w>h<CR>               
nnoremap <C-j> <C-w>j<CR>
nnoremap <C-k> <C-w>k<CR>
nnoremap <C-l> <C-w>l<CR>

nnoremap <leader>n :tabn<CR> 
nnoremap <leader>p :tabp<CR>

nnoremap <C-z> :UndotreeToggle<CR>
nnoremap <C-s> :retab<CR>:w<CR>
imap <C-s> <Esc>:retab<CR>:w<CR>

nnoremap <esc><esc> :let @/=""<CR>
tnoremap <Esc><Esc> <C-\><C-n>

nnoremap <silent> <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" Auto Commands
" ----------------------------------------------------------------------------

" This sets all tab related stuff to 2 for xml files
autocmd FileType xml setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
" autocmd FileType c nnoremap <leader>c :!clear && gcc % -o %< && ./%< <CR>

" auto-format
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePost *.tex silent! execute "!pdflatex % %.pdf >/dev/null 2>&1"
autocmd BufWritePost *.md silent! execute "!pandoc % -o %.pdf >/dev/null 2>&1"

" maintain folds
" silent au BufWinLeave * silent mkview
" silent au BufWinEnter * silent loadview

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 
            \ && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Tree Sitter specific
" ----------------------------------------------------------------------------

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "rust" },  -- list of language that will be disabled
  },
}
EOF
