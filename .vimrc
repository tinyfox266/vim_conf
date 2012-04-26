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
set textwidth=80
set fileencodings=utf-8,cp936,big5

command Todo :tabnew G:/todo/todo.txt
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
noremap <C-J> <esc>:tabprevious<cr>
noremap <C-K> <esc>:tabnext<cr>

" tex
autocmd BufEnter *.tex command! View !../compile
autocmd	BufEnter *.tex set ft=tex
"autocmd BufEnter *.tex command! See !pdflatex % && bibtex %:r && pdflatex % && foxit %:r.pdf
"autocmd BufEnter *.tex command! Seem !pdflatex main.tex && bibtex main && pdflatex main.tex && foxit %:p:h/main.pdf
"compile the main file main.tex
autocmd BufEnter *.tex nnoremap <leader>lm :!pdflatex main.tex && bibtex main && pdflatex main.tex && foxit %:p:h/main.pdf<cr>

" compiler the  current file
autocmd BufEnter *.tex nnoremap <leader>lc :!pdflatex % && bibtex %:r && pdflatex % && foxit %:p:h/%:r.pdf<cr>

autocmd BufEnter *.tex nnoremap <leader>lt :set makeprg=pdflatex\ main.tex\ &&\ bibtex\ main\ &&\ pdflatex\ main.tex\ &&\ foxit %:p:h/main.pdf
" latex-suite
set shellslash " for windows users 


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

" vim-powerline
let g:Powerline_symbols = 'fancy'

" comment
source ~/vimfiles/autoload/comments.vim


