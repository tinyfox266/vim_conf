
"let CommentString='\/\/'

autocmd filetype tex vnoremap <leader>c :call <SID>Comment('%')<cr>
autocmd filetype tex vnoremap <leader>x :call <SID>UnComment('%')<cr>

autocmd filetype c vnoremap <leader>c :call <SID>Comment('\/\/')<cr>
autocmd filetype c vnoremap <leader>x :call <SID>UnComment('\/\/')<cr>

autocmd filetype cpp vnoremap <leader>c :call <SID>Comment('\/\/')<cr>
autocmd filetype cpp vnoremap <leader>x :call <SID>UnComment('\/\/')<cr>

autocmd filetype vim vnoremap <leader>c :call <SID>Comment('\"')<cr>
autocmd filetype vim vnoremap <leader>x :call <SID>UnComment('\"')<cr>

autocmd filetype java vnoremap <leader>c :call <SID>Comment('\/\/')<cr>
autocmd filetype java vnoremap <leader>x :call <SID>UnComment('\/\/')<cr>




function! s:Comment(commentString)
    execute 's/\(.*\)/' . a:commentString . '\1/'
endfunction

function! s:UnComment(commentString)
    silent! execute 's/' . a:commentString . '\(.*\)/\1/'
endfunction




