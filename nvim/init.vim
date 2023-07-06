source ~/.vimrc

set termguicolors
set t_Co=256

" Colorscheme - gruvbox
let g:gruvbox_contrast_dark='dark'
colorscheme gruvbox

" Delete whole words with Ctrl+BackSpace
inoremap <C-BS> <C-W>

" Important to enable the Windows clipboard in neovim
set clipboard+=unnamedplus
source $VIMRUNTIME/mswin.vim

" File format things
set noet " Don't expand tabs to spaces
set fileformat=unix
set fileformats=unix,dos " Prefer unix line endings
set tabstop=4

set wop-=pum " Remove the popup GUI menu for wildoptions

