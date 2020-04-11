" A Neovim configuration by Mirza Halilcevic
" NOTE: `Nerd Fonts` patched font is required for special glyphs/icons

" Plugins {{{
" Autoinstall vim-plug {{{
if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
  !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}
call plug#begin(stdpath('data') . '/plugged')

" Lean & mean status/tabline for Vim that's light as air
Plug 'vim-airline/vim-airline'

" Provide easy code formatting in Vim by integrating existing code formatters
Plug 'Chiel92/vim-autoformat'

" Clang based syntax highlighting for Neovim
Plug 'arakashic/chromatica.nvim'

" IntelliSense engine for Vim8 & Neovim, full language server protocol support
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Use fzf instead of coc.nvim built-in fuzzy finder
Plug 'antoinemadec/coc-fzf'

" Brings physics-based smooth scrolling to the Vim world
Plug 'yuttie/comfortable-motion.vim'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

" Helpers for UNIX
Plug 'tpope/vim-eunuch'

" A Vim plugin for switching between companion source files
Plug 'derekwyatt/vim-fswitch'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" A Vim plugin which shows a git diff in the gutter (sign column) and
" stages/undoes hunks and partial hunks
Plug 'airblade/vim-gitgutter'

" A Vim plugin to display indentation levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" A tree explorer plugin for Vim
Plug 'preservim/nerdtree'

" Adaptation of one-light and one-dark color schemes for Vim
Plug 'rakr/vim-one'

" A solid language pack for Vim
Plug 'sheerun/vim-polyglot'

" vim-snipmate default snippets
Plug 'honza/vim-snippets'

" The fancy start screen for Vim
Plug 'mhinz/vim-startify'

" An alternative sudo.vim for Vim and Neovim
Plug 'lambdalisue/suda.vim'

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

" Simple color selector/picker plugin for Vim
Plug 'KabbAmine/vCoolor.vim'

" Adds file type icons to Vim plugins
Plug 'ryanoasis/vim-devicons'

call plug#end()
" }}}
" Plugins config {{{
" vim-airline {{{
let g:airline_theme = 'one'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" tabline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
" }}}
" tagbar {{{
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'p'
" }}}
" }}}
" chromatica.nvim {{{
let g:chromatica#libclang_path = '/usr/lib/libclang.so'
let g:chromatica#global_args = ['-isystem/usr/lib/clang/9.0.1/include']
let g:chromatica#enable_at_startup = 0
let g:chromatica#responsive_mode = 1
" }}}
" vim-cpp-enhanced-highlight (vim-polyglot) {{{
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
" }}}
" fzf.vim {{{
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'Normal'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \ }
" }}}
" indentLine {{{
let g:indentLine_color_gui = '#373C44'
let g:indentLine_char = '▏'
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_first_char = '▏'
" }}}
" nerdtree {{{
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeWinSize = 40
" }}}
" vim-one {{{
let g:one_allow_italics = 1
" }}}
" }}}
" Options {{{
set autoindent smartindent " enable smart indentation
"set cmdheight=2 " make the command region 2 lines high
set colorcolumn=81 " display vertical ruler at column 81
set completeopt-=preview " disable scratch preview
set cursorline " highlight current line
set expandtab " use spaces instead of tabs
set hidden " hide buffers with unsaved changes
set ignorecase smartcase " enable smart case sensitive search
set mouse=a " enable mouse support
set nobackup nowritebackup " don't generate backup files
set noshowmode " disable mode indicator
set nowrap " disable line wrapping
set number relativenumber " enable hybrid line numbers
set scrolloff=5 sidescrolloff=0 " keep 5 lines offset from the cursor
set shortmess+=I " don't show startup message
set shortmess+=c " don't pass messages to ins-completion-menu
"set signcolumn=yes " always show the sign column
set smarttab " enable smart tabs
"set spell spelllang=en " enable spell checking
set tabstop=2 shiftwidth=2 softtabstop=2 " make tabs and indents 2 spaces wide
set termguicolors " enable true colors support
set undofile undolevels=1000 undoreload=10000 " enable undo files
set updatetime=300 " use shorter update time

" Comment strings
autocmd FileType c,cc,cpp,cxx,h,hh,hpp,hxx setlocal commentstring=//\ %s
" }}}
" Appearance {{{
set background=dark
colorscheme one

" vim-one customization
call one#highlight('MatchParen', '', '', 'bold')

" coc.nvim {{{
exec 'hi CocCodeLens    guifg='
      \ . synIDattr(synIDtrans(hlID('Comment')), 'fg', 'gui')
exec 'hi CocErrorSign   guifg='
      \ . synIDattr(synIDtrans(hlID('Error')), 'fg', 'gui')
exec 'hi CocWarningSign guifg='
      \ . synIDattr(synIDtrans(hlID('Number')), 'fg', 'gui')

" Use curly underlines if they're supported
if $VTE_VERSION != '' || $TERM == 'xterm-kitty'
  exec 'hi CocErrorHighlight   gui=undercurl guisp='
        \ . synIDattr(synIDtrans(hlID('Error')), 'fg', 'gui')
  exec 'hi CocWarningHighlight gui=undercurl guisp='
        \ . synIDattr(synIDtrans(hlID('Number')), 'fg', 'gui')
else
  exec 'hi CocErrorHighlight   gui=underline guifg='
        \ . synIDattr(synIDtrans(hlID('Error')), 'fg', 'gui')
  exec 'hi CocWarningHighlight gui=underline guifg='
        \ . synIDattr(synIDtrans(hlID('Number')), 'fg', 'gui')
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" }}}

" Make background transparent
"hi Normal guibg=NONE

" Don't highlight line number with cursorline
"hi CursorLineNr guibg=NONE
" }}}
" Mappings {{{
let mapleader = ' ' " use space as leader key

" coc.nvim (copied from readme) {{{
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)
" }}}

" Normal mode in terminal emulator
"tnoremap <esc> <C-\><C-n> " NOTE: Conflicts with fzf

" Navigate through buffers
nnoremap <leader>[ :bprev<CR>
nnoremap <leader>] :bnext<CR>

" Move selected lines down/up
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Autoformat buffer (or selection)
nnoremap <leader>af :Autoformat<CR>
vnoremap <leader>af :Autoformat<CR>

" Fuzzy file search
nnoremap <leader>fz :Files<CR>

" Switch to corresponding header/source file
nnoremap <leader>fs :FSHere<CR>

" Toggle NERDTree
nnoremap <leader>nt :NERDTreeToggle<CR>

" Open ripgrep in fzf
nnoremap <leader>rg :Rg<CR>
" }}}
" Misc {{{
" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

" Disable indentLine on startup screen
autocmd User StartifyReady :IndentLinesDisable
" }}}

" vim:foldmethod=marker
