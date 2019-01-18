" Color Scheme
" Set typewriter as colorscheme
colorscheme typewriter
"colorscheme hybrid

" Set typewriter airline theme
let g:airline_theme = 'typewriter'
"let g:airline_theme='one'

" Activate FOCUS mode with F12
nmap <F12> :Goyo <bar> Limelight!!<CR>"


" Change the cursor from block to i-beam in INSERT mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
augroup myCmds
  au!
  autocmd VimEnter * silent !echo -ne "\e[1 q"
augroup END
" Copy and paste to system clipboard
set clipboard=unnamedplus,autoselect

" Colorscheme
"set background=dark
set t_Co=256

set nocompatible
syntax on
syntax enable

set showmode
set smartcase
set smarttab
set smartindent
set autoindent
set incsearch
set history=1000

set completeopt=menuone,menu,longest
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set completeopt+=longest

set cmdheight=1

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

nnoremap <C-n> :source ~/dev/dotfiles/vim/writer.vim

" make it obvious where 80 char is
set colorcolumn=150
"hi LineProximity ctermfg=white ctermbg=gray guifg=white guibg=#A3A3A3
"hi LineOverflow  ctermfg=white ctermbg=red guifg=white guibg=#FF2270

"autocmd BufEnter,VimEnter,FileType *.* let w:m1=matchadd('LineProximity', '\%<85v.\%>80v', -1)
"autocmd BufEnter,VimEnter,FileType *.* let w:m2=matchadd('LineOverflow', '\%>84v.\+', -1)

"autocmd BufEnter,VimEnter,FileType,VimEnter *.* autocmd WinEnter *.rb,*.coffee let w:created=1
"autocmd BufEnter,VimEnter,FileType,VimEnter *.* let w:created=1

" status line
set laststatus=2                        " display status line
set wildmenu
set showcmd


set lazyredraw                          " enable better scroll with syntastic
"set cursorline                          " line highlighing
"set nowrap                              " don't wrap lines
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
map <Leader>s :SyntasticToggleMode<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" GHC-MOD
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

" Vim-Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:one_allow_italics = 1
let g:airline_powerline_fonts = 1

" Tmux Line
  let g:tmuxline_preset = {
          \ 'a': '#S',
          \ 'win': '#I #W',
          \ 'cwin': '#I #W',
          \ 'x': '♫ #(node ~/scripts/tmux/spotify-get-current-track.js)',
          \ 'y': '#(~/dotfiles/bin/tmux-battery-master/tmux-battery)',
          \ 'z': '%R',
          \ 'options': {
          \'status-justify': 'left'}
          \}

if exists('$TMUX')
    function! TmuxOrSplitSwitch(wincmd, tmuxdir)
      let previous_winnr = winnr()
      silent! execute "wincmd " . a:wincmd
      if previous_winnr == winnr()
        call system("tmux select-pane -" . a:tmuxdir)
        redraw!
      endif
      <C-w>wincmd
    endfunction
    let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
    let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
    let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

    nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
    nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
    nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
    nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
    else
      map <C-h> <C-w>h
      map <C-j> <C-w>j
      map <C-k> <C-w>k
      map <C-l> <C-w>l
endif

" Vim-fsharp
let g:fsharp_completion_helptext = 1
let g:syntastic_fsharp_checkers = ['syntax']
set omnifunc=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

" Vim-Dash
nmap <silent> <leader>d <Plug>DashSearch

"Vim Javascript
set conceallevel=1
set cole=1

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" VIM Ack
" use ag but fall back to ack if it doesn't exist
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

noremap <Leader>a :Ack<CR>

" Supertab
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
    imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  else " no gui
      if has("unix")
          inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
        endif
      endif

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Tabularize
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

"Goyo/Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
noremap <Leader>w :Goyo<CR>

"Text wrapping
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set formatoptions-=t
