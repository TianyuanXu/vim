" use vim, not vi
set nocompatible




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Package Management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
Plugin 'flazz/vim-colorschemes'
Plugin 'jaxbot/browserlink.vim'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo


" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required


" NERDTree setup
" Open NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree

" Open NERDTree automatically when vim starts up with no file specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree with Ctrl + o
map nt<CR> :NERDTreeToggle<CR>

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CtrlP setup
" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrl_cmd  = 'CtrlP'

"When invoked, unless a starting directory is specified, CtrlP will set its
"local working directory according to this variable: 
let g:ctrlp_working_path_mode = 'ra'

"Exclude files or directories using Vim's wildignore: 
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  

"YouCompleteMe setup
let mapleader = ','
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jh :YcmCompleter GetType<CR>

"Tabular setup
if exists(":Tabularize")
  nnoremap <leader>ae :Tabularize /=<CR>
  nnoremap <leader>aa :Tabularize /&<CR>
  nnoremap <leader>at :Tabularize /<bar><CR>
endif




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Various Basic Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" no swap file
set noswapfile
" set nobackup

"syntax highlighting
syntax on

" spell check
syntax spell toplevel
"set spell spelllang=en_us

" better command-line completion
set wildmenu

" show partial commands in the last line of the screen
set showcmd

" hide a buffer when it is abandoned
set hid

" show matching brackets when text indicator is over them
set showmatch

" highlight searches
" set hlsearch

" use case-insensitive search, except when using capital letters
set ignorecase
set smartcase

" when opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set smartindent

" stop certain movements from always going to the first character of a line.
" While this behavior deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" always display the status line
set laststatus=2

" instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files
set confirm

" enable use of the mouse for all modes
set mouse=a

" set the command window height to 2 lines, to avoid cases of having to "press
" enter to continue"
set cmdheight=2

" display line numbers on the left
set number

" use 2 spaces instead of tabs
set shiftwidth=4
set softtabstop=4
set expandtab




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Wrapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set t_Co=256

set wrap
set tw=79
set formatoptions+=t

set colorcolumn=80
"hi ColorColumn ctermbg=grey guibg=grey

" default colorscheme
colorscheme distinguished
"colorscheme codeschool
"colorscheme Tomorrow-Night    " great for python, good for latex
"colorscheme hybrid            " great for latex, not so good for python
"colorscheme lucius            " good for latex, not so good for python
"colorscheme distinguished 
autocmd BufEnter * colorscheme default
autocmd BufEnter *.shtml colorscheme codeburn
autocmd BufEnter *.tex colorscheme hybrid
autocmd BufEnter *.py colorscheme Tomorrow-Night




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" shortcut for compilation of tex files
map \wl :w<Enter>\ll
map \ws :w<Enter>\ll\ls

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*


" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" preview html file in firefox
nnoremap \wh :silent update<Bar>silent !firefox %:p &<CR>



            
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts to speed up typing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" automatically entering and exiting brackets
autocmd FileType python inoremap () ()<Esc>i
autocmd FileType python inoremap [] []<Esc>i
autocmd FileType python inoremap {} {}<Esc>i
autocmd FileType python inoremap "" ""<Esc>i
autocmd FileType python inoremap $$ $$<Esc>i
autocmd FileType python inoremap <C-j> <Esc>/[)}"'$\]>]<CR>a
