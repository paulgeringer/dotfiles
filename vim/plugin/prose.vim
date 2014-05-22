command PROSE call ProseToggle()

let s:prose = 0

function! ProseToggle()
  if s:prose
    let s:prose = 0
    setlocal tw=0
    setlocal wm=0
    setlocal nospell
  else
    let s:prose = 1
    setlocal nonumber
    setlocal norelativenumber
    setlocal spell
    setlocal tw=80
    setlocal wm=0
  endif
endfunc
