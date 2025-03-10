" GeorgeMac .vimrc "
set encoding=utf-8
set nocompatible
filetype off

""" Vundle Plugins """
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'

Plugin 'vim-ruby/vim-ruby'

Plugin 'tpope/vim-rails'

Plugin 'tpope/vim-rbenv'

Plugin 'SirVer/ultisnips'

Plugin 'scrooloose/syntastic'

Plugin 'Shougo/neocomplete.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'posva/vim-vue'
Plugin 'isRuslan/vim-es6'

Plugin 'hashivim/vim-hashicorp-tools'

Plugin 'b4b4r07/vim-hcl'

Plugin 'aliou/bats.vim'

Plugin 'chriskempson/base16-vim'

Plugin 'google/vim-jsonnet'

Plugin 'rust-lang/rust.vim'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'jjo/vim-cue'

Plugin 'fatih/vim-go'

Plugin 'earthly/earthly.vim', { 'branch': 'main' }

Plugin 'hashivim/vim-terraform'

Plugin 'leafgarland/typescript-vim'
Plugin 'yuezk/vim-js'
Plugin 'maxmellon/vim-jsx-pretty'

Plugin 'towolf/vim-helm'

call vundle#end()

""" Misc
filetype plugin indent on
syntax on

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

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
"""

""" FZF
nmap <C-p> :GFiles<CR>

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
"""

""" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_cucumber_cucumber_args="--profile syntastic"
let g:syntastic_warning_symbol = "⚠"
"""

""" Rust
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'

""" Vim-Go
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

""" Vim-Ruby
au Filetype ruby nmap <Leader>s :SyntasticToggle<CR>
"""

""" Terraform
let g:terraform_fmt_on_save = 1
"""

""" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_chalk'
set laststatus=2
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"""

""" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>
"""

""" set working directory to that of the current open files directory
autocmd BufEnter * silent! lcd %:p:h
"""
