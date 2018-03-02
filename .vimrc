:filetype plugin on
:syntax on
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
map <C-p> :!javac %:p<CR>
set clipboard=unnamedplus
set mouse=a
set ignorecase
set smartcase
set hlsearch
set incsearch
set number
