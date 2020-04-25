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
Plug 'vim-airline/vim-airline-themes'

" Provide easy code formatting in Vim by integrating existing code formatters
Plug 'Chiel92/vim-autoformat'

" Base16 for Vim
Plug 'chriskempson/base16-vim'

" Clang based syntax highlighting for Neovim
Plug 'arakashic/chromatica.nvim'

" IntelliSense engine for Vim8 & Neovim, full language server protocol support
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

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

" Dark powered fzf plugin
Plug 'yuki-ycino/fzf-preview.vim'

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

" Simpler Rainbow Parentheses
Plug 'junegunn/rainbow_parentheses.vim'

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

" A Vim plugin for managing windows
Plug 'dstein64/vim-win'

" Adds file type icons to Vim plugins
Plug 'ryanoasis/vim-devicons'

call plug#end()
" }}}
" Plugins config {{{
" vim-airline {{{
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
let g:airline#extensions#tagbar#flags = ''
" }}}
" }}}
" chromatica.nvim {{{
let g:chromatica#enable_at_startup = 0
let g:chromatica#libclang_path = '/usr/lib/libclang.so'
let g:chromatica#global_args = ['-isystem/usr/lib/clang/9.0.1/include']
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
let g:fzf_preview_window = 'up:50%'
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
" fzf-preview.vim {{{
let g:fzf_preview_floating_window_rate = 0.8
let g:fzf_preview_command = 'bat --color=always --style=numbers,changes {-1}'
let g:fzf_preview_fzf_preview_window_option = 'up:50%'
let g:fzf_preview_use_dev_icons = 1
" }}}
" indentLine {{{
let g:indentLine_char = '▏'
let g:indentLine_first_char = '▏'
let g:indentLine_color_gui = '#3B4048'
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_enabled = 0
" }}}
" nerdtree {{{
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeWinSize = 40
" }}}
" rainbow_parentheses.vim {{{
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
let g:rainbow#blacklist = []
" }}}
" vim-startify {{{
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
" }}}
" }}}
" Options {{{
set autoindent " automatically indnet next line
set background=dark " use dark color scheme variant
"set cmdheight=2 " make the command region 2 lines high
set colorcolumn=81 " display vertical ruler at 81st column
set cursorline " highlight current line
set expandtab shiftwidth=2 softtabstop=2 " make tabs and indents 2 spaces wide
set hidden " hide buffers with unsaved changes
set ignorecase smartcase " enable smart case sensitive search
set mouse=a " enable mouse support
set nobackup nowritebackup " don't generate backup files
set noshowmode " disable mode indicator
set nowrap " disable line wrapping
set number relativenumber " enable hybrid line numbers
set scrolloff=5 sidescrolloff=0 " keep 5 lines above and below the cursor
set shortmess+=I " don't show the intro message
set shortmess+=c " don't pass messages to ins-completion-menu
"set signcolumn=yes " always show the sign column
set splitbelow splitright " put new windows below/right when splitting
set termguicolors " enable true colors support
set undofile " enable undo files
set updatetime=300 " use shorter update time
" }}}
" Appearance {{{
colorscheme base16-tomorrow-night

" coc.nvim highlights {{{
highlight CocHighlightText guibg=#3B4048

" Match diagnostic colors with color scheme
let bg      = synIDattr(synIDtrans(hlID('SignColumn')), 'bg', 'gui')
let lens    = synIDattr(synIDtrans(hlID('LineNr')),     'fg', 'gui')
let error   = synIDattr(synIDtrans(hlID('Error')),      'fg', 'gui')
let warning = synIDattr(synIDtrans(hlID('Number')),     'fg', 'gui')
let info    = synIDattr(synIDtrans(hlID('Function')),   'fg', 'gui')
let hint    = synIDattr(synIDtrans(hlID('Type')),       'fg', 'gui')

execute 'highlight CocCodeLens    guibg=' . bg . ' guifg=' . lens
execute 'highlight CocErrorSign   guibg=' . bg . ' guifg=' . error
execute 'highlight CocWarningSign guibg=' . bg . ' guifg=' . warning
execute 'highlight CocInfoSign    guibg=' . bg . ' guifg=' . info
execute 'highlight CocHintSign    guibg=' . bg . ' guifg=' . hint

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
" }}}

" Make background transparent
"highlight Normal guibg=NONE

" Don't highlight line number with cursorline
highlight CursorLineNr guibg=#313335
" }}}
" Mappings {{{
let mapleader = ' ' " use space as leader key

" Plugin leaders {{{
nmap <Leader>o [fswitch]
nmap <Leader>f [fzf-preview]
xmap <Leader>f [fzf-preview]
nmap <Leader>n [nerdtree]
" }}}
" Plugin mappings {{{
" vim-autoformat {{{
nnoremap <silent> <Leader>af :Autoformat<CR>
vnoremap <silent> <Leader>af :Autoformat<CR>
" }}}
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

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)
" }}}
" vim-fswitch {{{
nnoremap <silent> [fswitch]f :FSHere<CR>
nnoremap <silent> [fswitch]l :FSRight<CR>
nnoremap <silent> [fswitch]L :FSSplitRight<CR>
nnoremap <silent> [fswitch]h :FSLeft<CR>
nnoremap <silent> [fswitch]H :FSSplitLeft<CR>
nnoremap <silent> [fswitch]k :FSAbove<CR>
nnoremap <silent> [fswitch]K :FSSplitAbove<CR>
nnoremap <silent> [fswitch]j :FSBelow<CR>
nnoremap <silent> [fswitch]J :FSSplitBelow<CR>
" }}}
" fzf-preview.vim {{{
nnoremap <silent> [fzf-preview]p     :<C-u>FzfPreviewFromResources project_mru git<CR>
nnoremap <silent> [fzf-preview]gs    :<C-u>FzfPreviewGitStatus<CR>
nnoremap <silent> [fzf-preview]b     :<C-u>FzfPreviewBuffers<CR>
nnoremap <silent> [fzf-preview]B     :<C-u>FzfPreviewAllBuffers<CR>
nnoremap <silent> [fzf-preview]o     :<C-u>FzfPreviewFromResources buffer project_mru<CR>
nnoremap <silent> [fzf-preview]<C-o> :<C-u>FzfPreviewJumps<CR>
nnoremap <silent> [fzf-preview]g;    :<C-u>FzfPreviewChanges<CR>
nnoremap <silent> [fzf-preview]/     :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-preview]*     :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-preview]gr    :<C-u>FzfPreviewProjectGrep<Space>
xnoremap          [fzf-preview]gr    "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-preview]t     :<C-u>FzfPreviewBufferTags<CR>
nnoremap <silent> [fzf-preview]q     :<C-u>FzfPreviewQuickFix<CR>
nnoremap <silent> [fzf-preview]l     :<C-u>FzfPreviewLocationList<CR>
" }}}
" nerdtree {{{
nnoremap <silent> [nerdtree]t :NERDTreeToggle<CR>
nnoremap <silent> [nerdtree]f :NERDTreeFind<CR>
" }}}
" tagbar {{{
nnoremap <silent> <Leader>ct :TagbarCurrentTag p<CR>
" }}}
" }}}

" Navigate through buffers
nnoremap <silent> <Leader>[ :bprevious<CR>
nnoremap <silent> <Leader>] :bnext<CR>

" Delete current buffer
nnoremap <silent> <Leader>bd :bdelete<CR>

" Normal mode in terminal emulator
" NOTE: You won't be able to close fzf window with <Esc>
"tnoremap <silent> <Esc> <C-\><C-n>

" Move selected lines down/up
nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv
" }}}
" Autocommands {{{
augroup Autocmds
  autocmd!
  " Jump to the last position when reopening a file
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$')
        \ | execute "normal! g'\"" | endif

  " Set comment strings
  autocmd FileType c,cpp setlocal commentstring=//\ %s

  " Highlight the symbol and its references when holding the cursor
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Update signature help on JumpPlaceholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  " Enable indent lines for these file types
  autocmd FileType c,cpp IndentLinesEnable

  " Enable rainbow parentheses for these file types
  autocmd FileType c,cpp RainbowParentheses

  " Close Vim if the only window left open is a NERDTree
  autocmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTree')
        \ && b:NERDTree.isTabTree()) | q | endif
augroup END
" }}}

" vim:foldmethod=marker
