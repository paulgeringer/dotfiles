syntax enable
"syntax sync minlines=256 THIS IS EVIL AND SLOWS EVERYTHING

autocmd FileType crontab setlocal nowritebackup
autocmd BufRead bash_profile,.bash_profile,aliases,.aliases set syn=sh
autocmd BufRead,BufNewFile *.pp set filetype=yaml

if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

set mouse=a
set hlsearch
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

" Bundle stuff after here

if filereadable(expand("~/.vundle.bundles"))
  source ~/.vundle.bundles
endif

set background=dark
colorscheme tomorrow-night

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ycm_key_list_select_completion = ['<c-tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-s-tab>', '<Up>']

set grepprg=ag\ -nH\ $*

let g:auto_save=1

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

let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': ['ruby'],
                               \ 'passive_filetypes': ['puppet'] }
