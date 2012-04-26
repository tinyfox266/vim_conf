nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@

function! GrepOperator(type)
    let saved_unamed_register = @@
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    echo @@

    let @@ = saved_unamed_register
endfunction

vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>
