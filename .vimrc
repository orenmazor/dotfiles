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

set timeoutlen=1000 ttimeoutlen=0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
