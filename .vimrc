set autoindent
" set wrapmargin=2
set textwidth=80
set shiftwidth=4
set tabstop=4
set expandtab
set nohlsearch
set background=light
set laststatus=2
set statusline=%t%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
syntax on
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
let g:localvimrc_sandbox=0
let g:localvimrc_ask=0
