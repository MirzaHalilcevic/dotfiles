" Neovim configuration by Mirza Halilcevic
" Note: Nerd Fonts are required for special glyphs/icons

" Paths {{{
let plugged_path = '~/.local/share/nvim/plugged'
let ycmconf_path = '~/.ycm_extra_conf.py'
" }}}
" Plugins {{{
call plug#begin(plugged_path)

" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe'
Plug 'Valloric/ListToggle'

" Generates config files for YouCompleteMe
Plug 'rdnetto/YCM-Generator', { 'branch': 'develop' }

" A Vim plugin which shows a git diff in the 'gutter' (sign column) and
" stages/undoes hunks
Plug 'airblade/vim-gitgutter'

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" A better JSON for Vim: distinct highlighting of keywords vs values,
" JSON-specific (non-JS) warnings, quote concealing
Plug 'elzr/vim-json'

" Vim syntax highlighting for meson
Plug 'chadversary/vim-meson'

" Vim syntax for TOML
Plug 'cespare/vim-toml'

" Provide easy code formatting in Vim by integrating existing code formatters
Plug 'Chiel92/vim-autoformat'

" The ultimate snippet solution for Vim
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

" An alternative sudo.vim for Vim and Neovim
Plug 'lambdalisue/suda.vim'

" Helpers for UNIX
Plug 'tpope/vim-eunuch'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Simple color selector/picker plugin for Vim
Plug 'KabbAmine/vCoolor.vim'

" Brings physics-based smooth scrolling to the Vim world
Plug 'yuttie/comfortable-motion.vim'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Collection of awesome color schemes for Neo/vim, merged for quick use
Plug 'rafi/awesome-vim-colorschemes'

" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline,
" Powerline, Unite, vim-startify and more
Plug 'ryanoasis/vim-devicons'

call plug#end()
" }}}
" Plugin Options {{{
" YouCompleteMe
let g:ycm_error_symbol = ''
let g:ycm_warning_symbol = ''
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = ycmconf_path
let g:ycm_always_populate_location_list = 1

" JSON
let g:vim_json_syntax_conceal = 0

" autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0

" UltiSnips
let g:UltiSnipsExpandTrigger = '<c-j>' " ctrl + j -> expands snippet

" indentLine
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_setColors = 0

" airline
let g:airline_theme = 'one'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" NERDTree
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
" }}}
" General Options {{{
set noshowmode " disable mode indicator
set number relativenumber " hybrid line numbers
set nowrap " disable line wrapping
set mouse=a " enable mouse support
set tabstop=2 shiftwidth=2 softtabstop=0 " tabs and indents are 2 spaces wide
set expandtab smarttab " use spaces instead of tabs and enable smart tabs
set autoindent smartindent " smart indentation
set ignorecase smartcase " smart case sensitive search
set hidden " hide buffers with unsaved changes
set scrolloff=5 " keep 5 lines above and below the cursor
set cursorline " highlight current line
set colorcolumn=80 " vertical ruler at column 80
set undofile undodir=~/.local/share/nvim/undodir " enable undo files
set undolevels=1000 undoreload=10000 " limit number of undos
set completeopt-=preview " disable scratch preview

" Set appropriate comment strings according to file type
autocmd FileType c,cc,cpp,cxx,h,hh,hpp,hxx setlocal commentstring=//\ %s
autocmd FileType meson setlocal commentstring=#\ %s

" Disable line numbers and cursorline in terminal
augroup TerminalStuff
  au!
  autocmd TermOpen * setlocal nonu nornu cursorline!
augroup END
" }}}
" Appearance {{{
set termguicolors " enable true colors support

" Set colorscheme
set background=dark
colorscheme one

" YouCompleteMe colors
highlight YcmErrorSign guifg=#E06B74
highlight YcmErrorSection guifg=#E06B74 gui=undercurl
highlight YcmWarningSign guifg=#C678DD
highlight YcmWarningSection guifg=#C678DD gui=undercurl

" Transparency
"hi Normal guibg=NONE ctermbg=NONE
" }}}
" Keyboard {{{
" Use space as leader
let mapleader = " "

" f12 -> fix compile error if possible
map <f12> :YcmCompleter FixIt<CR>

" leader key + j -> jump to definition/declaration
map <Leader>j :YcmCompleter GoTo<CR>

" leader key + f -> open fuzzy finder for files
map <Leader>f :Files<CR>

" escape + tab -> next buffer
nmap <esc><tab> :bnext<CR>
" escape + backspace -> previous buffer
nmap <esc><bs> :bprev<CR>

" Move selected lines down or up using alt + down/up
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv

" escape -> enter normal mode in terminal
tnoremap <Esc> <C-\><C-n>
" }}}

" vim:foldmethod=marker
