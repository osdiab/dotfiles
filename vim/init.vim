" map leader key more convenient
let mapleader = ","

source ~/.config/nvim/plugins.vim

" Set mac clipboard
set clipboard=unnamedplus

set termguicolors  " full color support
set background=light " to inform light theme to plugins like airline
colorscheme flatwhite
highlight Cursor guifg=white guibg=gray
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" setting background causes underline to disappear
" https://github.com/neoclide/coc.nvim/issues/755
hi default CocUnderline cterm=bold,undercurl ctermfg=red gui=bold,undercurl guifg=red

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase " Ignore case when searching
set smartcase " lowercase = case insensitive in searches

" Makes search act like search in modern browsers
set incsearch

if !exists('g:vscode')
  " General {{{

  " syntax highlighting
  syntax enable

  " text width
  set textwidth=120

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

  " Sets how many lines of history VIM has to remember
  set history=700

  " Set to auto read when a file is changed from the outside
  set autoread

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

  " error for long lines
  match ErrorMsg '\%>80v.\+'
  " highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  " match OverLength /\%121v.\+/

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


  " Highlight search results
  set hlsearch
  hi Search cterm=NONE ctermfg=darkgrey ctermbg=lightyellow

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
  set noexpandtab
  set autoindent
  set smarttab
  set tabstop=2
  set shiftwidth=0

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

" }}}
endif

" Allow specific project config

set exrc
set secure

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#e4ddd2
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#f1ece4
