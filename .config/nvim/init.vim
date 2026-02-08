set runtimepath+=~/.local/share/nvim

""" Plugins
call plug#begin()

" Languages
Plug 'fatih/vim-go'
Plug 'jjo/vim-cue'
Plug 'jparise/vim-graphql'
Plug 'towolf/vim-helm'
Plug 'jxnblk/vim-mdx-js'
Plug 'hashivim/vim-terraform'
Plug 'terrastruct/d2-vim'

" Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colour
Plug 'RRethy/nvim-base16'

call plug#end()
"""

""" General
filetype plugin indent on
syntax on

colorscheme base16-gruvbox-dark-medium

let mapleader = ","
let maplocalleader = ","
set notimeout
set ttimeout
set autoindent
set hidden
set incsearch
set backspace=2
set number
set clipboard=unnamed
set tabstop=2 shiftwidth=2 expandtab
au Filetype go set tabstop=4 shiftwidth=4 expandtab
"""

""" FZF
nmap <C-p> :GFiles<CR>

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
"""

""" CoC
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use (enter) to make selection in autocomplete
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" Use (enter) to select first item when nothing is highlighted
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Run formatting after confirmation has been entered
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>df <Plug>(coc-definition)

nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"""

""" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_autodetect_gopath = 0
let g:go_gocode_propose_source = 0
let g:go_gorename_bin = "gopls"

let g:go_fmt_command = "goimports"
let g:go_info_mode = 'gopls'

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-test-compile)

au FileType go nmap <Leader>df <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>as <Plug>(go-alternate-split)
au FileType go nmap <Leader>av <Plug>(go-alternate-vertical)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gi <Plug>(go-info)
"""


""" set work dir to that of current open files
autocmd BufEnter * silent! lcd %:p:h
"""
