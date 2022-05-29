
"General editor settings
set tabstop=4
set nocompatible
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set ruler
set showcmd
set incsearch
set shellslash
set number
set relativenumber
set cino+=L0 
syntax on
filetype indent on
filetype off
setlocal indentkeys-=:
set guifont=Consolas\ 20
"Theme (requires Solarized Light terminal theme to work properly)
let g:solarized_termcolors=256
set background=light
colorscheme solarized



"keybindings for { completion, "jk" for escape, ctrl-a to select all
inoremap {<CR>  {<CR>}<Esc>O
inoremap {}     {}
imap jk         <Esc>
map <C-a> <esc>ggVG<CR>
set belloff=all

"Append template to new C++ files
autocmd BufNewFile *.cpp 0r /home/shammo/vimcp/Library/Template.cpp

"Compile and run Note that this line requires the build.sh script!
"autocmd filetype cpp nnoremap <F9> :w <bar> !build.sh %:r <CR> 
"autocmd filetype cpp nnoremap <F10> :!./%:r<CR>
map <F9> : <C-U>!g++ -Wall  -Wextra -Wshadow -fsanitize=undefined -DLOCAL -O2 -std=c++14 % -o %:r  && ./%:r <CR>

 

map <F5> :<C-U>!g++ -Wall  -Wextra -Wshadow -fsanitize=undefined -DLOCAL -O2 -std=c++14 % -o %:r && ./%:r < in.txt > out.txt && cat < out.txt <CR>


set clipboard=unnamedplus
autocmd BufNewFile,BufRead *.cpp set syntax=cpp
autocmd BufNewFile,BufRead *.html set syntax=html
autocmd BufNewFile,BufRead *.js set syntax=javascript
autocmd BufNewFile,BufRead *.css set syntax=css
autocmd BufNewFile,BufRead *.py set syntax=python
autocmd BufNewFile,BufRead *.java set syntax=java


imap <silent> <C-l> <Plug>(YCMToggleSignatureHelp)

:autocmd InsertEnter,InsertLeave * set cul!
compiler gcc
set errorformat^=%-G%f:%l:\ %tarning:\ only\ initialized\ varia
            \bles\ can\ be\ placed\ into\ program\ memory\ area



set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"let g:ycm_autoclose_preview_window_after_completion=1


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'ycm-core/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required           


"Clipboard configuration                   only for WSL
"let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
"if executable(s:clip)
"augroup WSLYank
"                    autocmd!
"                            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
"                                augroup END
"                            endif
" 
"        au BufNewFile,BufRead *.tex
"            \ set nocursorline |
"            \ set nornu |
"            \ set number |
"            \ let g:loaded_matchparen=1 |
