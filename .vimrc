set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

runtime! ftplugin/man.vim

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'wting/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Bundle 'jistr/vim-nerdtree-tabs'

call vundle#end()
filetype plugin indent on

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

set softtabstop=4
set shiftwidth=4
set expandtab

let g:vim_markdown_folding_disabled=1

nnoremap <F4> :NERDTreeTabsToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

set exrc
set secure
autocmd BufWinLeave * call clearmatches()

" Several useful options that I need "
syntax on
set backspace=indent,eol,start
imap jj <Esc>
nnoremap K :Man <cword>
set ruler

" Specific to limelight "
let g:limelight_conceal_ctermfg = 'gray'
