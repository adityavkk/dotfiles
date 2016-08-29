set mouse=a
set tabstop=2
set number
highlight LineNr ctermfg=black ctermbg=white
set backspace=indent,eol,start
set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader = ","
nmap <leader>ne :NERDTree<cr>
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap TE :ConqueTermSplit 
nnoremap P "+p
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
vnoremap <C-c> "*y

"folding settings
set foldmethod=syntax   "fold based on indent
"set foldnestmax=10      "deepest fold is 10 levels
set foldlevelstart=1
" set nofoldenable        "dont fold by default
" set foldlevel=1         "this is just what i use

let javaScript_fold=1         " JavaScript

" Airline footer
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

"Markdown Preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_github=1

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>
" map <C-f> :call JsBeautify()<cr>

autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jewes/Conque-Shell'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'SirVer/ultisnips'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'tpope/vim-commentary'
Plugin 'wesQ3/vim-windowswap'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'gregsexton/MatchTag'
" Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'JamshedVesuna/vim-markdown-preview'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" colorscheme base16-default-dark

set t_Co=256
syntax enable
set background=dark
colorscheme hybrid
" colorscheme seti
" colorscheme highwayman
" colorscheme colorsbox-stbright
" colorscheme colorsbox-stnight
" colorscheme colorsbox-materia
" colorscheme base16-default-dark
" colorscheme distinguished
" colorscheme lanox
" colorscheme ego

" imap <C-c> <CR><Esc>O
