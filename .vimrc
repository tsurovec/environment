colorscheme pablo 
map <ESC>[1;5D b
map <ESC>[1;5C e
syntax on
set number 
map <C-@>f :ta <C-R>=expand("<cword>") <CR><CR>
map <C-@>g :cs find g <C-R>=expand("<cword>") <CR><CR>
map <C-@>s :cs find s <C-R>=expand("<cword>") <CR><CR>
map <C-@>e :cs find e <C-R>=expand("<cword>") <CR><CR>

" duplicate line macro ... probably useless, but just to see syntax
let @d = 'yyp'
" paste instead of word
let @p = 'bPlde'

" replace word under cursor
map <C-h>h :%s/<C-R>=expand("<cword>")<CR>/
" replace exactly word under cursor
map <C-h>w :%s/\<<C-R><C-W>\>/

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" call plug#end()
