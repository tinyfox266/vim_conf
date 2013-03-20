
"let CommentString='\/\/'
"
autocmd BufEnter *.py set ft=python
autocmd BufEnter *.c set ft=c
autocmd BufEnter *.cpp set ft=cpp
autocmd BufEnter *.tex set ft=tex
autocmd BufEnter *.java set ft=java
autocmd BufEnter *.sh set ft=sh


autocmd filetype tex vnoremap <c-c> :call <SID>Comment('%')<cr>
autocmd filetype tex vnoremap <c-x> :call <SID>UnComment('%')<cr>
autocmd filetype tex nnoremap <c-c> :call <SID>Comment('%')<cr>
autocmd filetype tex nnoremap <c-x> :call <SID>UnComment('%')<cr>

autocmd filetype c vnoremap <c-c> :call <SID>Comment('\/\/')<cr>
autocmd filetype c vnoremap <c-x> :call <SID>UnComment('\/\/')<cr>
autocmd filetype c nnoremap <c-c> :call <SID>Comment('\/\/')<cr>
autocmd filetype c nnoremap <c-x> :call <SID>UnComment('\/\/')<cr>

autocmd filetype python vnoremap <c-c> :call <SID>Comment('#')<cr>
autocmd filetype python vnoremap <c-x> :call <SID>UnComment('#')<cr>
autocmd filetype python nnoremap <c-c> :call <SID>Comment('#')<cr>
autocmd filetype python nnoremap <c-x> :call <SID>UnComment('#')<cr>

autocmd filetype cpp vnoremap <c-c> :call <SID>Comment('\/\/')<cr>
autocmd filetype cpp vnoremap <c-x> :call <SID>UnComment('\/\/')<cr>
autocmd filetype cpp nnoremap <c-c> :call <SID>Comment('\/\/')<cr>
autocmd filetype cpp nnoremap <c-x> :call <SID>UnComment('\/\/')<cr>

autocmd filetype vim vnoremap <c-c> :call <SID>Comment('\"')<cr>
autocmd filetype vim vnoremap <c-x> :call <SID>UnComment('\"')<cr>
autocmd filetype vim nnoremap <c-c> :call <SID>Comment('\"')<cr>
autocmd filetype vim nnoremap <c-x> :call <SID>UnComment('\"')<cr>

autocmd filetype java vnoremap <c-c> :call <SID>Comment('\/\/')<cr>
autocmd filetype java vnoremap <c-x> :call <SID>UnComment('\/\/')<cr>
autocmd filetype java nnoremap <c-c> :call <SID>Comment('\/\/')<cr>
autocmd filetype java nnoremap <c-x> :call <SID>UnComment('\/\/')<cr>

autocmd filetype sh vnoremap <c-c> :call <SID>Comment('#')<cr>
autocmd filetype sh vnoremap <c-x> :call <SID>UnComment('#')<cr>
autocmd filetype sh nnoremap <c-c> :call <SID>Comment('#')<cr>
autocmd filetype sh nnoremap <c-x> :call <SID>UnComment('#')<cr>



function! s:Comment(commentString)
    execute 's/\(.*\)/' . a:commentString . '\1/'
endfunction

function! s:UnComment(commentString)
    silent! execute 's/' . a:commentString . '\(.*\)/\1/'
endfunction




