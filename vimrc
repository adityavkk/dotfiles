" Colorscheme
set background=dark
colorscheme hybrid
set t_Co=256

set nocompatible
syntax on

" automatically remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

set ruler
set number relativenumber
set numberwidth=5

execute pathogen#infect()
filetype plugin indent on


""" Behavior Modifiers
let mapleader=','

" indenting
set cindent
set expandtab
set shiftround
set shiftwidth=2                        " an autoindent is two spaces
set tabstop=2                           " a tab is two spaces
set softtabstop=2

" better split window feel
set splitbelow
set splitright

" set esc keys to timeout faster
set ttimeoutlen=100

" set mouse mode
set mouse=a
set tabstop=2
set autoread

" quicker split movements
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" make it obvious where 80 char is
set colorcolumn=80
hi LineProximity ctermfg=white ctermbg=gray guifg=white guibg=#A3A3A3
hi LineOverflow  ctermfg=white ctermbg=red guifg=white guibg=#FF2270

autocmd BufEnter,VimEnter,FileType *.* let w:m1=matchadd('LineProximity', '\%<85v.\%>80v', -1)
autocmd BufEnter,VimEnter,FileType *.* let w:m2=matchadd('LineOverflow', '\%>84v.\+', -1)

autocmd BufEnter,VimEnter,FileType,VimEnter *.* autocmd WinEnter *.rb,*.coffee let w:created=1
autocmd BufEnter,VimEnter,FileType,VimEnter *.* let w:created=1

" status line
set laststatus=2                        " display status line
set statusline=%F
set wildmenu
set showcmd

set lazyredraw                          " enable better scroll with syntastic
set cursorline                          " line highlighing
set nowrap                              " don't wrap lines
set backspace=indent,eol,start          " backspace through everything

"List Chars
set list
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                              " off and the line continues
                                              " beyond the right of the screen
set listchars+=precedes:<         " The character to show in
                                              "   the last column when wrap is

" Copy and paste to system clipboard
set clipboard=unnamed

""" PLUGINS
"NerdTree
nmap <leader>ne :NERDTree<cr>

" CtrlP
let g:ctrl_map = ''
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules',
      \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
      \ }

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Vim-Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:one_allow_italics = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='one'
