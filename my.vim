" compile one file
map <F5> :call Do_OneFileMake()<CR>
function Do_OneFileMake()
    if expand("%:p:h")!=getcwd()
        echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
        return
    endif
    let sourcefileename=expand("%:t")
    if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
        echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
        return
    endif
    if &filetype=="c"
        set makeprg=gcc\ -o\ %<\ %
    elseif &filetype=="cpp"
        set makeprg=g++\ -o\ %<\ %
        endif
    endif
     
    let outfilename=expand("%:t:r")
    if filereadable(outfilename)
        let outdeletedsuccess = delete("./".outfilename)
        if(outdeletedsuccess!=0)
            set makeprg=make
            echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
            return
        endif
    endif
    execute "silent make"
    set makeprg=make
    if filereadable(outfilename)
        execute "!./".outfilename
    else 
        execute "copen"
    endif


endfunction
