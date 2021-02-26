call plug#begin('~/.vim/plugged')

Plug 'asvetliakov/vim-easymotion'
Plug 'tpope/vim-surround'

Plug '~/my-prototype-plugin'
call plug#end()

let mapleader = "\<Space>"

" Use windows clipboard.
set clipboard+=unnamedplus
let g:clipboard = {
  \   'name': 'win32yank-wsl',
  \   'copy': {
  \      '+': 'win32yank -i --crlf',
  \      '*': 'win32yank -i --crlf',
  \    },
  \   'paste': {
  \      '+': 'win32yank -o --lf',
  \      '*': 'win32yank -o --lf',
  \   },
  \   'cache_enabled': 0,
  \ }

" Auto disable ime.
if executable('zenhan')
  autocmd InsertLeave * :call system('zenhan 0')
  autocmd CmdlineLeave * :call system('zenhan 0')
endif
