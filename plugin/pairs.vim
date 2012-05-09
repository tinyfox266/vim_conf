inoremap () ()<++><esc>T(i
inoremap {} {}<++><esc>T{i
"inoremap () ()<esc>T(i
"inoremap {} {}<esc>T{i

inoremap <c-j> <esc>:call <SID>getOut()<cr><RIGHT>

function! s:getOut()
    execute "normal! /<++>\<cr>"
    normal! da<
    startinsert
endfunction
