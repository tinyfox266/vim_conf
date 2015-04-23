version 6.0
if &cp | set nocp | endif

" so ~/.vim/my.vim
" my own configuration
" autowrite
set autowrite
"set autochdir
""
set textwidth=80
set ignorecase
set smartcase
filetype on
filetype plugin on
filetype plugin indent on

syntax on 
set expandtab " use space to substitute tab
set tabstop=4
set shiftwidth=4
set autoindent
set number
source ~/.vim/my.vim
nnoremap <leader>p "+p
noremap <leader>y "+y



nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

" tex
autocmd	BufEnter *.tex set ft=tex
autocmd BufEnter *.tex command! See !pdflatex % && xpdf %:r.pdf
autocmd BufEnter *.tex nnoremap <Leader>lc :!pdflatex % && zzopen %:r.pdf<cr>
"autocmd BufEnter *.tex nnoremap <Leader>la :!pdflatex main.tex && bibtex main && pdflatex main.tex && zzopen main.pdf<cr>

autocmd BufEnter *.tex nnoremap <Leader>la :!pdflatex main.tex && zzopen main.pdf<cr>
autocmd BufEnter *.tex setlocal spell spelllang=en_US

" coq
autocmd BufEnter *.v set ft=coq

" haskell mode
autocmd BufEnter *.hs compiler ghc
let g:haddock_docdir = "/home/zzp/usr/share/doc/ghc/html/"
let g:haddock_indexfiledir = "/home/zzp/.vim/bundle/haskellmode/ftplugin/"
let g:haddock_browser="/usr/bin/elinks"
autocmd BufEnter *.hs let maplocalleader='\'


" nerdtree
" autocmd VimEnter * NERDTree " ~/.NERDTreeBookmarks
" let NERDTreeShowBookmarks=1
" let NERDTreeChDirMode=2

" pathogen
call pathogen#infect() 

" omnicppcomplete
set tags+=~/.vim/tags/stl_tags
set tags+=~/.vim/tags/android15tags
set completeopt=menu

" compiler for c/c++
map <F12> :!ctags1 -R --c++-kinds=+p --fields=+iaS --extra=+q %


let g:latex_vim=1

" python auto complete
autocmd FileType python set omnifunc=pythoncomplete#Complete  
"autocmd FileType python iab . <c-x><c-o>

function CheckPythonSyntax() 
    let mp = &makeprg 
    let ef = &errorformat 
    let exeFile = expand("%:t") 
    setlocal makeprg=python\ -u 
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 
    silent make %
    copen 
    let &makeprg     = mp 
    let &errorformat = ef 
endfunction

autocmd Filetype python nnoremap <leader>r :call CheckPythonSyntax()<cr>
autocmd Filetype qf nnoremap <c-c> :q<cr>

function RunTex()
    let mp = &makeprg 
    let ef = &errorformat 
    setlocal makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode
    set efm=%f:%l:\ %m
    silent make main.tex
    copen 
    let &makeprg =  mp 
    let &errorformat = ef
endfunction

autocmd Filetype tex nnoremap <leader>r :call RunTex()<cr>

" java complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
let g:java_classpath="/home/tinyfox/usr/local/adt-bundle-linux-x86-20130219/sdk/sources/android-15/"
autocmd Filetype java inoremap <buffer> .. .<C-X><C-O><C-P>
