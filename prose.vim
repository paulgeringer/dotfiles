command PROSE call ProseToggle()

let s:prose = 0

function! ProseToggle()
  if s:prose
    let s:prose = 0
    setlocal tw=0
    setlocal wm=0
  else
    let s:prose = 1
    setlocal nonumber
    setlocal norelativenumber
    setlocal tw=80
    setlocal wm=0
  endif
endfunc
