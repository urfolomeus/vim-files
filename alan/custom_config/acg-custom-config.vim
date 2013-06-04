" Default color scheme
color vibrantink


" enable project-specific .vimrc files
set exrc
set secure " disable unsafe commands in local .vimrc files


" Change cursor in insert mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

autocmd BufNewFile,BufRead /Users/urfolomeus/src/personal/learning/7l7w/prolog/*.pl set filetype=prolog
au BufRead,BufNewFile *.scala set filetype=scala


" Save on focus lost
:au FocusLost * silent! wa


" opens a buffer with the current directory selected
map <leader>ew :e %:p:h<CR>


" folding
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=99        "set to a high value so that cold folding doesn't do weird shit when first turned on


" rnu mode
map <leader>m :call ToggleRnu()<CR>

function! ToggleRnu()
  if &rnu
    set number
  else
    set rnu
  end
endfunction

" strip whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

