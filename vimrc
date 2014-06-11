syntax enable
set nocompatible
filetype off
syntax sync minlines=256

set mouse=a
set hlsearch
autocmd FileType crontab setlocal nowritebackup
autocmd BufRead bash_profile,.bash_profile,aliases,.aliases set syn=sh

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
set backupdir=~/.vim/backups,.
set directory=~/.vim/backups,.
set hidden

" Folding
set foldenable
set foldlevelstart=10
set foldmethod=syntax

" EOL Character, :set list!
"set listchars=eol:¬

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'vim-scripts/taglist.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin '907th/vim-auto-save'
Plugin 'epmatsw/ag.vim'
Plugin 'paulgeringer/vim-tomorrow-night-theme'
Plugin 'stephpy/vim-yaml'
Plugin 'vim-ruby/vim-ruby'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'rodjek/vim-puppet'
Plugin 'scrooloose/syntastic'
Plugin 'vim-pandoc/vim-pantondoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

call vundle#end()
filetype plugin indent on

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ycm_key_list_select_completion = ['<c-tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-s-tab>', '<Up>']

set grepprg=ag\ -nH\ $*

let g:auto_save=1

set background=dark
colorscheme tomorrow-night

map <C-N> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

hi CursorLine cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgreen ctermfg=white guibg=darkgreen guifg=white

nnoremap <Leader>sp :set paste!<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>so :so %<CR>
nnoremap <Leader>bu :PluginInstall<CR>
nnoremap <Leader>vrc :e ~/.vimrc<CR>
nnoremap <Leader>bpr :e ~/.bash_profile<CR>
nnoremap <Leader>ll :set cursorline!<CR>
nnoremap <Leader>lk :set cursorcolumn!<CR>
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
nnoremap <Leader>p :PROSE<CR>
nnoremap <Leader>gg gggqG<CR>
nnoremap <Leader>mm :WHITSPC<CR>
nnoremap <Leader>li :set list!<CR>
