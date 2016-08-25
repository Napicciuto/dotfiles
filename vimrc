set nocompatible
filetype off

" Plugins ----------- {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'edkolev/tmuxline.vim'
Plugin 'geekjuice/vim-spec'
Plugin 'kien/ctrlp.vim'
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'tomtom/tinykeymap_vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'vadimr/bclose.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/taglist.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rking/ag.vim'
Plugin 'groenewege/vim-less'
Plugin 'mattn/emmet-vim'
Plugin 'lambdalisue/vim-gita'
call vundle#end()
" }}}

" Options ---------- {{{
set encoding=utf-8
set modeline
set modelines=5
set autoindent
set showmode
set showcmd
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set number
set norelativenumber
set laststatus=2
set history=1000
set undofile
set undoreload=10000
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set lazyredraw
set matchtime=5
set showbreak=↪
set splitbelow
set splitright
set autoread
set shiftround
set title
set linebreak
set noundofile
set noswapfile
" }}}

" Tabs/Spaces/Wrapping {{{
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
set cindent
set smarttab
" }}}

" Searching and cursor movement{{{
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

set cursorline

set scrolloff=4
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

noremap <silent> <leader><space> :noh<CR>:call clearmatches()<CR>

filetype plugin indent on

" Formatting

syntax on

set mouse+=a
if &term =~ '^screen'
	set ttymouse=xterm2
endif

set statusline=[%n]\ %f\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%{fugitive#statusline()}%=%c,%l/%L\ %P

" Set leader key
let mapleader = ","
let g:mapleader = ","

" Prev and Next Buffer
nnoremap <c-u> :bp<CR>
nnoremap <c-i> :bn<CR>

" Close buffer
nnoremap <silent> <Leader>x :Bclose<CR>

" Fast saving
nmap <leader>s :w!<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ag
noremap <Leader>. :Ag<Space>

" CTRL-P
let g:ctrlp_map = '<leader>,'
let g:ctrlp_command = 'CtrlP'
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](.git|.svn|vendor|node_modules)'
	\ }

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#default#section_truncate_width = {
	\ 'y': 120,
	\ 'x': 110,
	\ 'z': 100
\ }
map <Leader>ar :AirlineRefresh<CR>

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
\ 'default' : '',
\ }
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
let g:neosnippet#snippets_directory='~/.neosnippets'

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Colors
set background=dark
set t_Co=256
colorscheme base16-default 
hi CursorLine ctermbg=236
hi LineNr ctermfg=grey ctermbg=236



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""set showcmd
""set showmode
""set cursorline
"
"" change the terminal window's title
"set title
"
"" Sets how many lines of history VIM has to remember
"set history=1000
"
"set undolevels=1000
"
"" Enable filetype plugins
"filetype plugin on
"filetype indent on
"
"" Set to auto read when a file is changed from the outside
"set autoread
"
" Use par for prettier line formatting
"set formatprg=par\ -w72

" Clipboard fix for OsX
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use jj instead of <Esc>
imap jj <Esc>
imap jJ <Esc>

"" Set 7 lines to the cursor - when moving vertically using j/k
"
"" Turn on the WiLd menu
"set wildmenu
"set wildmode=list:longest
"
" Ignore compiled files
"set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*/vendor/cache/*,*/public/system/*,*/tmp/*

"Always show current position
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set relativenumber
set numberwidth=2


"" Height of the command bar
"set cmdheight=1
"
"" A buffer becomes hidden when it is abandoned
"set hidden
"
"" Configure backspace so it acts as it should act
"" set backspace=eol,start,indent
"set backspace=2
"set whichwrap+=<,>,h,l
"
"" Ignore case when searching
"set ignorecase
"
"" When searching try to be smart about cases 
"set smartcase

" Highlight search results
set hlsearch

"" Makes search act like search in modern browsers
"set incsearch
"
"" Fix vim regex
"" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
"nnoremap / /\v
"vnoremap / /\v
"
"" Don't redraw while executing macros (good performance config)
"set lazyredraw 
"
"" For regular expressions turn magic on
"set magic
"
"" Show matching brackets when text indicator is over them
"set showmatch 
"" How many tenths of a second to blink when matching brackets
"set mat=3

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

"" Clear the search buffer on ,<space>
"nnoremap <leader><space> :noh<CR>
"" Tab to move between bracket pairs
"nnoremap <tab> %
"vnoremap <tab> %
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting

"Plugin 'chriskempson/base16-vim'
"set background=dark
"set t_Co=256
"colorscheme base16-default 
"hi LineNr ctermfg=grey ctermbg=236
"hi CursorLine ctermbg=236


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Use spaces instead of tabs
"set expandtab
"
"" Be smart when using tabs ;)
"set smarttab
"
"" 1 tab == 2 spaces
"set shiftwidth=2
"set tabstop=2
"
"" Don't wrap lines
"set nowrap
"
"set ai "Auto indent
"set si "Smart indent
"set wrap "Wrap lines
"
"" Backspace through everything in insert mode
"set backspace=indent,eol,start
"
"" Show whitespace at end of a line
"set list listchars=tab:»·,trail:·
"
"set matchpairs+=<:>
"
""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""
" Always show the status line
"set laststatus=2

" Format the status line
"
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


""""""""""""""""""""""""""""""" 
" => NERDTree
""""""""""""""""""""""""""""""
set autoread
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif
map <C-s> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
map <leader>e :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree



set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
execute pathogen#infect()


"Git branch
function! GitBranch()
    let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
    if branch != ''
        return '   Git Branch: ' . substitute(branch, '\n', '', 'g')
    en
    return ''
endfunction

function! CurDir()
    return substitute(getcwd(), '/Users/amir/', "~/", "g")
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L%{GitBranch()}


