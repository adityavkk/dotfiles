" Syntax
let python_highlight_all=1
syntax on

" Color Schemes
set t_Co=256
syntax enable
" set background=light
set background=dark
colorscheme hybrid
let g:PaperColor_Light_Override = { 'background' : '#abcdef', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' }
let g:PaperColor_Dark_Override = { 'background' : '#1c1c1c', 'cursorline' : '#abcdef', 'matchparen' : '#3a3a3a', 'comment' : '#5f875f' }

" AirLine
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:one_allow_italics = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'

" Line Numbers
set ruler
set number relativenumber
set numberwidth=5

" Indenting

set cindent
set expandtab
set shiftround
set shiftwidth=2                        " an autoindent is two spaces
set tabstop=2                           " a tab is two spaces
set softtabstop=2

" Remove Trailing Whitespace
autocmd BufWritePre * %s/\s\+$//e

" set esc keys to timeout faster
set ttimeoutlen=100

set cursorline                          " line highlighing
set nowrap                              " don't wrap lines
set backspace=indent,eol,start          " backspace through everything

" Mouse
set mouse=a
set tabstop=2
set autoread

"Leader
let mapleader=','

" Standard Hotkeys
map <Leader>qh :helpclose<CR>
map <Leader>q :pclose<CR>

"Copy and paste to system clipboard
set clipboard=unnamed

" Quicker Window Movement
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" autosave on blur
au FocusLost * silent! wall

" Backup and swap files
set backupdir^=~/.vim/_backup//         " where to put backup files.
set directory^=~/.vim/_temp//           " where to put swap files.

" Toggle highlight
nmap <Leader>hs :set hlsearch! hlsearch?<CR>
call plug#begin('~/.local/share/nvim/plugged')

""""""""""""""""""""""""""""""""""""""""" Splitting """""""""""""""""""""""""""""""""""""""
" quicker splitting
map <Leader>sp :split<CR>
map <Leader>vp :vsplit<CR>

" Better movement between splits
nnoremap <C-J> <C-w><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More natural split opening
set splitbelow
set splitright

"Max out the height of the current split
"ctrl + w _

"Max out the width of the current split
"ctrl + w |

"Normalize all split sizes, which is very handy when resizing terminal
"ctrl + w =

" Language server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Purescript support with psc ide
    Plug 'FrigoEU/psc-ide-vim'

"--- Provides Multi-Entry Selection Ui
    Plug 'junegunn/fzf'

"--- Vim Surround
    Plug 'tpope/vim-surround'

"---Async completion framework for nvim
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'ervandew/supertab' " Povides omni complete with TAB

" Wrapper around Ack/Ag
    Plug 'mileszs/ack.vim'

" Make sure you use single quotes
    Plug 'scrooloose/nerdcommenter'
" On-demand loadingclilpboard
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"---Ctrl-p
    Plug 'kien/ctrlp.vim'
"---Color Schemes
    Plug 'flazz/vim-colorschemes'
    Plug 'vim-airline/vim-airline' "AirLine
    Plug 'vim-airline/vim-airline-themes'
    Plug 'edkolev/tmuxline.vim'


"---Buffer management
    Plug 'jeetsukumaran/vim-buffergator'

"---Syntax Highlighting
    Plug 'leafgarland/typescript-vim'
    Plug 'purescript-contrib/purescript-vim' " purescript

call plug#end()

augroup filetype_rust
    autocmd!
    autocmd BufReadPost *.rs setlocal filetype=rust
augroup END

augroup filetype_javascript
    autocmd!
    autocmd BufReadPost *.jsx setlocal filetype=javascript
    autocmd BufReadPost *.js setlocal filetype=javascript
    autocmd BufReadPost *.ts setlocal filetype=typescript
augroup END

augroup filetype_purescript
    autocmd!
    autocmd BufReadPost *.psc setlocal filetype=purescript
augroup END

" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

""""""""""""""""""""""""""""""""""""""" LANGUAGE SERVER """"""""""""""""""""""""""""""""""""""
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'typescript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'haskell': ['hie-wrapper'],
    \ }

let $RUST_BACKTRACE = 1
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

nnoremap <Leader>, :call LanguageClient_contextMenu()<CR>
map gh :call LanguageClient#textDocument_hover()<CR>
map gd :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

""""""""""""""""""""""""""""""""""""""""" DEOPLETE """""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
    \ 'javascript': ['LanguageClient'],
    \ 'typescript': ['LanguageClient'],
    \ 'haskell': ['LanguageClient'],
\})

""""""""""""""""""""""""""""""""""""""""" NERD TREE """""""""""""""""""""""""""""""""""""""
" Use Ctrl-N to toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

" Open NerdTree automatically when vim starts up and no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NerdTree automatically when vim starts in a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('py', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('hs', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('cpp', 'Magenta', 'none', '#ff00ff', '#151515')

""""""""""""""""""""""""""""""""""""""""" CTRL-P """""""""""""""""""""""""""""""""""""""

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git' " ignore node_modules and git

""""""""""""""""""""""""""""""""""""""""" VIM-BUFFERGATOR """""""""""""""""""""""""""""""""""""""
" <Leader>b to open a window listing all buffers
"
" gb or gB to move through most recently used buffer
"
" <Leadder><DIRECTION> to split a new window left, up, right or down to edit
" the previous buffer there

""""""""""""""""""""""""""""""""""""""""" ACK.VIM """""""""""""""""""""""""""""""""""""""
" If silver-searcher is available use that instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nnoremap <C-f> :Ack!

""""""""""""""""""""""""""""""""""""""""" DEBUGGING """""""""""""""""""""""""""""""""""""""
let g:psc_ide_log_level = 3 " Log level for psc ide

