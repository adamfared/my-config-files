" Ensure the statusline is visible and disable the bottom -- INSERT -- prompt
set laststatus=2
set noshowmode

" Base statusline highlights (transparent background)
highlight StatusLine   ctermfg=15 ctermbg=NONE cterm=bold
highlight StatusLineNC ctermfg=8  ctermbg=NONE cterm=none

" Map mode symbols to full words and set dynamic ANSI accent colors
function! GetModeAndColor()
  let l:m = mode()
  if l:m ==# 'n'
    highlight StatusLineMode ctermfg=0 ctermbg=4 cterm=bold  " ANSI 4 (Blue)
    return ' NORMAL '
  elseif l:m ==# 'i'
    highlight StatusLineMode ctermfg=0 ctermbg=2 cterm=bold  " ANSI 2 (Green)
    return ' INSERT '
  elseif l:m ==# 'v' || l:m ==# 'V' || l:m ==# "\<C-V>"
    highlight StatusLineMode ctermfg=0 ctermbg=5 cterm=bold  " ANSI 5 (Magenta)
    return ' VISUAL '
  elseif l:m ==# 'R'
    highlight StatusLineMode ctermfg=0 ctermbg=1 cterm=bold  " ANSI 1 (Red)
    return ' REPLACE '
  elseif l:m ==# 'c'
    highlight StatusLineMode ctermfg=0 ctermbg=3 cterm=bold  " ANSI 3 (Yellow)
    return ' COMMAND '
  else
    highlight StatusLineMode ctermfg=0 ctermbg=3 cterm=bold
    return ' OTHER '
  endif
endfunction

" Define the native statusline format
set statusline=
set statusline+=%#StatusLineMode#%{GetModeAndColor()}%#StatusLine# " Full mode block
set statusline+=\ %f\ %m%r                             " File path, modified (+), read-only [RO]
set statusline+=%=                                      " Right alignment separator
set statusline+=%#StatusLine#\ %y\                      " Filetype (e.g., [vim])
set statusline+=\ %l/%L:%c\                            " Line/Total : Column

" Tell Vim not to render fill characters (like ^^^ or ===) around statuslines
set fillchars+=stl:\ ,stlnc:\

" Set the inactive statusline highlight background to match Kitty's transparent background
highlight StatusLine   ctermfg=15 ctermbg=NONE cterm=bold
highlight StatusLineNC ctermfg=8  ctermbg=NONE cterm=none
