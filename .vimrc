version 6.0
if &cp | set nocp | endif

" so ~/.vim/my.vim
" my own configuration
" autowrite
set autowrite
set autochdir
""
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

" tex
autocmd BufEnter *.tex command! View !../compile
autocmd	BufEnter *.tex set ft=tex
autocmd BufEnter *.tex command! See !pdflatex % && xpdf %:r.pdf


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
set completeopt=menu

" compiler for c/c++
map <F12> :!ctags1 -R --c++-kinds=+p --fields=+iaS --extra=+q %


let g:latex_vim=1
