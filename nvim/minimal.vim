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

"Plugins
"-----------------------------------------------------------------------------

" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Calling plugins
call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'itchyny/lightline.vim'        " Status line plugin
    Plug 'crusoexia/vim-monokai'        " Monokai colorshceme
    Plug 'preservim/nerdcommenter'      " Commenter
    Plug 'jiangmiao/auto-pairs'         " Gives automatic bracket pairs

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


" Remaps
"-----------------------------------------------------------------------------

let mapleader = " "                     " Sets <leader> key

nnoremap <C-h> <C-w>h<CR>               
nnoremap <C-j> <C-w>j<CR>
nnoremap <C-k> <C-w>k<CR>
nnoremap <C-l> <C-w>l<CR>

nnoremap <leader>n :tabn<CR> 
nnoremap <leader>p :tabp<CR>

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

