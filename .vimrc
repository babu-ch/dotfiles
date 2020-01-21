set nu
set tabpagemax=50
set tabstop=4
set shiftwidth=4
set list listchars=tab:\▸\-
set expandtab
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

" toggle number
command Nu set nu!

set laststatus=2
" left
set statusline=%f
set statusline+=%m
set statusline+=%r
" right
set statusline+=%=
set statusline+=[%{&fileencoding}]
set statusline+=[%l/%L]

" bind
noremap <F3> <esc>:noh<Enter>
noremap <F4> <esc>:q<Enter>
