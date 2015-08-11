

" Initially pressing Enter returns to Normal mode
" Pressing Shift-Enter (Insert mode) enters 'multiline' mode
" Pressing Shift-Enter (Insert mode) ends 'multiline' and switches to Normal mode
" Remember that we can also use Ctrl-Enter or Ctrl-j or Ctrl-m to get a new line in Insert mode.
function! ToggleEnterMapping()
  if empty(mapcheck('<CR>', 'i'))
    inoremap <CR> <Esc>`^
    return "\<Esc>"
  else
    iunmap <CR>
    return "\<CR>"
  endif
endfunction
call ToggleEnterMapping()
inoremap <expr> <F12> ToggleEnterMapping()
" Optional (so <CR> cancels prefix, selection, operator).
" nnoremap <CR> <Esc>
" vnoremap <CR> <Esc>gV
" onoremap <CR> <Esc>

