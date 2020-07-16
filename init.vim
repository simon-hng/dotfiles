call plug#begin()
	Plug 'itchyny/lightline.vim'
	Plug 'sonph/onehalf', {'rtp': 'vim/'}
	Plug 'tpope/vim-fugitive'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
	Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
	Plug 'weirongxu/coc-calc', {'do': 'yarn install --frozen-lockfile'}
	Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:lightline = {'colorscheme': 'onehalfdark', }

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set laststatus=2
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

set nu rnu
set hls

set clipboard+=unnamedplus
set timeoutlen=1000 ttimeoutlen=0
set ignorecase
set smartcase
set noswapfile

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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
nmap <F2> <Plug>(coc-rename)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format 

nmap <C-f> :call CocAction('format')<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" VIM fugitive
nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>

packadd termdebug
highlight Comment cterm=italic gui=italic
autocmd FileType c setlocal shiftwidth=2 tabstop=2
