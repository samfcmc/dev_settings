syntax on
filetype indent on
set number
" size of a hard tabstop
set tabstop=4

" always uses spaces instead of tab characters
" set expandtab

" size of an "indent"
set shiftwidth=4

" Auto close {
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

"Auto close (
inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()


