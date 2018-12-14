syntax enable
"syntax sync minlines=256 THIS IS EVIL AND SLOWS EVERYTHING

autocmd FileType crontab setlocal nowritebackup
autocmd BufRead bash_profile,.bash_profile,aliases,.aliases set syn=sh
"autocmd BufRead,BufNewFile *.pp set filetype=yaml

"if exists('$TMUX')  " Support resizing in tmux
  "set ttymouse=xterm2
"endif

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
set laststatus=2
set completeopt=menu
set tags=tags;/

"" Bundle stuff after here

if filereadable(expand("~/.vundle.bundles"))
  source ~/.vundle.bundles
endif

set background=dark
colorscheme tomorrow-night

let g:ycm_key_list_select_completion = ['<c-tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-s-tab>', '<Up>']

set grepprg=ag\ -nH\ $*

map <C-N> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

hi CursorLine cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgreen ctermfg=white guibg=darkgreen guifg=white

"let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = '~/.vim/ctrlp/cache'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn|DS_Store)$',
  \ 'file': '\v\.(jpg|gif|pyc|swp|pid|scssc)$',
  \ }

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
  \ --ignore .git
  \ --ignore .svn
  \ --ignore .hg
  \ --ignore .DS_Store
  \ --ignore "**/*.pyc"
  \ -g ""'

let g:paredit_leader = '\'

nnoremap <Leader>t :CtrlP<CR>
nnoremap <Leader>be :CtrlPBuffer<CR>
nnoremap <Leader>sp :set paste!<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>so :so %<CR>
nnoremap <Leader>svr :so ~/.vimrc<CR>
nnoremap <Leader>bu :PluginInstall!<CR>
nnoremap <Leader>vrc :e ~/.vimrc<CR>
nnoremap <Leader>bpr :e ~/.bash_profile<CR>
nnoremap <Leader>ll :set cursorline!<CR>
nnoremap <Leader>lk :set cursorcolumn!<CR>
nnoremap <Leader>ctb :CommandTBuffer<CR>
nnoremap <Leader>ctf :CtrlPClearCache<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>rr :bufdo e<CR>
nnoremap <Leader>a :Ag!<CR>
nnoremap <Leader>hl :set hlsearch!<CR>
nnoremap <Leader>rd Orequire 'debugger'; debugger<ESC>
nnoremap <Leader>rt :!ctags -R<CR>
nnoremap <Leader>nw :set nowrap!<CR>
nnoremap <Leader>sh :set hidden!<CR>
nnoremap <Leader>gg gggqG<CR>
nnoremap <Leader>mm :WHITSPC<CR>
nnoremap <Leader>li :set list!<CR>
nnoremap <Leader>rb :RainbowParenthesesToggle<CR>
nnoremap <Leader>gy :Goyo<CR>
nnoremap <Leader>md :!open % -g -a markoff<ESC><CR>
nnoremap <Leader>sc :SyntasticCheck<CR>
nnoremap <Leader>se :Errors<CR>
nnoremap <S-k> <Nop>

command! -bar -bang Q quit<bang>
command! -bar -bang W save %<bang>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Best thing ever right here
nnoremap <Leader>y m`^<S-">*y$``h<ESC> " Copy line to OS X copy/paste buffer
vnoremap <Leader>y m`<S-">*y``h<ESC> " Copy visual selection to OS X copy/paste buffer

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby'],
                           \ 'passive_filetypes': ['puppet', 'python'] }
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--config=/Users/pgeringer/Development/ghpylibs/tox.ini'

"let g:syntastic_python_checker_args='--rcfile=~/.pylintrc'
"let g:syntastic_python_pylint_post_args='--msg-template="{path}:{line}:{column}:{C}: {msg_id} [{symbol}]: {msg}"'
"let g:syntastic_always_populate_loc_list = 1
autocmd FileType py,pyc,python set foldlevel=99
let g:pymode_lint = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_rope = 0

augroup unset_folding_in_insert_mode
    autocmd!
    autocmd InsertEnter *.py setlocal foldmethod=marker
    autocmd InsertLeave *.py setlocal foldmethod=expr
augroup END

"augroup pencil
  "autocmd!
  "autocmd FileType markdown,mkd,md call pencil#init()
  "autocmd FileType text            call pencil#init()
"augroup END

"let g:pymode_indent = 0
let g:pymode_folding = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-f>"
let g:UltiSnipsSnippetsDir="~/.vim/Ultisnips"
let g:previm_open_cmd = 'open -a Google\ Chrome'

"let g:pymod_run=0
"let g:pymode_options=0
"let g:pymode_syntax=0
"let g:pymode_syntax_all=0
"let g:pymode_syntax_slow_sync=0
"let g:pymode_trim_whitespaces=0
"let g:pymode_doc=0
let g:pymode_rope_lookup_project = 1 
"let g:pymode_rope_complete_on_dot = 0 
"let g:pymode_virtualenv = 0
"let g:pymode_breakpoint = 0
"let g:pymode_lint_on_write = 0
