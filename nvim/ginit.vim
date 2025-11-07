
if exists("g:neovide")
	let g:neovide_scroll_animation_length = 0
	let g:neovide_cursor_animation_length = 0
	set guifont=Cascadia\ Mono:h12
	let g:neovide_text_gamma = 0.8
	let g:neovide_text_contrast = 0.1
else
	GuiTabline 0
	GuiPopupmenu 0
	GuiFont Cascadia Code:h12
endif

" Switch to next buffer with Ctrl+Tab
noremap <C-Tab> :bn<cr>

" Switch to previous buffer with Ctrl+Shift+Tab
map <C-S-Tab> :bp<cr>
