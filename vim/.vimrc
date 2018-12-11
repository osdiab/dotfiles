" General {{{

" 256 colors
set t_Co=256

" syntax highlighting
syntax enable

" Use indentation for folds
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=99
set foldcolumn=0

augroup vimrcFold
  " fold vimrc itself by categories
  autocmd!
  autocmd FileType vim set foldmethod=marker
  autocmd FileType vim set foldlevel=0
augroup END

" Space folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" Set mac clipboard
set clipboard=unnamedplus

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" vim-plug {{{

set nocompatible

if has('nvim')
  call plug#begin('~/.config/nvim/bundle')
else
  call plug#begin('~/.vim/bundle')
endif

" git
Plug 'vim-scripts/gitignore'

" Styling
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
Plug 'miyakogi/conoline.vim'
let g:conoline_color_normal_light = 'ctermbg=236'
let g:conoline_color_normal_nr_light = 'ctermbg=236'
let g:conoline_color_insert_light = 'ctermbg=234'
let g:conoline_color_insert_nr_light = 'ctermbg=234'

" Text manipulation
Plug 'ervandew/supertab'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-commentary'
Plug 'michaeljsmith/vim-indent-object'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-abolish'
Plug 'Yggdroot/indentLine'
let g:indentLine_color_term = 239

" Markdown
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_conceal = 0

" Rust
Plug 'rust-lang/rust.vim'

" Go
Plug 'fatih/vim-go'

" Javascript
Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0
Plug 'kern/vim-es7'
Plug 'mxw/vim-jsx'

" Typescript
" Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'

" Thrift
Plug 'solarnz/thrift.vim'

" Actionscript (Flash)
Plug 'jeroenbourgois/vim-actionscript'

" Cross-environment linting
Plug 'scrooloose/syntastic'
let g:syntastic_mode_map={ 'passive_filetypes': ['go'] }
let g:syntastic_filetype_map = { "less": "css" }
let g:syntastic_css_checkers=['stylelint']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_coffeescript_checkers=['coffee', 'coffeelint']
let g:syntastic_typescript_checkers=['tsc', 'tslint', 'eslint']
let g:syntastic_typescript_tsc_fname = ''
let g:syntastic_python_checkers=['flake8']
let g:syntastic_ruby_checkers=['mri', 'rubocop']
let g:syntastic_go_checkers=['go', 'gofmt', 'golint', 'govet']

call plug#end()

" }}}

" VIM user interface {{{

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu
" Tab-complete files up to longest unambiguous prefix
set wildmode=list:longest,full

" Always show current position
set ruler
set number

" Show trailing whitespace
set list
:highlight ExtraWhitespace ctermbg=red guibg=red
:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
:au InsertLeave * match ExtraWhitespace /\s\+$/
" But only interesting whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch
hi Search cterm=NONE ctermfg=darkgrey ctermbg=lightyellow

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set vb t_vb=

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Force redraw
map <silent> <leader>r :redraw!<CR>

" Turn mouse mode on
nnoremap <leader>ma :set mouse=a<cr>

" Turn mouse mode off
nnoremap <leader>mo :set mouse=<cr>

" Default to mouse mode on
set mouse=a
" }}}

" Files, backups and undo {{{

" Set working directory to current directory
set autochdir

set backupcopy=yes " allows webpack watch to work properly, by writing directly to file instead of replacing it
set backup
if has('nvim')
  set backupdir=~/.vim/backup
  set directory=~/.vim/tmp
else
  set backupdir=~/.local/share/nvim/backup
  set directory=~/.local/share/nvim/tmp
endif

" Source the vimrc file after saving it
augroup sourcing
  autocmd!
  autocmd bufwritepost init.vim source $MYVIMRC
  autocmd bufwritepost .vimrc source $MYVIMRC
augroup END

" Open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" Show undo tree
nmap <silent> <leader>u :GundoToggle<CR>

" Fuzzy find files
nnoremap <silent> <Leader><space> :CtrlP<CR>
let g:ctrlp_max_files=0
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](.git|.cabal-sandbox|.stack-work)$' }

" }}}

" Text, tab and indent related {{{
set tabstop=4

" Linebreak on 100 characters
set lbr
set tw=100
set wrap "Wrap lines

" Copy and paste to os clipboard
nmap <leader>y "*y
vmap <leader>y "*y
nmap <leader>d "*d
vmap <leader>d "*d
nmap <leader>p "*p
vmap <leader>p "*p

" }}}

" Visual mode related {{{

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
hi Visual cterm=NONE ctermfg=darkgrey ctermbg=lightblue

" }}}

" Moving around, tabs, windows and buffers {{{

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

noremap <c-h> <c-w>h
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-l> <c-w>l

" Return to last edit position when opening files (You want this!)
augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END
" Remember info about open buffers on close
set viminfo^=%

" Open window splits in various places
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

" don't close buffers when you aren't displaying them
set hidden

" previous buffer, next buffer
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>

" close every window in current tabview but the current
nnoremap <leader>bo <c-w>o

" delete buffer without closing pane
noremap <leader>bd :Bd<cr>

" fuzzy find buffers
noremap <leader>b<space> :CtrlPBuffer<cr>

" }}}

" Status line {{{

" Always show the status line
set laststatus=2

" }}}

" NERDTree {{{

" Ctrl-n toggles nerdtree
map <C-n> :NERDTreeFind<CR>

" nerdtree starts on enter
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if nerdtree is only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Close nerdtree after a file is selected
let NERDTreeQuitOnOpen = 1

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
  endif
endfunction

" If nerd tree is closed, find current file, if open, close it
nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
nmap <silent> <leader>F <ESC>:NERDTreeToggle<CR>

" }}}

