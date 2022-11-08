syntax enable
"syntax sync minlines=256 THIS IS EVIL AND SLOWS EVERYTHING

autocmd FileType crontab setlocal nowritebackup
autocmd BufRead bash_profile,.bash_profile,aliases,.aliases set syn=sh
autocmd BufRead vundle.bundles, .vundle.bundles set syn=vim

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
set undodir=$HOME/.local/share/nvim/undo
set undolevels=1000
set undoreload=10000
set backupdir=~/.local/share/nvim/backups,.
set directory=~/.local/share/nvim/backups,.
set hidden
set laststatus=2
set completeopt=longest,menuone,preview
set tags=~/Development/tags;tags;./tags

" vim-plug {{{
set nocompatible
filetype off
call plug#begin()

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdcommenter'
Plug 'rking/ag.vim'
Plug 'paulgeringer/vim-tomorrow-night-theme'
"Plug 'vim-syntastic/syntastic' # using ale 8/18/22
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-scripts/taglist.vim'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'davidhalter/jedi-vim'
Plug 'elzr/vim-json'
Plug 'stephpy/vim-yaml'
Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'
"Plug 'neomake/neomake' # using ale
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'roxma/nvim-yarp'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
filetype plugin indent on
" }}}

" Styling {{{
set background=dark
colorscheme tomorrow-night

hi CursorLine cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgreen ctermfg=white guibg=darkgreen guifg=white
"hi csNamespaceName cterm=NONE ctermfg=blue
hi ALEError ctermbg=lightblue
hi ALEWarning ctermbg=lightgreen
"e }}}

" CtrlP and Grep {{{
let g:ctrlp_cache_dir = '~/.vim/ctrlp/cache'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn|DS_Store)$',
  \ 'file': '\v\.(jpg|gif|pyc|swp|pid|scssc)$',
  \ }

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden -g ""'
set grepprg=ag\ -nH\ --ignore\ .git\ --ignore\ .DS_Store\ --ignore\ *.pyc\ $*
" }}}

" Remaps {{{
nnoremap <Leader>t :Files<CR>
nnoremap <Leader>be :Buffer<CR>
nnoremap <Leader>sp :set paste!<CR>
nnoremap <Leader>so :so %<CR>
nnoremap <Leader>bu :PlugInstall!<CR>
nnoremap <Leader>vrc :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>zrc :e ~/.zshrc<CR>
nnoremap <Leader>ll :set cursorline!<CR>
nnoremap <Leader>lk :set cursorcolumn!<CR>
nnoremap <Leader>ctf :CtrlPClearCache<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>rr :bufdo e<CR>
nnoremap <Leader>a :Ag!<CR>
nnoremap <Leader>hl :set hlsearch!<CR>
"nnoremap <Leader>rd Orequire 'debugger'; debugger<ESC>
nnoremap <Leader>rt :!ctags -R<CR>
nnoremap <Leader>nw :set nowrap!<CR>
nnoremap <Leader>sh :set hidden!<CR>
nnoremap <Leader>gg gggqG<CR>
"nnoremap <Leader>mm :WHITSPC<CR>
nnoremap <Leader>li :set list!<CR>
"nnoremap <Leader>sc :SyntasticCheck<CR>
"nnoremap <Leader>sr :SyntasticReset<CR>
nnoremap <Leader>se :Errors<CR>
nnoremap <Leader>db oimport pdb; pdb.set_trace()<CR>
nnoremap <S-k> <Nop>
nnoremap <Leader> <ESC>
command! -bar -bang Q quit<bang>
command! -bar -bang W save %<bang>
" }}}

" EasyAlign {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" Copy/Paste to system buffer {{{
nnoremap <Leader>y m`^<S-">*y$``h<ESC> " Copy line to OS X copy/paste buffer
vnoremap <Leader>y m`<S-">*y``h<ESC> " Copy visual selection to OS X copy/paste buffer
" }}}

" neomake {{{
"call neomake#configure#automake('w')
" }}}

" OmniSharp: {{{
let g:OmniSharp_popup_position = 'peek'
if has('nvim')
  let g:OmniSharp_popup_options = {
  \ 'winblend': 30,
  \ 'winhl': 'Normal:Normal,FloatBorder:ModeMsg',
  \ 'border': 'rounded'
  \}
else
  let g:OmniSharp_popup_options = {
  \ 'highlight': 'Normal',
  \ 'padding': [0],
  \ 'border': [1],
  \ 'borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
  \ 'borderhighlight': ['ModeMsg']
  \}
endif
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview', 'popup'
" and 'popuphidden' if you don't want to see any documentation whatsoever.
" Note that neovim does not support `popuphidden` or `popup` yet:
" https://github.com/neovim/neovim/issues/10996
if has('patch-8.1.1880')
  set completeopt=longest,menuone,popuphidden
  " Highlight the completion documentation popup background/foreground the same as
  " the completion menu itself, for better readability with highlighted
  " documentation.
  set completepopup=highlight:Pmenu,border:off
else
  set completeopt=longest,menuone,preview
  " Set desired preview window height for viewing documentation.
  set previewheight=5
endif

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

" }}}

" ncm2: {{{
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
" make it FAST
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'
" }}}


" UltiSnips {{{
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_python_checkers=["pylint"]
"let g:syntastic_python_pylint_post_args=["--max-line-length=160", "--rcfile=/Users/paulgeringer/.pylintrc"]
"let g:syntastic_check_on_open = 0
"let g:syntastic_python_flake8=["--config=~/.flake"]

let g:ale_linters = {
\     'python': ['pylint', 'flake8'],
\}

"let g:ale_fixers= {
"\     'python': ['black'],
"\}

let g:ale_linters_ignore = {
\     'python': ['flake8'],
\}

let g:ale_linters_explicit = 1

"let g:ale_python_pylint_options = '--rcfile '.expand('~/.pylintrc')
"let g:ale_python_black_options = '--check --diff'
let g:ale_fix_on_save = 1
let g:ale_python_pylint_use_msg_id = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_virtualenv_dir_names = []
if $VIRTUAL_ENV != ""
	let g:python3_host_prog = $VIRTUAL_ENV .. "/bin/python"
	let g:ale_python_pylint_path = $VIRTUAL_ENV .. "/bin/pylint"
else
	let g:python3_host_prog = "/Users/paulgeringer/.pyenv/shims/python"
	let g:ale_python_pylint_path = "/Users/paulgeringer/.pyenv/shims/pylint"
endif
