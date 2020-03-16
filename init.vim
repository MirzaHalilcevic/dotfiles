" A Neovim configuration by Mirza Halilcevic
" Note: 'Nerd Fonts' is required for special glyphs

" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')

" Lean & mean status/tabline for Vim that's light as air
Plug 'vim-airline/vim-airline'

" Provide easy code formatting in Vim by integrating existing code formatters
Plug 'Chiel92/vim-autoformat'

" IntelliSense engine for Vim8 & Neovim, full language server protocol support
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Brings physics-based smooth scrolling to the Vim world
Plug 'yuttie/comfortable-motion.vim'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Easy git merge conflict resolution in Vim
Plug 'christoomey/vim-conflicted'

" Extended Vim syntax highlighting for C and C++
Plug 'bfrg/vim-cpp-modern'

" Asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

" Helpers for UNIX
Plug 'tpope/vim-eunuch'

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

" Adaptation of one-light and one-dark colorschemes for Vim
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
" cpp-modern {{{
let g:cpp_named_requirements_highlight = 1
" }}}
" indentLine {{{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
" }}}
" JSON {{{
let g:vim_json_syntax_conceal = 0
" }}}
" }}}
" Options {{{
set autoindent smartindent " enable smart indentation
set cmdheight=2 " make the command region 2 lines high
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
set scrolloff=1 " keep 1 line above and below the cursor
set shortmess+=c " don't pass messages to ins-completion-menu
set signcolumn=yes " always show the sign column
set smarttab " enable smart tabs
"set spell spelllang=en " enable spell checking
set tabstop=2 shiftwidth=2 softtabstop=0 " make tabs and indents 2 spaces wide
set termguicolors " enable true colors support
set undofile undodir=~/.local/share/nvim/undodir " enable undo files
set undolevels=1000 undoreload=10000 " limit number of undos
set updatetime=300 " use shorter update time

" Set appropriate comment strings according to file type
autocmd FileType c,cc,cpp,cxx,h,hh,hpp,hxx setlocal commentstring=//\ %s

" Disable line numbers and cursorline when in terminal emulator
augroup TerminalStuff
  au!
  autocmd TermOpen * setlocal nonu nornu nocul
augroup END
" }}}
" Appearance {{{
set background=dark
colorscheme one

" Transparency
"hi Normal guibg=NONE ctermbg=NONE

" Don't highlight current line number background
hi CursorLineNr guibg=NONE

" Spell check
hi clear SpellBad
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare
hi SpellBad   guisp=#98C379 gui=undercurl
hi SpellCap   guisp=#98C379 gui=undercurl
hi SpellLocal guisp=#98C379 gui=undercurl
hi SpellRare  guisp=#98C379 gui=undercurl

" Coc
hi CocErrorSign        guifg=#BE5046
hi CocErrorHighlight   guisp=#BE5046 gui=undercurl
hi CocWarningSign      guifg=#D19A65
hi CocWarningHighlight guisp=#D19A65 gui=undercurl
hi CocCodeLens         guifg=#5B6068

" fzf
hi fzf1 guifg=#BE5046 guibg=#2C323C
hi fzf2 guifg=#98C379 guibg=#2C323C
hi fzf3 guifg=#A1A8B5 guibg=#2C323C
" }}}
" Mappings {{{
let mapleader = ' ' " use space as leader key

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold   :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

" esc -> enter normal mode when in terminal emulator
tnoremap <esc> <C-\><C-n>

" esc + tab/backspace -> next/previous buffer
nnoremap <esc><tab> :bnext<CR>
nnoremap <esc><bs>  :bprev<CR>

" leader + f -> open fuzzy finder for files
nnoremap <leader>f :Files<CR>

" alt + down/up -> move selected lines down/up
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up>   :m .-2<CR>==
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up>   <Esc>:m .-2<CR>==gi
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up>   :m '<-2<CR>gv=gv
" }}}

" vim:foldmethod=marker
