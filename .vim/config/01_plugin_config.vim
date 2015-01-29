
"Supertab code completion"
  let g:SuperTabContextDefaultCompletionType = "<c-n>"


" Dash Searching"
  nmap <Leader>qs <Plug>DashSearch
  nmap <Leader>qa <Plug>DashGlobalSearch


" Slim
  au BufNewFile,BufRead *.slim set filetype=slim

" Less
    au BufNewFile,BufRead *.less set filetype=less

" Handlebars, Mustache, and Friends
  au  BufNewFile,BufRead *.mustache,*.handlebars,*.hbs,*.hogan,*.hulk,*.hjs set filetype=html syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim

" Stylus
  au BufNewFile,BufRead *.styl set filetype=stylus

" Coffee script
  au BufNewFile,BufRead *.coffee set filetype=coffee

" Markdown syntax highlighting
  augroup mkd
    autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
  augroup END

" NERDTree for project drawer
  let NERDTreeHijackNetrw = 0

  nmap gt :NERDTreeToggle<CR>
  nmap g :NERDTree \| NERDTreeToggle \| NERDTreeFind<CR>


" Tabular for aligning text
  function! CustomTabularPatterns()
    if exists('g:tabular_loaded')
      AddTabularPattern! symbols         / :/l0
      AddTabularPattern! hash            /^[^>]*\zs=>/
      AddTabularPattern! chunks          / \S\+/l0
      AddTabularPattern! assignment      / = /l0
      AddTabularPattern! comma           /^[^,]*,/l1
      AddTabularPattern! colon           /:\zs /l0
      AddTabularPattern! options_hashes  /:\w\+ =>/
    endif
  endfunction

  autocmd VimEnter * call CustomTabularPatterns()

  " shortcut to align text with Tabular
  map <Leader>a :Tabularize<space>

" ZoomWin to fullscreen a particular buffer without losing others
  map <Leader>z :ZoomWin<CR>


" Unimpaired for keymaps for quicky manipulating lines and files
  " Bubble single lines
  nmap <C-Up> [e
  nmap <C-Down> ]e

  " Bubble multiple lines
  vmap <C-Up> [egv
  vmap <C-Down> ]egv


" Syntastic for catching syntax errors on save
  let g:syntastic_enable_signs=1
  let g:syntastic_quiet_messages = {'level': 'warning'}
  " syntastic is too slow for haml and sass
  let g:syntastic_mode_map = { 'mode': 'active',
                             \ 'active_filetypes': [],
                             \ 'passive_filetypes': ['haml','scss','sass'] }


" rails.vim, nuff' said
  map <Leader>oc :Rcontroller<Space>
  map <Leader>ov :Rview<Space>
  map <Leader>om :Rmodel<Space>
  map <Leader>oh :Rhelper<Space>
  map <Leader>oj :Rjavascript<Space>
  map <Leader>os :Rstylesheet<Space>
  map <Leader>oi :Rintegration<Space>


" surround for adding surround 'physics'
  " # to surround with ruby string interpolation
  let g:surround_35 = "#{\r}"
  " - to surround with no-output erb tag
  let g:surround_45 = "<% \r %>"
  " = to surround with output erb tag
  let g:surround_61 = "<%= \r %>"


" Jade Highlighting"
  autocmd BufNewFile,BufRead *.jade set filetype=jade

" Elixir plugin
  au BufNewFile,BufRead *.ex set filetype=elixir
  au BufNewFile,BufRead *.exs set filetype=elixir

