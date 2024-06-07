set hidden

" This is useful over SSH
set background=dark

" Always show tabline (tabs are cool)
set showtabline=2

" Highlight search results
set hlsearch

" Incremental search
set incsearch

" We always have a dark background
set background=dark

set signcolumn=yes
" Round indents to match the sw
set shiftround

" Show matching parens / brackets
set showmatch

" Do relative numbers for real
set relativenumber

" Wildmenu! (Scrolling through files in :e or commands in :set)
set wildmenu
set wildmode=full
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*,.git/*

" Set the line numbers colors to gray
highlight LineNr ctermfg=DarkGrey

set number
set tabstop=4
set softtabstop=-1
set shiftwidth=0
set noexpandtab
set smartindent
set linebreak
" Time vim waits before running a plugin
set updatetime=300

" Window switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Remap window key to Ctrl+P
nnoremap <C-P> <C-W>

" Use bash for :terminal in Windows
if !has('nvim') && has('win32')
	set shell=/bin/bash
	set termwinkey=<C-P>
endif

set encoding=utf-8
set fileencoding=utf-8

" escape with double tapping j in insert mode
inoremap jj <Esc>
inoremap hh <c-o>:w<cr>
inoremap hj <c-o>:w<cr><Esc>

let mapleader = ";"

" Netrw config for NERDTree like
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Make 0  go to beginning of text line (not real line)
noremap 0 ^
noremap ^ 0

" Handy toggle for whitespace markers
nnoremap <A-S-L> :set list!<CR>

" nnoremap o o<Esc>
" nnoremap O O<Esc>
" Center screen when jumping search results
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <S-K> k



" -- Searching ---------------------------------------------
set ignorecase
set smartcase

" Stop autocommenting on Enter
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
filetype indent plugin on

" Make switching buffers easier
map <Leader>n :bn<cr>
map <Leader>p :bp<cr>
map <Leader>d :bp\|bd #<CR>

" Go to next or previous error
map <Leader>k <Plug>(coc-diagnostic-prev)
map <Leader>j <Plug>(coc-diagnostic-next)

" NERDTree settings
map <C-n> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
let g:NERDTreeIgnore = ['^node_modules$', '.*\.lock$', '^.git$', '.*\.swp$']

" Always show the statusline
set laststatus=2
set statusline=
      \\ %{&filetype!=#''?&filetype:'none'}
      \\ \ %{&fileformat==#'unix'?'U':&fileformat==#'dos'?'D':'N'}
      \:%{&readonly\|\|!&modifiable?&modified?'%*':'%%':&modified?'*':'-'}
      \\ \ %{expand('%:~:.')!=#''?expand('%:~:.'):'[No\ Name]'}
	  \%=%<\ %-10{''.(&fenc!=''?&fenc:&enc).''}
      \%=%<\ %-14(%l:%v%)\ %4(%p%%%)\ \


" -- Plugins ------------------------------------------------
call plug#begin('~/.vim/plugged')
	Plug 'ap/vim-buftabline'
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'leafgarland/typescript-vim'
	Plug 'majutsushi/tagbar'
	Plug 'mattn/emmet-vim', { 'commit': 'd698f1658770ca5fa58c87e80421c8d65bbe9065' }
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'michaeljsmith/vim-indent-object'
	Plug 'chrisbra/Colorizer'
	Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'pangloss/vim-javascript'
	Plug 'tpope/vim-unimpaired'
	" Plug 'dense-analysis/ale'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'vimwiki/vimwiki'
	Plug 'mortonfox/nerdtree-clip'
	Plug 'captbaritone/better-indent-support-for-php-with-html'
	Plug 'prettier/vim-prettier', {
	  \ 'do': 'yarn install --frozen-lockfile --production' }

	Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
	Plug 'ThePrimeagen/harpoon'
	Plug 'gabrielelana/vim-markdown'
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
	Plug 'wellle/context.vim'
	" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	" Plug 'nvim-treesitter/nvim-treesitter-context'

	" Syntax highlighting
	Plug 'pprovost/vim-ps1'
	Plug 'jparise/vim-graphql'
	Plug 'prisma/vim-prisma'

	" Colorschemes
	Plug 'srcery-colors/srcery-vim'
	Plug 'joshdick/onedark.vim'
	Plug 'ayu-theme/ayu-vim'
	Plug 'haishanh/night-owl.vim'
	Plug 'lifepillar/vim-solarized8'
	Plug 'morhetz/gruvbox'
	Plug 'mhartington/oceanic-next' "colorscheme OceanicNext
	Plug 'maksimr/vim-jsbeautify'
	Plug 'rebelot/kanagawa.nvim'
	Plug 'sainnhe/gruvbox-material'
	Plug 'w0ng/vim-hybrid'
	Plug 'cormacrelf/vim-colors-github'
	Plug 'flrnd/candid.vim'
	Plug 'jacoborus/tender.vim'
	Plug 'kaicataldo/material.vim', { 'branch': 'main' }
	Plug 'tomasiser/vim-code-dark'
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
	Plug 'audibleblink/hackthebox.vim'
	Plug 'aonemd/kuroi.vim'


call plug#end()


" toggle commenting of lines with Ctrl + /
nmap <C-/> :Commentary<CR>
vmap <C-/> :Commentary<CR>

" ;gh for the git log of the current file
nmap <Leader>gh :0Glog<CR>
nmap <leader>gs :Git<CR>
nmap ga :diffget //2<CR>
nmap gl :diffget //3<CR>

let g:prettier#autoformat=0
autocmd BufWritePre *.js,*.jsx,*.json,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.graphql PrettierAsync
autocmd BufWritePre *.py Format
au BufRead,BufNewFile *.g4 set filetype=antlr4

let g:tagbar_ctags_bin = 'C:/dev/utils/ctags/ctags.exe'
let g:python_recommended_style = 0 " disable python autoindent with 4 spaces

" Ctrl+Enter to make a new line below the current line no matter where the cursor is
imap <C-Enter> <Esc>o
imap <C-S-Enter> <Esc>O

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set lcs+=space:·

" Emmet settings
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
let g:jsx_ext_required = 0
let g:user_emmet_leader_key='<C-Z>'

" Use <F4> to copy (full) file path to clipboard
nnoremap <silent> <F4> :let @+=expand("%:p")<CR>
" set shellslash " Transform \ into / for Windows

" Open FZF when pressing space p
nnoremap <Leader><Leader> :Buffers <CR>

" Press Leader s to search and replace word under cursor (in the current line)
nnoremap <Leader>s :s/\<<C-r><C-w>\>//gI<Left><Left><Left>

" Paste without removing the clipboard value
xnoremap <Leader>d "_dP

" When in Windows terminal, it's very hard to <C-v> because it's paste, so add a command to do visual block
command! Vb :execute "normal! \<C-v>"

" Command to clean a JSON file
command! JSONPrettify %!python -m json.tool
command! ParseJSON %!jq ". | fromjson" " requires jq in PATH

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Delete trailing spaces with :HS
command! HS :%s/\s\+$//

" Don't jump to beginning of line when switching buffers
set nostartofline

" If focus is in NerdTree, and you open FZF, switch to next window to prevent
" opening the file in the nerdtree window
nnoremap <silent> <expr> <Space>p (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
nnoremap <silent> <expr> <Space>g (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":GFiles\<cr>"

" Enable Alt mappings in Cmder terminal
if !has('nvim')
	let c='a'
	while c <= 'z'
		exec "set <A-".c.">=\e".c
		exec "imap \e".c." <A-".c.">"
		let c = nr2char(1+char2nr(c))
	endw

	set timeout ttimeoutlen=50
endif


" Move lines up and down with Alt j, k
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Useful shortcut (Shift+alt+h) to hide highlight matches
nnoremap <S-A-h> :nohl<CR>


" ----------------------------------------------------------------------------------------------------
" COC.nvim
" ----------------------------------------------------------------------------------------------------
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition) zzzv
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <Leader><CR> :%s/^$\n//g<CR>

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

command! -nargs=0 Format :call CocAction('format')
" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)


" ---------------------------------------------------------------------------------------------------- 

" Press ;f to Rg the word under cursor
nmap <leader>f :Rg <c-r>=expand("<cword>")<cr><CR>

" Press ;j to beautify a JS file
" nmap <leader>j :call JsBeautify()<cr> " TODO: this is already used by
" AleNext


let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }

" Always show command being typed in statusline
set showcmd
set nospell " no spellcheck
let g:markdown_enable_spell_checking = 0

" ------------- Local project options --------------------------

" 1. mcux (2 spaces for indentation)
au BufRead,BufNewFile,BufWinEnter C:/dev/mcux/* setlocal ts=2 sw=2 et

" 2. UIF analysis (4 spaces)
au BufRead,BufNewFile,BufWinEnter C:/dev/uifanalysis/* setlocal ts=4 sw=4 et
au BufRead,BufNewFile,BufWinEnter C:/dev/dbt-llm/* setlocal ts=4 sw=4 et

" Command to change to the project
command! Waas cd C:/dev/mcux/apps/web
command! Mcux cd C:/dev/mcux/
command! Stories cd C:/dev/mcux/apps/web/Scripts/Stories
command! CMV cd C:/dev/mcux/apps/web/Scripts/CMV

" Remove the stupid underline under markdown links in VimWiki
hi! link VimwikiLink GruvboxBlue
" hi VimwikiLink term=underline ctermfg=cyan guifg=#1ecbe1 gui=none

function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

" For tmux bug in syntax coloring
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
