syntax enable
set nocompatible
filetype off

set mouse=a
set hlsearch

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

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-rails.git'
Bundle 'https://github.com/scrooloose/nerdtree.git' 
Bundle 'vim-scripts/taglist.vim'
Bundle 'altercation/vim-colors-solarized'
" Bundle 'tComment'
Bundle 'scrooloose/nerdcommenter'
Bundle '907th/vim-auto-save'
Bundle 'epmatsw/ag.vim'
Bundle 'kien/ctrlp.vim'

let g:auto_save=1

set background=dark
colorscheme solarized

map <C-N> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

filetype plugin indent on

nnoremap <Leader>sp :set paste!<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>so :so %<CR>
nnoremap <Leader>bu :BundleInstall<CR>
nnoremap <Leader>vrc :e ~/.vimrc<CR>
nnoremap <Leader>ctb :CommandTBuffer<CR>
nnoremap <Leader>ctf :CommandTFlush<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>rr :bufdo e<CR>
nnoremap <Leader>a :Ag!<CR>
nnoremap <Leader>hl :set hlsearch!<CR>
nnoremap <Leader>rd Orequire 'debugger'; debugger<ESC>
"nnoremap <Leader>rt :!ctags --language-force=ruby --exclude=.git --exclude=log -R *<CR>
nnoremap <Leader>rt :!ctags -R<CR>
nnoremap <Leader>nw :set nowrap!<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|log\',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
