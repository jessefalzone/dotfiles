"Pathogen plugin manager
execute pathogen#infect()

"Not compatible with vi
set nocompatible

"gui options
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L
:set guifont=Menlo:h14
":set transparency=25

" Filetype Stuff
filetype on
filetype plugin on
filetype indent on

"Turn on syntax highlighting
syntax on

set hidden

"Don't update display when executing macros
set lazyredraw

"Let yourself know what mode you're in
set showmode

"set search scan to wrap around file
set wrapscan

set backspace=indent,eol,start

"make command line two lines high
set ch=2

"keep stuff in history
set history=100

"set tabs to only be 2 spaces
set tabstop=2 shiftwidth=2 expandtab

"set line numbers
set number

"set cursor options
"au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"au VimEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%100v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

color ir_black
"highlight LineNr ctermfg=blue
"highlight LineNr ctermbg=black

"tab background color
hi TabLineFill term=bold cterm=bold ctermbg=black
hi TabLineSel ctermfg=white ctermbg=blue
hi TabLine ctermfg=white ctermbg=black

"tab navigation
map <C-n> <ESC>:tabnew<RETURN>
map <C-h> <ESC>:tabp<CR>
map <C-l> <ESC>:tabn<CR>

"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror
"map <silent> <C-d> :execute 'NERDTreeToggle ' . getcwd()<CR>
map <silent> <C-d> :NERDTreeToggle<CR> :NERDTreeMirror<CR>
set guioptions-=T

"close nerdtree after opening a file
let NERDTreeQuitOnOpen = 1

au BufNewFile,BufRead *.ejs set filetype=html

"only open nerdtree if vim is opened without args
function! StartUp()
  if 0 == argc()
    NERDTree
  end
endfunction
autocmd VimEnter * call StartUp()
autocmd BufWinEnter * NERDTreeMirror
autocmd BufEnter * NERDTreeMirror

"close nerdtree when quitting a file
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"command to remove all trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"make cursor move as expected with wrapped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

"map jj to escape, ;; to escape visual mode
noremap! jj <Esc>
vnoremap ;; <Esc>

"split windows
nmap <C-w>v :vsplit<CR>
nmap <C-w>s :split<CR>
nmap <C-w>o :only<CR>
nmap <C-w>c :close<CR>

" Searching
"set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

"statusline setup
"set statusline =%#Keyword#
hi statusline ctermfg=4
set statusline =%t    "tail of the filename
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag

"read only flag
"set statusline+=%#Keyword#
set statusline+=%r
set statusline+=%*

"modified flag
"set statusline+=%#Keyword#
set statusline+=%m
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%y      "filetype
set statusline+=[%{strlen(&fenc)?&fenc:'none'}] "file encoding
set statusline+=%c,    "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

