syntax enable
set nocompatible
filetype off
syntax sync minlines=256

set mouse=a
set hlsearch
autocmd FileType crontab setlocal nowritebackup

if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

set ignorecase
set smartcase
set incsearch
set expandtab
set shiftwidth=2
set tabstop=2
set number
set numberwidth=2
set autoindent
set backspace=indent,eol,start
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" Folding
set foldenable
set foldlevelstart=10
set foldmethod=syntax

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'https://github.com/scrooloose/nerdtree.git' 
Bundle 'vim-scripts/taglist.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdcommenter'
Bundle '907th/vim-auto-save'
Bundle 'epmatsw/ag.vim'
Bundle 'paulgeringer/vim-tomorrow-night-theme'
Bundle 'stephpy/vim-yaml'
Bundle 'vim-ruby/vim-ruby'

set grepprg=ag\ -nH\ $*
let g:tex_flavor='latex'

let g:auto_save=1

set background=dark
colorscheme tomorrow-night

map <C-N> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

filetype plugin indent on

nnoremap <Leader>sp :set paste!<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>so :so %<CR>
nnoremap <Leader>bu :BundleInstall<CR>
nnoremap <Leader>vrc :e ~/.vimrc<CR>
nnoremap <Leader>bpr :e ~/.bash_profile<CR>
nnoremap <Leader>ctb :CommandTBuffer<CR>
nnoremap <Leader>ctf :CommandTFlush<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>rr :bufdo e<CR>
nnoremap <Leader>a :Ag!<CR>
nnoremap <Leader>hl :set hlsearch!<CR>
nnoremap <Leader>rd Orequire 'debugger'; debugger<ESC>
nnoremap <Leader>rt :!ctags -R<CR>
nnoremap <Leader>nw :set nowrap!<CR>
nnoremap <Leader>sh :set hidden!<CR>
