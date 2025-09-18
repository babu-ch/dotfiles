set nu
set tabpagemax=50
set tabstop=2
set shiftwidth=2
set list listchars=tab:\▸\-
set expandtab
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
set cursorline
set vb t_vb=

set laststatus=2
" left
set statusline=%f
set statusline+=%m
set statusline+=%r
" right
set statusline+=%=
set statusline+=[%{&fileencoding}]
set statusline+=[%l/%L]

syntax on

" functions
function ExecCurrentFile()
  let map = { "py":"python", "rb":"ruby", "sh":"sh", "php":"php" }
  let extension = expand("%:e")
  if !has_key(map, extension)
    echo 'unknown extension!! (TT)'
    return
  endif
  let execCommand=map[extension]
  execute "!" . execCommand . " %"
endfunction

" bind
noremap <F2> <esc>:set nu!<Enter>
noremap <F3> <esc>:noh<Enter>
noremap <F4> <esc>:q<Enter>
noremap <F5> <esc>:call ExecCurrrentFile()<Enter>
noremap <C-w> <esc>:q<Enter>
noremap <C-s> <esc>:w<Enter>

inoremap <F2> <esc>:set nu!<Enter>
inoremap <F3> <esc>:noh<Enter>
inoremap <F4> <esc>:q<Enter>
inoremap <F5> <esc>:call ExecCurrentFile<Enter>
inoremap <C-w> <esc>:q<Enter>
inoremap <C-s> <esc>:w<Enter>


augroup MyHighlight
  au!
  autocmd VimEnter,ColorScheme * hi! CursorLine term=underline cterm=NONE gui=NONE ctermbg=black
  autocmd VimEnter,ColorScheme * hi! def link StatusLine CursorLine
  autocmd VimEnter,ColorScheme * hi! Normal ctermfg=231 ctermbg=16 cterm=NONE
augroup END

colorscheme delek

set visualbell
set noerrorbells
