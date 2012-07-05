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
autocmd	BufEnter,BufNewFile *.tex set ft=tex
autocmd BufEnter,BufNewFile *.tex nnoremap <leader>la :!pdflatex main.tex && bibtex main && pdflatex main.tex && foxit %:p:h/main.pdf<cr>

" compiler the  current file
autocmd BufEnter,BufNewFile *.tex nnoremap <leader>lc :!pdflatex % && bibtex %:r && pdflatex % && foxit %:p:h/%:r.pdf<cr>

autocmd BufEnter,BufNewFile *.tex nnoremap <leader>lt :set makeprg=pdflatex\ main.tex\ &&\ bibtex\ main\ &&\ pdflatex\ main.tex\ &&\ foxit %:p:h/main.pdf
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

" vimwiki
let g:vimwiki_list=[{'path':'G:\research\Information_Flow_Control\note\vimwiki','path_html':'G:\research\Information_Flow_Control\note\vimwiki\html'}]

autocmd BufEnter,BufNewFile *.wiki nnoremap <leader>lc :Vimwiki2HTML<cr>

autocmd BufEnter,BufNewFile *.wiki nnoremap <leader>la :VimwikiAll2HTML<cr>

autocmd BufEnter,BufNewFile *.wiki nnoremap <leader>lv :Vimwiki2HTMLBrowse<cr>

"autocomplpop
" disable the filename completion, because it will match all the line with
" "\"
let g:acp_behaviorFileLength=-1


" neocomplcache
" Disable Auto
let g:acp_enableAtStartup = 0
" Use neocomplcache
let g:neocomplcache_enable_at_startup = 1
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" vim-indent
let g:indent_guides_guide_size=1

set cc=80
map ,ch :call SetColorColumn()<CR>
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc,',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else 
        execute "set cc-=".col_num
    endif        
endfunction
