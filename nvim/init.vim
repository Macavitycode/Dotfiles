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

" Plugins and auto-installing vim-plug
"-----------------------------------------------------------------------------
 
" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Calling plugins
call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'tpope/vim-fugitive'           " Git integration

    Plug 'mbbill/undotree'              " Gives a file changes tree

    Plug 'itchyny/lightline.vim'        " Status line plugin
    Plug 'crusoexia/vim-monokai'        " Monokai colorshceme
    Plug 'patstockwell/vim-monokai-tasty' " Monokai tasty
    " Plug 'sickill/vim-monokai'
    
    " Plug 'taketwo/vim-ros'            " Ros for vimDoesn't work :'( 
    
    Plug 'preservim/nerdcommenter'      " Commenter

    Plug 'MaxMEllon/vim-jsx-pretty'     " JS highlighting
    Plug 'pangloss/vim-javascript'      " JS highlighting
    Plug 'jiangmiao/auto-pairs'         " Gives automatic bracket pairs

    Plug 'prettier/vim-prettier', {'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json',
    \ 'markdown', 'yaml', 'html']}
    " Prettifies all the above mentioned languages

    " Plug 'mattn/emmet-vim'

    " Plug 'ycm-core/YouCompleteMe'       " Gives autocomplete
"   !! DOESEN'T work directly on Manjaro !!     
    Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()


" Plugin settings
"-----------------------------------------------------------------------------

" Both of these seem to not be working
" let g:NERDTree_banner=0               " Disables NERDTree banner
" let g:NERDTree_WinSize=1              " Sets NERDTree window size as %

let g:monokai_term_italic = 0           " Disables comment italics
let g:monokai_gui_italic = 0            " Disables comment italics for gui

set laststatus=2                        " Always shows status line
set noshowmode                          " Disables status shown in command line

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

source $HOME/.config/nvim/plug-config/coc.vim

let g:vim_monokai_tasty_italic = 1

" let g:lightline = {
"       \ 'colorscheme': 'monokai_tasty',
"       \ }


" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
let g:NERDAltDelims_xml = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

nnoremap <C-_> :call NERDComment(0,"toggle")<CR>
vnoremap <C-_> :call NERDComment(0,"toggle")<CR>

" Vim settings
"-----------------------------------------------------------------------------

syntax on                               " For syntax highlighting

colorscheme monokai                   " Set colorscheme from here
" colorscheme vim-monokai-tasty

set termguicolors                       " Actual bright color support
set t_Co=256                            " Support 256 colours in terminal.
                                        " No comment in the following line (?)

filetype plugin on                      "Checks for filetype
hi Normal guibg=NONE ctermbg=NONE       
                                        " Makes background same as terminal

set noerrorbells                        " No sounds on errors
set visualbell                          " Visual que on errors
set ruler                               " Shows cursor position

set tabstop=4 softtabstop=4 expandtab   " Sets tabs's width (tabs -> spaces)
set shiftwidth=4                        " Shifts 4 spaces (Indenting)(V + >)
set smartindent                         " Auto indents from indented line
set autoindent                          " Inherits indent from previous lines

set nu                                  " Shows line numbers
set number relativenumber               " Gives linenumbers relatively

set nowrap                              " Doesn't wrap text

set ignorecase                          " Disables case sensitive search
set smartcase                           " Enables case sensitive search on caps

set noswapfile                          " Disables swapfiles
set nobackup                            " Disables backups (undodir is set)
set undodir=~/.config/nvim/undodir      " Sets undodir (make this dir)
set undofile                            " Sets undofiles for every file

set incsearch                           " Enables incremental search
set hlsearch                            " Enables highlights for searches

set path+=**                            " Allows vim to look through files
set clipboard+=unnamedplus

filetype plugin on
set omnifunc=syntaxcomplete#Complete


" netrw settings
"-----------------------------------------------------------------------------

let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:netrw_altv=1



" Remaps
"-----------------------------------------------------------------------------

let mapleader = " "                     " Sets <leader> key

" Jump between splits with Ctrl+(hjkl)
nnoremap <C-h> <C-w>h<CR>               
nnoremap <C-j> <C-w>j<CR>
nnoremap <C-k> <C-w>k<CR>
nnoremap <C-l> <C-w>l<CR>

" Jump between tabs with <leader>+(np)
nnoremap <leader>n :tabn<CR> 
nnoremap <leader>p :tabp<CR>

" Toggles NERDTree with <leader>+t (adding vertical resize here)
" nnoremap <leader>t :NERDTreeToggle .<CR> :vertical res -10<CR>

" Toggles netrw with <leader>+t
nnoremap <silent><leader>t :call ToggleNetrw()<CR>

" Toggles Undotree with Ctrl+z
nnoremap <C-z> :UndotreeToggle<CR>

" Close current buffer with Ctrl+x
nnoremap <C-x> :q<CR>

" Save file with Ctrl+s
nnoremap <C-s> :retab<CR>:w<CR>
imap <C-s> <Esc>:retab<CR>:w<CR>

" Removes all highlights with <esc><esc>
nnoremap <esc><esc> :let @/=""<CR>

" Tab to autocomplete
" imap <Tab> <C-P>

nmap <silent> \gt :vsp<CR><Plug>(coc-definition)<C-W>T

" TERMINAL MODE REMAP
tnoremap <Esc><Esc> <C-\><C-n>

" Command remaps
"-----------------------------------------------------------------------------

" Remaps wq to wq
" command WQ wq
" command Wq wq
" command W w
" command Q q


" Auto Commands
" ----------------------------------------------------------------------------

" This sets all tab related stuff to 2 for xml files
autocmd FileType xml setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType c nnoremap <leader>c :!clear && gcc % -o %< && ./%< <CR>
