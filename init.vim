scriptencoding utf-8
set nocompatible

" auto install for first time
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Use colours and encoding
set encoding=utf-8
" set termguicolors
" set t_Co=256

" Always show statusline
set laststatus=2
set showtabline=1
"set showmode

" kitty vim adapter
" if $TERM == "xterm-kitty"
"     let &t_ut=''
" endif

" use vim packages in ~/.vim
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath

set autoread
set autowrite
" colors and syntax
syntax enable
syntax on
filetype on
filetype plugin on

"set cursorline cursorcolumn

" scrolling settings
set nofoldenable
set sidescroll=1
set sidescrolloff=8
set scrolloff=5
" tab and indent settings
filetype indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smarttab
set autoindent
set smartindent

" no bells
set noerrorbells
set novisualbell

set number
set relativenumber
set showcmd
set mouse=a

" searching settings
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
" auto completion menu
set wildmenu
set wildignorecase

set lazyredraw
set ttyfast

set nolist
set listchars=eol:¶,tab:>_,trail:·,extends:¦,precedes:¦,space:·,nbsp:␣

" word wrap only for text files
set nowrap
autocmd BufRead,BufNewFile *.txt,*.md,*.tex setlocal wrap

"------------------------------------------------
" Key bindings
"------------------------------------------------
" better movement for plain text editing while wraping
autocmd BufRead,BufNewFile *.txt,*.md,*.tex nnoremap j gj
autocmd BufRead,BufNewFile *.txt,*.md,*.tex nnoremap k gk
autocmd BufRead,BufNewFile *.md,*.markdown inoremap ``` ```<CR>```<up>
" normal/visual mod: Alt + hjkl -> move/indent line
nnoremap <A-h> <<
nnoremap <A-l> >>
vnoremap <A-h> <gv
vnoremap <A-l> >gv
nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv
" use system clip board accordingly
set clipboard+=unnamedplus

" insert the current date and time
inoremap <silent> <insert>date <C-R>=strftime('%c')<CR>
" <Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>
" run startify
nnoremap <silent> ZA :Startify<CR>
" toggle table mode
nmap <silent> <F3> :TableModeToggle<CR>
" avoid accidentally toggle help
noremap <F1> <ESC>
noremap! <F1> <ESC>
" Make Y  behave like C and D
noremap Y y$


" :W = :w
command! -nargs=0 W :w

" terminal behaviour
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert

"------------------------------------------------
" vim-plug settings
"------------------------------------------------
call plug#begin('~/.config/nvim/plugged')
" Editor Functionality
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'Konfekt/vim-CtrlXA'
Plug 'junegunn/vim-peekaboo'
" Themes and Colors
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-one'
Plug 'ryanoasis/vim-devicons'
" External Functionalities
" Plug 'junegunn/fzf', { 'dir': '~/.local/fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
Plug 'mhinz/vim-startify'
" Browser extensions
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Plug 'glacambre/firenvim', { 'do': ':call firenvim#install(0)' }

" testing
Plug 'dkarter/bullets.vim', { 'for': ['markdown', 'vim-plug'] }
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mzlogin/vim-markdown-toc'
Plug 'HE7086/cyp-vim-syntax'
call plug#end()

"------------------------------------------------
" Plugin settings
"------------------------------------------------
" themes
set background=dark
" let g:airline_theme='solarized'
" let g:solarized_termcolors=256
" colorscheme solarized
let g:airline_theme='one'
let g:one_allow_italics=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme one
set termguicolors
let g:airline_powerline_fonts=1
let g:airline_extensions=['branch']
"let g:airline_section_y='%{strlen(&fenc)?&fenc:&enc}[%{&ff}]'
let g:airline_section_z='%3p%%%4l%3c'

" NERDTree
let NERDTreeMapToggleHidden="zh"
let NERDTreeMapCustomOpen="l"
let NERDTreeMapUpdir="h"
let NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }

" startify
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
let g:startify_bookmarks = [ {'v': '~/.config/nvim/init.vim'}, {'z': '~/.zshrc'} ]
"let g:startify_commands = [ {'Vim Help Page': 'help'} ]
let g:startify_custom_header = [
            \ "         _   _ _______   _____ _____ ___   ___   __",
            \ "        | | | | ____\\ \\ / /_ _|___  / _ \\ ( _ ) / /_",
            \ "        | |_| |  _|  \\ V / | |   / / | | |/ _ \\| '_ \\",
            \ "        |  _  | |___  | |  | |  / /| |_| | (_) | (_) |",
            \ "        |_| |_|_____| |_| |___|/_/  \\___/ \\___/ \\___/",
            \ "                     __     _____ __  __",
            \ "                     \\ \\   / /_ _|  \\/  |",
            \ "                      \\ \\ / / | || |\\/| |",
            \ "                       \\ V /  | || |  | |",
            \ "                        \\_/  |___|_|  |_|"
            \ ]

" CtrlXA switch list
let g:CtrlXA_Toggles = [
            \ ['&&', '||'],
            \ ['+', '-'], ['++', '--'],
            \ ['==', '!='] , ['=~', '!~'],
            \ ['<=', '>'], ['<', '>='], ['>>', '<<'],
            \ ['true', 'false'], ['True', 'False'], ['TRUE', 'FALSE'],
            \ ['yes', 'no'], ['Yes', 'No'], ['YES', 'NO'],
            \ ['on', 'off'], ['On', 'Off'], ['ON', 'OFF'],
            \ ['up', 'down'], ['Up', 'Down'] ,['UP', 'DOWN'],
            \ ['enable', 'disable'], ['Enable', 'Disable'],
            \ ['enabled', 'disabled'], ['Enabled', 'Disabled'],
            \ ['upper', 'lower'], ['Upper', 'Lower'],
            \ ['top', 'bottom'], ['Top', 'Bottom'],
            \ ['above', 'below'], ['Above', 'Below'],
            \ ['forward', 'backward'], ['Forward', 'Backward'],
            \ ['right', 'left'], ['Right', 'Left'],
            \ ['next', 'previous'], ['Next', 'Previous'],
            \ ['first', 'last'], ['First', 'Last'],
            \ ['before', 'after'], ['Before', 'After'],
            \ ['more', 'less'], ['More', 'Less'],
            \ ['fast', 'slow'], ['Fast', 'Slow'],
            \ ['light', 'dark'] , ['Light', 'Dark'] ,
            \ ['good', 'bad'], ['Good', 'Bad'],
            \ ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'],
            \ ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'],
            \ ]

" coc.nvim addons
set hidden
set updatetime=500
let g:coc_global_extensions = [
    \ 'coc-json', 
    \ 'coc-yaml', 
    \ 'coc-highlight', 
    \ 'coc-python', 
    \ 'coc-html', 
    \ 'coc-clangd',
    \ 'coc-pairs'
    \ ]

if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif
" Use <c-space> to force trigger completion.
inoremap <silent><expr> <c-space> coc#refresh() " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> g- <Plug>(coc-diagnostic-prev)
nmap <silent> g= <Plug>(coc-diagnostic-next)
xmap = <Plug>(coc-format-selected)
" shift - F6 to rename, same as intellij
nmap <F18> <Plug>(coc-refactor)
" nmap <M-CR> :CocAction quickfix<CR>
map <M-CR> :CocFix<CR>
" nmap <M-CR> :CocAction<CR>
" nmap <M-CR> <Plug>(coc-codeaction)
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (indx(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
" Use ctrl-f to format
map <C-f> :call CocAction('format')<CR>
" No prompt after :w
silent !<command>

" ---------- Run Code in Terminal ----------
autocmd BufRead,BufNewFile *.hs nnoremap <F22> :w<CR>:term ghci %<CR>
autocmd BufRead,BufNewFile *.c nnoremap <F22> :w<CR>:term clang % -o test.out; ./test.out<CR>
autocmd BufRead,BufNewFile *.cpp nnoremap <F22> :w<CR>:term clang++ % -o test.out; ./test.out<CR>
autocmd BufRead,BufNewFile *.py nnoremap <F22> :w<CR>:term python %<CR>

" ---------- End of Settings ----------

exec "nohlsearch"
