syntax on
filetype off                   " required!

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
Bundle 'Lokaltog/powerline'

syntax enable
filetype plugin indent on
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2
set t_Co=256

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
