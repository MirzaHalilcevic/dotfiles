" A neovim configuration by Mirza Halilcevic
" Note: Nerd Fonts are required for special glyphs/icons

" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')

" Language Server Protocol (LSP) support for vim and neovim
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Dark powered asynchronous completion framework for neovim/Vim8
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Print documents in echo area
Plug 'Shougo/echodoc'

" Clang based syntax highlighting for Neovim
Plug 'arakashic/chromatica.nvim'

" A Vim plugin which shows a git diff in the 'gutter' (sign column) and
" stages/undoes hunks
Plug 'airblade/vim-gitgutter'

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" A better JSON for Vim: distinct highlighting of keywords vs values,
" JSON-specific (non-JS) warnings, quote concealing
Plug 'elzr/vim-json'

" Additional Vim syntax highlighting for C++
Plug 'octol/vim-cpp-enhanced-highlight'

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

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Simple color selector/picker plugin for Vim
Plug 'KabbAmine/vCoolor.vim'

" A Vim Automatic Window Resizing Plugin
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

" Brings physics-based smooth scrolling to the Vim world
Plug 'yuttie/comfortable-motion.vim'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" Lean & mean status/tabline for vim that's light as air
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
" Plugins config {{{
" LanguageClient-neovim
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['ccls', '--log-file-append=0', '--log-file=/tmp/ccls.log']
    \ }

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '~/.config/nvim/settings.json'

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('refresh_always', v:false)

" echodoc
let g:echodoc#enable_at_startup = 1

" chromatica
let g:chromatica#libclang_path = '/usr/lib/libclang.so'
let g:chromatica#highlight_feature_level = 0

" JSON
let g:vim_json_syntax_conceal = 0

" UltiSnips
let g:UltiSnipsExpandTrigger = '<c-j>' " ctrl + j -> expands snippet

" Lens
let g:lens#height_resize_max = 0
let g:lens#width_resize_max = 120

" indentLine
let g:indentLine_char = ''
let g:indentLine_first_char = ''

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
" Options {{{
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
set cmdheight=2 " make the command region 2 lines high
set cursorline " highlight current line
set colorcolumn=80 " vertical ruler at column 80
set undofile undodir=~/.local/share/nvim/undodir " enable undo files
set undolevels=1000 undoreload=10000 " limit number of undos
set completeopt-=preview " disable scratch preview

" Set appropriate comment strings according to file type
autocmd FileType c,cc,cpp,cxx,h,hh,hpp,hxx setlocal commentstring=//\ %s
autocmd FileType meson setlocal commentstring=#\ %s

" Disable line numbers and cursorline when in terminal emulator
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

" Transparency
"hi Normal guibg=NONE ctermbg=NONE

" fzf status bar colors
hi fzf1 guifg=#BE5046 guibg=#2C323C
hi fzf2 guifg=#98C379 guibg=#2C323C
hi fzf3 guifg=#A1A8B5 guibg=#2C323C
" }}}
" Mappings {{{
" Use space as leader key
let mapleader = " "

function SetLSPShortcuts()

  " f5 -> open language client contex menu
  nnoremap <f5> :call LanguageClient_contextMenu()<CR>

  " leader + j -> goto definition
  nnoremap <leader>j :call LanguageClient#textDocument_definition()<CR>

  " leader + k -> get identifier info
  nnoremap <leader>k :call LanguageClient#textDocument_hover()<CR>

  " leader + ; -> show references
  nnoremap <leader>; :call LanguageClient#textDocument_references()<CR>

endfunction()

augroup LSP
  autocmd!
  autocmd FileType c,cc,cpp,cxx,h,hh,hpp,hxx call SetLSPShortcuts()
augroup END

" leader + l -> show current list of errors
nnoremap <leader>l :copen<CR>

" leader + f -> open fuzzy finder for files
nnoremap <Leader>f :Files<CR>

" tab -> autocompletion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" escape + tab/backspace -> next/previous buffer
nnoremap <esc><tab> :bnext<CR>
nnoremap <esc><bs>  :bprev<CR>

" alt + down/up -> move selected lines down/up
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up>   :m .-2<CR>==
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up>   <Esc>:m .-2<CR>==gi
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up>   :m '<-2<CR>gv=gv

" escape -> enter normal mode when in terminal emulator
tnoremap <Esc> <C-\><C-n>
" }}}

" vim:foldmethod=marker
