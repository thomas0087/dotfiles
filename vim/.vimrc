set history=500

filetype plugin on 
filetype indent on

set autoread

set ruler

set cmdheight=2

set backspace=eol,start,indent 
set whichwrap+=,h,l

set showmatch

set mat=2

set noerrorbells 
set novisualbell 
set t_vb= 
set tm=500

set number

set ignorecase 
set smartcase

set hlsearch

set incsearch

syntax enable

"treat .cap files as ruby
au BufNewFile,BufRead *.cap set filetype=ruby
"treat .dump files as sql
au BufNewFile,BufRead *.dump set filetype=sql

colorscheme desert 
set background=dark

if has("gui_running") 
  set guioptions-=T 
  set guioptions+=e 
  set t_Co=256 
  set guitablabel=%M\ %t 
endif

set encoding=utf8

set expandtab

set shiftwidth=4 
set tabstop=4

"for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et

set ai

set si

set wrap

set laststatus=2

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l 
function! HasPaste() 
  if &paste 
    return 'PASTE MODE ' 
  en 
  return '' 
endfunction

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

func! DeleteTrailingWS() 
  exe "normal mz" 
  %s/\s\+$//ge 
  exe "normal `z" 
endfunc 
autocmd BufWrite *.py :call DeleteTrailingWS() 
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"highlight lines longer than 80 chars
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

set runtimepath^=~/.vim/bundle/ctrlp.vim

execute pathogen#infect()

"Remove those pesky balloon tooltips in Ruby
"Needs to be after pathogen is initalised
if has("gui_running")
  :set noballooneval
  set guifont=Menlo\ Regular:h14
endif
