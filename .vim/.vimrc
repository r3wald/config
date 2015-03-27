" Environment {{{

set nocompatible
set background=dark

set t_Co=256

" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
	set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
	set term=$TERM
endif

" }}}


" Plugins {{{

" required!
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
"Bundle 'tpope/vim-ragtag'
"Bundle 'gregsexton/MatchTag'
Bundle 'Valloric/MatchTagAlways'
"Bundle 'Lokaltog/TagHighlight'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'jelera/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'ervandew/supertab'
Bundle 'int3/vim-taglist-plus'
"Bundle 'xolox/vim-easytags'

" php:
"Bundle 'jimktrains/phpm'
"Bundle 'hpyhacking/ManPageView'
"Bundle 'mikehaertl/pdv-standalone'

" css:
"Bundle 'lilydjwg/colorizer'
"Bundle 'chrisbra/color_highlight'

" colorschemes:
Bundle 'jnurmine/Zenburn'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'jelera/vim-gummybears-colorscheme'
Bundle 'ruda/satori'

" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'ZenCoding.vim'

" B
" php:
"Bundle 'phpcodesniffer.vim'

" colorschemes:
Bundle 'freya'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

" required!
filetype plugin indent on

" }}}


" General {{{

" set initial window size if running GUI
if has('gui_running')
	set lines=60 columns=135
endif

" number of things to remember in history.
set history=256

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
" "," key and the "d" key. If the "d" key isn't pressed before the
" timeout expires, one of two things happens: The "," command is executed
" if there is one (which there isn't) or the command aborts.
" (time to wait after ESC)
set timeoutlen=250
" Quickly time out on keycodes, but never time out on mappings
"set notimeout ttimeout ttimeoutlen=200

"set modeline
" default numbers of lines to read for modeline instructions
"set modelines=5

" writes on make/shell commands
"set autowrite
"set autoread

set backup
set backupdir=$HOME/.vim/.vimbackup//
set directory=$HOME/.vim/.vimswap//
set viewdir=$HOME/.vim/.vimviews//
" Creating directories if they don't exist
silent execute '!mkdir -p $HOME/.vim/.vimbackup'
silent execute '!mkdir -p $HOME/.vim/.vimswap'
silent execute '!mkdir -p $HOME/.vim/.vimviews'

" allow unsaved buffers in background
set hidden

" highlight search
set hlsearch
" case insensitive when searching
set ignorecase
" case sensitive when input has a capital letter
set smartcase
" show matches while typing
set incsearch

" set the search scan to wrap lines
set wrapscan

" better command-line completion
set wildmenu
" make it easier to complete buffers, open files, etc.
set wildignorecase

" set the forward slash to be the slash of note. Backslashes suck
set shellslash

" enable mouse in GUI mode
set mouse=a
" hide mouse while typing
set mousehide

" lines to keep when scrolling
set scrolloff=3

set nostartofline

" do not update the display while executing macros
set lazyredraw

" add the unnamed register to the clipboard
set clipboard+=unnamed

" system default for mappings is now the "," character
let mapleader = ","

" spell checking on
"set spell

" }}}


" Formatting {{{

scriptencoding utf-8

set backspace=indent,eol,start

" tab size
set tabstop=4
" default shift width for indents
set shiftwidth=4
set softtabstop=4
" replace tabs with ${tabstop} spaces
"set expandtab
"set smarttab

set autoindent

" when completing by tag, show the whole tag, not just the function name
set showfulltag

" }}}


" Visual {{{

" enable syntax highlighting
syntax on

" limit syntax highlighting to n columns
set synmaxcol=250

colorscheme zenburn

" line numbers on
set number
"set relativenumber

" show matching brackets
set showmatch
" bracket blinking
"set matchtime=2

" highlight the current line and column
" do not do this - it makes window redraws painfully slow
"set nocursorline
set cursorline
set nocursorcolumn

" set the textwidth to be 80 chars
"set textwidth=80

" set width indicator to 80 chars
set colorcolumn=80

" set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions=acg

" make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
"set cpoptions=ces$
set cpoptions+=$

" always show status line
set laststatus=2
" shortens messages
"set shortmess=atI
" display an incomplete command in statusline
set showcmd
" command line height
set cmdheight=2

" show the current mode
set showmode

" set the status line the way i like it
"set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" no noise
set noerrorbells
" no blinking
"set novisualbell
" disable any beeps or flashes on error
set vb t_vb=

" highlight unwanted whitespace
highlight ExtraWhitespace ctermbg=red guibg=#9c7166
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=#9c7166
match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t\|[^\t]\zs\t\+\|^ \+\ze[^ ]/
autocmd BufWinEnter * match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t\|[^\t]\zs\t\+\|^ \+\ze[^ ]/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t\|[^\t]\zs\t\+\|^ \+\ze[^ ]/
autocmd InsertLeave * match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t\|[^\t]\zs\t\+\|^ \+\ze[^ ]/
autocmd BufWinLeave * call clearmatches()
"set list listchars=tab:»·,trail:·

" trim tailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" }}}


" Mappings {{{

" Wipe out all buffers
nmap <silent> ,wa :1,9000bwipeout<cr>

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" The following beast is something i didn't write... it will return the
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as
" syntax highlighting goes.
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" set text wrapping toggles
nmap <silent> ,ww :set invwrap<CR>:set wrap?<CR>

" allow command line editing like emacs
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <End>
cnoremap <C-P> <Up>
cnoremap <ESC>b <S-Left>
cnoremap <ESC><C-B> <S-Left>
cnoremap <ESC>f <S-Right>
cnoremap <ESC><C-F> <S-Right>
cnoremap <ESC><C-H> <C-W>

" Maps to make handling windows a bit easier
"noremap <silent> ,h :wincmd h<CR>
"noremap <silent> ,j :wincmd j<CR>
"noremap <silent> ,k :wincmd k<CR>
"noremap <silent> ,l :wincmd l<CR>
"noremap <silent> ,sb :wincmd p<CR>
noremap <silent> <C-F9> :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>
noremap <silent> ,s8 :vertical resize 83<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
noremap <silent> ,cc :close<CR>
noremap <silent> ,cw :cclose<CR>
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
noremap <silent> <C-7> <C-W>>
noremap <silent> <C-8> <C-W>+
noremap <silent> <C-9> <C-W>+
noremap <silent> <C-0> <C-W>>

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh

" Add a GUID to the current line
imap <C-J>d <C-r>=substitute(system("uuidgen"), '.$', '', 'g')<CR>

" Search the current file for what's currently in the search register and display matches
nmap <silent> ,gs :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> ,gw :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> ,gW :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Toggle fullscreen mode
nmap <silent> <F3> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" Underline the current line with '='
nmap <silent> ,ul :t.\|s/./=/g\|:nohls<cr>

" Shrink the current window to fit the number of lines in the buffer. Useful
" for those buffers that are only a few lines
nmap <silent> ,sw :execute ":resize " . line('$')<cr>

" Use the bufkill plugin to eliminate a buffer but keep the window layout
nmap ,bd :BD<cr>

" Use CTRL-E to replace the original ',' mapping
nnoremap <C-E> ,

" remove search highlight
nnoremap <esc> :noh<return><esc>

" Alright... let's try this out
imap jj <esc>

" Clear the text using a motion / text object and then move the character to the
" next word
"nmap <silent> ,C :set opfunc=ClearText<CR>g@
"vmap <silent> ,C :<C-U>call ClearText(visual(), 1)<CR>

" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Toggle taglist
nmap <F8> :TlistToggle<CR>

" }}}
