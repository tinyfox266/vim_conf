" LaTeX filetype
"	  Language: LaTeX (ft=tex)
"	Maintainer: Srinath Avadhanula
"		 Email: srinath@fastmail.fm

if !exists('g:latex_vim')
    if !exists('s:initLatexSuite')
        let s:initLatexSuite = 1
        exec 'so '.fnameescape(expand('<sfile>:p:h').'/latex-suite/main.vim')

        silent! do LatexSuite User LatexSuiteInitPost
    endif

    silent! do LatexSuite User LatexSuiteFileType
endif
