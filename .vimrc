"  _  __     _      _      __     _____ __  __    ____             __ _       
" | |/ /   _| | ___( )___  \ \   / /_ _|  \/  |  / ___|___  _ __  / _(_) __ _ 
" | ' / | | | |/ _ \// __|  \ \ / / | || |\/| | | |   / _ \| '_ \| |_| |/ _` |
" | . \ |_| | |  __/ \__ \   \ V /  | || |  | | | |__| (_) | | | |  _| | (_| |
" |_|\_\__, |_|\___| |___/    \_/  |___|_|  |_|  \____\___/|_| |_|_| |_|\__, |
"      |___/                                                            |___/ 
" 




set background=dark
execute pathogen#infect()
filetype plugin indent on

"------Powerline----------
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/                                                         
" Always show statusline
set laststatus=2

"-----NERDTree-----------
nmap <silent> <F3> :NERDTreeToggle<CR>

"line 
set encoding=utf-8
set tabstop=2
set visualbell
syntax on
set nocompatible
set cursorline
"set colorcolumn=110
set shiftwidth=4
set softtabstop=4
set expandtab
filetype plugin indent on


"format 
set wrap
set textwidth=79
set number
set relativenumber
set autoindent
set smartindent

"mappings
inoremap { {<CR><BS>}<Esc>ko

"Add mapping for closing brackets etc.
"Source: http://vim.wikia.com/wiki/Making_Parenthesis_And_Brackets_Handling_Easier
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf


"search 
set hlsearch
set ignorecase
set smartcase
set showmatch

let g:powerline_pycmd= "py3"
