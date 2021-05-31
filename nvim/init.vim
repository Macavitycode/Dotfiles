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
    Plug 'patstockwell/vim-monokai-tasty' " Monokai tasty
    Plug 'preservim/nerdcommenter'      " Commenter
    Plug 'jiangmiao/auto-pairs'         " Gives automatic bracket pairs
    Plug 'prettier/vim-prettier', {'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json',
    \ 'markdown', 'yaml', 'html']}

    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'

call plug#end()


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

nnoremap <C-_> :call NERDComment(0,"toggle")<CR>
vnoremap <C-_> :call NERDComment(0,"toggle")<CR>


" LSP Settings
"-----------------------------------------------------------------------------

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true

luafile ~/.config/nvim/LSPs/lspython.lua
luafile ~/.config/nvim/LSPs/lsyamlls.lua
luafile ~/.config/nvim/LSPs/lsvimls.lua
luafile ~/.config/nvim/LSPs/lscmake.lua
luafile ~/.config/nvim/LSPs/lscland.lua
luafile ~/.config/nvim/LSPs/lsbash.lua



" Vim settings
"-----------------------------------------------------------------------------

syntax on                               " For syntax highlighting

colorscheme monokai                     " Set colorscheme from here

set termguicolors                       " Actual bright color support
set t_Co=256                            " Support 256 colours in terminal.
                                        " No comment in the following line (?)
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

filetype plugin on


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

imap <Tab> <C-N>
nnoremap <silent> <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>


" Auto Commands
" ----------------------------------------------------------------------------

" This sets all tab related stuff to 2 for xml files
autocmd FileType xml setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType c nnoremap <leader>c :!clear && gcc % -o %< && ./%< <CR>

" auto-format
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

