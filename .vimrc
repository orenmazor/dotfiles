syntax on
filetype off                   " required!
scriptencoding utf-8
set encoding=utf-8

set number 
set shiftwidth=2
set expandtab
set tabstop=2
nnoremap <F3> :NumbersToggle<CR>
set clipboard=unnamed

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

nnoremap <C-n> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <C-p> :bprevious<CR>:redraw<CR>:ls<CR>

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'kana/vim-fakeclip'

Bundle 'kien/ctrlp.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'gregsexton/MatchTag'

Bundle 'Greplace.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'majutsushi/tagbar'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-fugitive'
Bundle 'tomtom/tcomment_vim'
Bundle 'itchyny/lightline.vim'

set laststatus=2
syntax enable
filetype plugin indent on
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ],
      \   'right': [ ['percent']]
      \ },
 \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \ }
      \ }

function! MyFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
  endfunction


set wildignore+=*/tmp/*,*.so,*.swp,*.zip
