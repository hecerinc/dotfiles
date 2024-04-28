" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk

" Yank to system clipboard
set clipboard=unnamed
imap jj <Esc>
exmap save jsfile mdHelpers.js {saveFile()}
imap hj :save

exmap moveLineUp obcommand editor:swap-line-up
vmap <A-k> :moveLineUp
nmap <A-k> :moveLineUp

exmap moveLineDown obcommand editor:swap-line-down
vmap <A-j> :moveLineDown
nmap <A-j> :moveLineDown


" TODO:
" Move lines up and down with Alt + j,k
" imap <A-j> <Esc>:m .+1<CR>==gi
" imap <A-k> <Esc>:m .-2<CR>==gi
" vmap <A-j> :m '>+1<CR>gv=gv
" vmap <A-k> :m '<-2<CR>gv=gv
