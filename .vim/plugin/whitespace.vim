command WHITSPC call WhiteSpaceToggle()

let s:whitspc = 0

function! WhiteSpaceToggle()
  if s:whitspc
    let s:whitspc = 0
    highlight ExtraWhitespace ctermbg=NONE guibg=NONE
    match
  else
    let s:whitspc = 1
    highlight ExtraWhitespace ctermbg=red guibg=red
    "autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    match ExtraWhitespace /\s\+$/
  endif
endfunc
