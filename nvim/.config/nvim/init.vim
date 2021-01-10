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

" Changes Vim working directory to project root.
"Plug 'airblade/vim-rooter'

" Preview colours in source code while editing
Plug 'ap/vim-css-color'

" Provide easy code formatting in Vim by integrating existing code formatters.
Plug 'Chiel92/vim-autoformat'

" Find And Replace Vim plugin
Plug 'ChristianChiarulli/far.vim'

" Vim plug for switching between companion source files (e.g. `.h` and `.cpp`)
Plug 'derekwyatt/vim-fswitch'

" vim-snipmate default snippets (Previously snipmate-snippets)
Plug 'honza/vim-snippets'

" Vim plugin for C/C++/ObjC semantic highlighting using cquery, ccls, or clangd
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Vim plugin, insert or delete brackets, parens, quotes in pair
"Plug 'jiangmiao/auto-pairs'

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" A git commit browser in Vim
Plug 'junegunn/gv.vim'

" Simpler Rainbow Parentheses
Plug 'junegunn/rainbow_parentheses.vim'

" The missing motion for Vim
Plug 'justinmk/vim-sneak'

" Simple color selector/picker plugin for Vim.
Plug 'KabbAmine/vCoolor.vim'

" An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows
Plug 'lambdalisue/suda.vim'

" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

" Show a diff using Vim its sign column.
Plug 'mhinz/vim-signify'

" The fancy start screen for Vim.
Plug 'mhinz/vim-startify'

" Intellisense engine for Vim8 & Neovim, full language server protocol support
" as VSCode
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Additional Vim syntax highlighting for C++ (including C++11/14/17)
Plug 'octol/vim-cpp-enhanced-highlight'

" A tree explorer plugin for Vim
Plug 'preservim/nerdtree'

" Collection of awesome color schemes for Neo/vim, merged for quick use.
Plug 'rafi/awesome-vim-colorschemes'

" A solid language pack for Vim.
Plug 'sheerun/vim-polyglot'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" commentary.vim: comment stuff out
Plug 'tpope/vim-commentary'

" dispatch.vim: Asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

" eunuch.vim: Helpers for UNIX
Plug 'tpope/vim-eunuch'

" fugitive.vim: A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" rhubarb.vim: GitHub extension for fugitive.vim
Plug 'tpope/vim-rhubarb'

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Lightning fast left-right movement in Vim
Plug 'unblevable/quick-scope'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" Brings physics-based smooth scrolling to the Vim world!
Plug 'yuttie/comfortable-motion.vim'

" Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP,
" unite, Denite, lightline, vim-startify and many more
Plug 'ryanoasis/vim-devicons'

call plug#end()
" }}}
" Plugins config {{{
" junegunn/fzf.vim {{{
let g:fzf_preview_window = ''
let g:fzf_colors = {
      \ 'fg':       ['fg', 'Normal'],
      \ 'bg':       ['bg', 'Normal'],
      \ 'hl':       ['fg', 'Comment'],
      \ 'fg+':      ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':      ['bg', 'Normal'],
      \ 'hl+':      ['fg', 'Statement'],
      \ 'info':     ['fg', 'PreProc'],
      \ 'border':   ['fg', 'Comment'],
      \ 'prompt':   ['fg', 'Conditional'],
      \ 'pointer':  ['fg', 'Exception'],
      \ 'marker':   ['fg', 'Keyword'],
      \ 'spinner':  ['fg', 'Label'],
      \ 'header':   ['fg', 'Comment']
      \ }
let $FZF_DEFAULT_COMMAND="rg --files --glob '!.git/*' --hidden --no-ignore-vcs"
" }}}
" junegunn/rainbow_parentheses.vim {{{
let g:rainbow#pairs = [['(', ')']]
let g:rainbow#blacklist = []
" }}}
" justinmk/vim-sneak {{{
let g:sneak#s_next = 1
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
" }}}
" mhinz/vim-signify {{{
let g:signify_sign_add = '+'
let g:signify_sign_delete = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change = '~'
let g:signify_sign_show_count = 0
" }}}
" mhinz/vim-startify {{{
let g:startify_custom_header = ''
let g:startify_change_to_vcs_root = 1
" }}}
" octol/vim-cpp-enhanced-highlight {{{
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
" }}}
" preservim/nerdtree {{{
let g:NERDTreeWinSize = 50
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeDirArrowExpandable = ''
" }}}
" rafi/awesome-vim-colorschemes {{{
" rakr/vim-one {{{
let g:one_allow_italics = 1
" }}}
" }}}
" unblevable/quick-scope {{{
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }}}
" vim-airline/vim-airline {{{
let g:airline_theme = 'one'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.dirty='±'
" tabline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
" }}}
" tagbar {{{
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
" }}}
" }}}
" Yggdroot/indentLine {{{
let g:indentLine_char = '▏'
let g:indentLine_first_char = '▏'
let g:indentLine_color_gui = '#3B4048'
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_enabled = 0
" }}}
" }}}
" Options {{{
set autoindent              " automatically indnet next line
set background=dark         " use dark color scheme variant
set clipboard=unnamedplus   " copy/paste between Neovim and everything else
"set cmdheight=2             " make the command region 2 lines high
set colorcolumn=81,121      " display vertical rulers at 81st and 121st column
set cursorline              " highlight current line
set expandtab               " use spaces instead of tabs
set hidden                  " hide buffers with unsaved changes
set ignorecase              " ignore case in search patterns
set iskeyword-=_            " underscore seperated words aren't word objects
set mouse=a                 " enable mouse support
set nobackup nowritebackup  " don't make backups before overwriting a file
set noshowmode              " disable mode indicator
set nowrap                  " disable line wrapping
set number                  " enable line numbers
set pumheight=15            " set max number of items in the popup menu to 15
set relativenumber          " enable relative line numbers
set scrolloff=5             " keep 5 lines above and below the cursor
set shiftwidth=2            " use 2 spaces for `autoindent`
set shortmess+=I            " don't show the intro message
set shortmess+=c            " don't pass messages to ins-completion-menu
set sidescroll=0            " turn off side scrolling
"set signcolumn=yes          " always show the sign column
set smartcase               " override `ignorecase` if pattern has upper case
set softtabstop=2           " use 2 spaces for tabs in insert mode
set splitbelow              " put new windows below when splitting
set splitright              " put new windows right when vertical splitting
set termguicolors           " enable 24-bit RGB color support
set timeoutlen=500          " wait 500 milliseconds for mapped sequence
set undofile                " enable undo files
set updatetime=300          " use shorter update time for faster completion
" }}}
" Appearance {{{
colorscheme one " set color scheme
" color scheme customization {{{
call one#highlight('MatchParen', '', '3B4048', 'bold')
" }}}

let lens    = synIDattr(synIDtrans(hlID('LineNr')),   'fg', 'gui')
let error   = synIDattr(synIDtrans(hlID('Error')),    'fg', 'gui')
let warning = synIDattr(synIDtrans(hlID('Number')),   'fg', 'gui')
let info    = synIDattr(synIDtrans(hlID('Function')), 'fg', 'gui')
let hint    = synIDattr(synIDtrans(hlID('Type')),     'fg', 'gui')

" Match diagnostic colors with color scheme
execute 'highlight CocCodeLens    guifg=' . lens
execute 'highlight CocErrorSign   guifg=' . error
execute 'highlight CocWarningSign guifg=' . warning
execute 'highlight CocInfoSign    guifg=' . info
execute 'highlight CocHintSign    guifg=' . hint

" Use curly underlines if they're supported
if $VTE_VERSION != '' || $TERM == 'xterm-kitty'
  execute 'highlight CocErrorHighlight   gui=undercurl guisp=' . error
  execute 'highlight CocWarningHighlight gui=undercurl guisp=' . warning
  execute 'highlight CocInfoHighlight    gui=undercurl guisp=' . info
  execute 'highlight CocHintHighlight    gui=undercurl guisp=' . hint
else
  execute 'highlight CocErrorHighlight   gui=underline guifg=' . error
  execute 'highlight CocWarningHighlight gui=underline guifg=' . warning
  execute 'highlight CocInfoHighlight    gui=underline guifg=' . info
  execute 'highlight CocHintHighlight    gui=underline guifg=' . hint
endif

highlight CocHighlightText guibg=#3B4048

" Make background transparent
"highlight Normal guibg=NONE

" Don't highlight current line number
"highlight CursorLineNr guibg=NONE
" }}}
" Mappings {{{
let mapleader = ' ' " use space as leader key

" Navigate through buffers
nnoremap <silent> <Leader>[  :bprevious<CR>
nnoremap <silent> <Leader>]  :bnext<CR>

" Autoformat currently active buffer
nnoremap <silent> <Leader>af :Autoformat<CR>

" Delete currently active buffer
nnoremap <silent> <Leader>bd :bdelete<CR>

" Open fuzzy finder for files
nnoremap <silent> <Leader>f  :Files<CR>

" Disable search highlighting
nnoremap <silent> <Leader>nh :nohlsearch<CR>

" Switch to corresponding header/source file
nnoremap <silent> <Leader>o  :FSHere<CR>

" Open yank history
nnoremap <silent> <Leader>y  :CocList -A --normal yank<CR>

" Move selected lines down/up
nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv
" }}}
" Coc.nvim {{{
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

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

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)
" }}}
" Autocommands {{{
augroup Autocmds
  autocmd!
  " Jump to the last position when reopening a file
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$')
        \ | execute "normal! g'\"" | endif

  " Enable rainbow parentheses at startup
  autocmd FileType * RainbowParentheses

  " Set comment strings
  autocmd FileType c,cpp setlocal commentstring=//\ %s

  " Enable indent lines for these file types
  autocmd FileType c,cpp,json,python,sh,vim IndentLinesEnable

augroup END
" }}}

" vim:foldmethod=marker
