
"let CommentString='\/\/'

autocmd BufEnter *.tex vnoremap <leader>c :call <SID>Comment('%')<cr>

autocmd BufEnter *.c vnoremap <leader>c :call <SID>Comment('\/\/')<cr>

autocmd BufEnter *.cpp vnoremap <leader>c :call <SID>Comment('\/\/')<cr>

autocmd BufEnter *.vim vnoremap <leader>c :call <SID>Comment('\"')<cr>

autocmd BufEnter *.tex vnoremap <leader>x :call <SID>UnComment('%')<cr>

autocmd BufEnter *.c vnoremap <leader>x :call <SID>UnComment('\/\/')<cr>

autocmd BufEnter *.cpp vnoremap <leader>x :call <SID>UnComment('\/\/')<cr>

autocmd BufEnter *.vim vnoremap <leader>x :call <SID>UnComment('\"')<cr>

function! s:Comment(commentString)
    execute 's/\(.*\)/' . a:commentString . '\1/'
endfunction

function! s:UnComment(commentString)
    silent! execute 's/' . a:commentString . '\(.*\)/\1/'
endfunction




