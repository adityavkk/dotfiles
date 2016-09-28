""" Appearance
"{{{

  " nocompatible mode, enable IMproved
  set nocompatible

  " syntax highlighting
  syntax on

  " set color theme
  " colorscheme onedark
  " colorscheme ir_black
  " colorscheme grb256
  " colorscheme base16-default-dark

  set t_Co=256
  " syntax enable
  set background=dark
  colorscheme hybrid
  " colorscheme base16-tomorrow
  " colorscheme seti
  " colorscheme highwayman
  " colorscheme colorsbox-stbright
  " colorscheme colorsbox-stnight
  " colorscheme colorsbox-materia
  " colorscheme base16-default-dark
  " colorscheme distinguished
  " colorscheme lanox
  " colorscheme ego
  " set background=light
  " colorscheme PaperColor
  " let g:PaperColor_Light_Override = { 'background' : '#abcdef', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' }
  " let g:PaperColor_Dark_Override = { 'background' : '#1c1c1c', 'cursorline' : '#abcdef', 'matchparen' : '#3a3a3a', 'comment' : '#5f875f' }

  " imap <C-c> <CR><Esc>O

  " line numbers
  set ruler
  set number relativenumber
  set numberwidth=5

  " make it obvious where 80 char is
  " set colorcolumn=80

  " status line
  set laststatus=2                        " display status line
  set statusline=%F
  set wildmenu
  set showcmd

  set lazyredraw                          " enable better scroll with syntastic
  set cursorline                          " line highlighing
  set nowrap                              " don't wrap lines
  set backspace=indent,eol,start          " backspace through everything

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

	" List chars
  set list
	set listchars=""                  " Reset the listchars
  set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
  set listchars+=trail:.            " show trailing spaces as dots
	set listchars+=extends:>          " The character to show in the last column when wrap is
																		" off and the line continues beyond the right of the screen
	set listchars+=precedes:<         " The character to show in the last column when wrap is
																		" off and the line continues beyond the left of the screen

  " Enable the mouse
  set mouse=a
  set tabstop=2
  set autoread

"}}}


au CursorHold * checktime
" highlight LineNr ctermfg=black ctermbg=white
filetype off                  " required
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

""" Behavior Modifiers
"{{{

  " Key Modifiers
  "{{{

    " map leader key
    let mapleader=','

    " Copy and paste to system clipboard
    " nnoremap <C-c> "*y
    " nnoremap <C-v> "+p
    set clipboard=unnamed

    " more robust exiting commands
    command! Q q
    command! W w
    command! Wq wq
    command! WQ wq
    command! Qall qall

    " Save using ctrl-s
    map <C-s> <esc>:w<CR>
    imap <C-s> <esc>:w<CR>

    " quicker splitting
    map <Leader>sp :split<CR>
    map <Leader>vp :vsplit<CR>

    " quicker switching of syntax
    map <Leader>ss :set syntax=

    " quicker switching of colorscheme
    au VimEnter * map <Leader>cs :colorscheme<Space>

    " quicker window movements
    nnoremap <C-h> <C-w>h
    nnoremap <C-l> <C-w>l

    " buffer management
    map <Leader>bd :bd<CR>
    map <Leader>bn :bnext<CR>
    map <Leader>bv :bprevious<CR>

    " toggle background color
    map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark")<CR>

    " Toggle highlight
    nmap <Leader>hs :set hlsearch! hlsearch?<CR>

    " set space to toggle folds
    nnoremap <Space> za

    " create and open new file
    map <Leader>e :e <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

  "}}}

"}}}

""" Auto Modifiers
"{{{

  " autosave on blur
  au FocusLost * silent! wall

  " search settings
  set ignorecase
  set incsearch
  set smartcase
  set scrolloff=10
  set hlsearch!

  " spelling
  " setlocal spell spelllang=en
  " nmap ss :set spell!<CR>
  " set nospell
  " autocmd FileType gitcommit setlocal spell

  " set foldmarker
  " set foldmethod=marker

  " Wild Settings
  " Disable output and VCS files
  set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.so

  " Disable archive files
  set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

  " Ignore bundler and sass cache
  set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

  " Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
  set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

  " Ignore rails temporary asset caches
  set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

  " Disable temp and backup files
  set wildignore+=*.swp,*~,._*

  " Backup and swap files
  set backupdir^=~/.vim/_backup//         " where to put backup files.
  set directory^=~/.vim/_temp//           " where to put swap files.

"}}}

"folding settings
" set foldmethod=syntax   "fold based on indent
"set foldnestmax=10      "deepest fold is 10 levels
" set foldlevelstart=1
" set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" let javaScript_fold=1         " JavaScript
" Airline footer
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
" let g:airline_theme='papercolor'

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

"Plugins & Vundle
				"set the runtime path to include Vundle and initialize
				set rtp+=~/.vim/bundle/Vundle.vim
				call vundle#begin()
				" alternatively, pass a path where Vundle should install plugins
				"call vundle#begin('~/some/path/here')

				" let Vundle manage Vundle, required
				Plugin 'VundleVim/Vundle.vim'
        Plugin 'mileszs/ack.vim'                                 " File searching
				Plugin 'nathanaelkane/vim-indent-guides'
        Plugin 'scrooloose/nerdtree'
  			Plugin 'tpope/vim-vinegar'                               " Easier file browser
				Plugin 'ctrlpvim/ctrlp.vim'
        Plugin 'airblade/vim-gitgutter'
				Plugin 'marijnh/tern_for_vim'
				Plugin 'tpope/vim-fugitive'
				Plugin 'tpope/vim-repeat'
  			Plugin 'scrooloose/nerdcommenter'                        " Quick commenter
  			Plugin 'jeetsukumaran/vim-buffergator'                   " Buffer management
				Plugin 'wesQ3/vim-windowswap'
				Plugin 'terryma/vim-multiple-cursors'
				Plugin 'NLKNguyen/papercolor-theme'
				Plugin 'chriskempson/base16-vim'
				Plugin 'vim-airline/vim-airline'
				Plugin 'vim-airline/vim-airline-themes'
        Plugin 'JamshedVesuna/vim-markdown-preview'
				Plugin 'godlygeek/tabular'
        Plugin 'plasticboy/vim-markdown'
				Plugin 'rizzatti/dash.vim'
        Plugin 'ervandew/supertab'                               " Insert completions
        " Plugin 'bronson/vim-trailing-whitespace'                 " Highlight trailing whitespaces
			  Plugin 'pbrisbin/vim-mkdir'                              " Automatically create non-existent directories
  			Plugin 'kopischke/vim-fetch'                             " Allow vim to handle line and column numbers
        Plugin 'editorconfig/editorconfig-vim'                   " Editor config plugin

				" autocomplete
				Plugin 'Raimondi/delimitMate'                            " auto-completion of quotes, parens, brckets
				Plugin 'tpope/vim-surround'                              " Easy way to add parentheses, brackets, quotes, etc.
				" Plugin 'tpope/vim-endwise'                               " wisely add end to ruby and vim scripts
        Plugin 'Valloric/YouCompleteMe'                          " Code completion engine
				Plugin 'SirVer/ultisnips'                                " Ultimate snippets solution
				Plugin 'alvan/vim-closetag'                              " Auto close xml/html tags

				" display
        Plugin 'luochen1990/rainbow'                             " rainbow parentheses
        Plugin 'scrooloose/syntastic'
  			Plugin 'Valloric/MatchTagAlways'                         " highlight enclosing html/xml tags

				" movement
				Plugin 'matze/vim-move'                                  " Move lines and selections up and down
        Plugin 'justinmk/vim-sneak'                              " Easier movement in vim

				" JS
  			Plugin 'moll/vim-node'                                   " better node.js development
        Plugin 'jelera/vim-javascript-syntax'
				Plugin 'maksimr/vim-jsbeautify'
        Plugin 'mxw/vim-jsx'                                     " React JSX syntax highlighting and indenting
        Plugin 'othree/yajs.vim'                                 " Yet Another Javascript Syntax
        Plugin 'othree/es.next.syntax.vim'                       " ES.Next syntax
				Plugin 'isRuslan/vim-es6'                                " Snippets for ES6
				Plugin 'gavocanov/vim-js-indent'                         " JS indentation for VIM
        Plugin 'othree/javascript-libraries-syntax.vim'          " JS Syntax for libraries
				Plugin 'burnettk/vim-angular'                            " angularjs with vim
        " Plugin 'pangloss/vim-javascript'                       " No longer maintained

        "SML
        Plugin 'chilicuil/vim-sml-coursera'                     "sml repl and indent files
        
        "Misc
        Plugin 'vitalk/vim-simple-todo'

				" All of your Plugins must be added before the following line
				call vundle#end()            " required
				filetype plugin indent on    " required
" NerdTree
		nmap <leader>ne :NERDTree<cr>

" CtrlP
    " let g:ctrlp_match_window = 'top'
    " let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
    let g:ctrl_map = ''
    let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
    \ }

" Syntastic
    let g:syntastic_enable_highlighting = 1
    " let g:syntastic_always_populate_loc_list = 1
    " let g:syntastic_auto_loc_list = 2
    " let g:syntastic_check_on_open = 1
    " let g:syntastic_check_on_wq = 0
    " let g:syntastic_quiet_messages = {'level': 'warnings'}
    " let g:syntastic_html_tidy_ignore_errors = [" proprietary attribute \"ng-"]
    let g:syntastic_javascript_checkers = ['eslint']

" Fugitive
    nnoremap <Leader>gb :Gblame<CR>
    nnoremap <Leader>gs :Gstatus<CR>
    nnoremap <Leader>gd :Gdiff<CR>
    nnoremap <Leader>gl :Glog<CR>
    nnoremap <Leader>gc :Gcommit<CR>
    nnoremap <Leader>gcm :Gcommit -m<CR>
    nnoremap <Leader>gp :Git push<CR>

" vim-move
    let g:move_key_modifier = 'C'

" YouCompleteMe
    set completeopt-=preview
    let g:ycm_register_as_syntastic_checker = 0
    let g:ycm_add_preview_to_completeopt = 0
    if !exists("g:ycm_semantic_triggers")
      let g:ycm_semantic_triggers = {}
    endif
  let g:ycm_server_keep_logfiles = 1
  let g:ycm_server_log_level = 'debug'

" Dash keybinding
		:nmap <silent> <leader>d <Plug>DashSearch

" vim-closetag
    let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.php,*.js,*.jsx"
    au FileType xml,html,phtml,php,xhtml,js,jsx let b:delimitMate_matchpairs = "(:),[:],{:}"

" vim-sneak
    let g:sneak#streak = 1
    "replace 'f' with 1-char Sneak
    nmap f <Plug>Sneak_f
    nmap F <Plug>Sneak_F
    xmap f <Plug>Sneak_f
    xmap F <Plug>Sneak_F
    omap f <Plug>Sneak_f
    omap F <Plug>Sneak_F
    "replace 't' with 1-char Sneak
    nmap t <Plug>Sneak_t
    nmap T <Plug>Sneak_T
    xmap t <Plug>Sneak_t
    xmap T <Plug>Sneak_T
    omap t <Plug>Sneak_t
    omap T <Plug>Sneak_T
    " hi link SneakPluginTarget ErrorMsg

" javascript-libraries-syntax
    let g:used_javascript_libs = 'jquery,underscore,angularjs,angularui,angularuirouter,react'

" NERDCommenter
    let g:NERDSpaceDelims = 1 " add space after each comment

" rainbow brackets
    " au VimEnter * RainbowParenthesesToggle
    " au Syntax * RainbowParenthesesLoadRound
    " au Syntax * RainbowParenthesesLoadSquare
    " au Syntax * RainbowParenthesesLoadBraces
    " au VimEnter * map <Leader>rp :RainbowParenthesesToggle<CR>

    let g:rainbow_active = 1
    let g:rainbow_conf = {
    \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \ 'ctermfgs': ['darkblue', 'lightyellow', 'red', 'darkgreen', 'darkmagenta'],
    \ 'operators': '_,_',
    \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \ 'separately': {
    \   '*': {},
    \   'javascript': {
    \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/'],
    \   },
    \   'tex': {
    \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \   },
    \   'lisp': {
    \     'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \   },
    \   'vim': {
    \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \   },
    \   'html': {
    \     'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \   },
    \   'css': 0,
    \   }
    \}
    nmap <Leader>rp :RainbowToggle<CR>

" vim-jsx
    let g:jsx_ext_required = 0

" vim-javascript
    let g:javascript_enable_domhtmlcss = 1
    let g:javascript_plugin_flow = 1


""" File Types
"{{{

  filetype plugin indent on

  if has("autocmd")
    " In Makefiles, use real tabs, not tabs expanded to spaces
    au FileType make setlocal noexpandtab

    " Make sure all markdown files have the correct filetype set and setup wrapping
    au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
    if !exists("g:disable_markdown_autostyle")
      au FileType markdown setlocal wrap linebreak textwidth=72 nolist
    endif

    " make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
    au FileType python setlocal tabstop=4 shiftwidth=4>

    "Remember last location in file, but not for commit message.
    au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g`\"" | endif

  endif

"}}}
