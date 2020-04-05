" A Neovim configuration by Mirza Halilcevic
" NOTE: 'Nerd Fonts' is required for special glyphs

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

" IntelliSense engine for Vim8 & Neovim, full language server protocol support
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'antoinemadec/coc-fzf'

" Brings physics-based smooth scrolling to the Vim world
Plug 'yuttie/comfortable-motion.vim'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Additional Vim syntax highlighting for C++
Plug 'octol/vim-cpp-enhanced-highlight'

" Asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

" Helpers for UNIX
Plug 'tpope/vim-eunuch'

" A Vim plugin for switching between companion source files
Plug 'derekwyatt/vim-fswitch'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" A Vim plugin which shows a git diff in the gutter (sign column) and
" stages/undoes hunks and partial hunks
Plug 'airblade/vim-gitgutter'

" A Vim plugin to display indentation levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" A better JSON for Vim
Plug 'elzr/vim-json'

" Vim syntax highlighting for Meson
Plug 'chadversary/vim-meson'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" Adaptation of one-light and one-dark color schemes for Vim
Plug 'rakr/vim-one'

" vim-snipmate default snippets
Plug 'honza/vim-snippets'

" An alternative sudo.vim for Vim and Neovim
Plug 'lambdalisue/suda.vim'

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Vim syntax for TOML
Plug 'cespare/vim-toml'

" Simple color selector/picker plugin for Vim
Plug 'KabbAmine/vCoolor.vim'

" Adds file type icons to Vim plugins
Plug 'ryanoasis/vim-devicons'

call plug#end()
" }}}
" Plugins config {{{
" airline {{{
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
" }}}
" cpp-enhanced-highlight {{{
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
" }}}
" fzf {{{
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
let g:indentLine_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_first_char = ''
" }}}
" JSON {{{
let g:vim_json_syntax_conceal = 0
" }}}
" One {{{
let g:one_allow_italics = 1
" }}}
" }}}
" Options {{{
set autoindent smartindent " enable smart indentation
"set cmdheight=2 " make the command region 2 lines high
set colorcolumn=80 " display vertical ruler at column 80
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
set scrolloff=1 sidescrolloff=1 " keep 1 line and column offset from the cursor
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

" One
call one#highlight('MatchParen', '', '', 'bold')

" Make background transparent
"hi Normal guibg=NONE

" Don't highlight line number with cursorline
"hi CursorLineNr guibg=NONE

" Spell check
exec 'hi SpellBad   guibg=NONE gui=undercurl guifg='
      \ . synIDattr(synIDtrans(hlID('String')), 'fg', 'gui')
exec 'hi SpellCap   guibg=NONE gui=undercurl guifg='
      \ . synIDattr(synIDtrans(hlID('String')), 'fg', 'gui')
exec 'hi SpellLocal guibg=NONE gui=undercurl guifg='
      \ . synIDattr(synIDtrans(hlID('String')), 'fg', 'gui')
exec 'hi SpellRare  guibg=NONE gui=undercurl guifg='
      \ . synIDattr(synIDtrans(hlID('String')), 'fg', 'gui')

" Coc
exec 'hi CocCodeLens guibg=NONE guifg='
      \ . synIDattr(synIDtrans(hlID('LineNr')), 'fg', 'gui')
exec 'hi CocErrorSign   guibg=NONE guifg='
      \ . synIDattr(synIDtrans(hlID('Error')), 'fg', 'gui')
exec 'hi CocWarningSign guibg=NONE guifg='
      \ . synIDattr(synIDtrans(hlID('Number')), 'fg', 'gui')
exec 'hi CocErrorHighlight   guibg='
      \ . synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'gui')
      \ . ' gui=undercurl guifg='
      \ . synIDattr(synIDtrans(hlID('Error')), 'fg', 'gui')
exec 'hi CocWarningHighlight guibg='
      \ . synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'gui')
      \ . ' gui=undercurl guifg='
      \ . synIDattr(synIDtrans(hlID('Number')), 'fg', 'gui')
autocmd CursorHold * silent call CocActionAsync('highlight')
" }}}
" Mappings {{{
let mapleader = ' ' " use space as leader key

" Normal mode in terminal emulator
"tnoremap <esc> <C-\><C-n> " NOTE: conflicts with fzf

" Coc {{{
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
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
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

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}

" Fuzzy file search
nnoremap <leader>f :Files<CR>

" Open ripgrep
nnoremap <leader>rg :Rg<CR>

" Navigate through buffers
nnoremap <leader>[ :bprev<CR>
nnoremap <leader>] :bnext<CR>

" Open corresponding header/source file
nnoremap <leader>s :FSHere<CR>

" Move selected lines down/up
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" }}}

" vim:foldmethod=marker
