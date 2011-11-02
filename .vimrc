set nocompatible " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Files manager
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'vim-scripts/mru.vim'
Bundle 'vim-scripts/buftabs'
 
" Color scheme
Bundle 'cschlueter/vim-mustang'
Bundle 'godlygeek/csapprox'

" Utilities
Bundle 'mhz/vim-matchit.git'

" Syntax Commenter
Bundle 'vim-scripts/tComment'

" HTML Development 
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" Universal Syntax Checker + Completion
Bundle 'UltiSnips'
Bundle 'scrooloose/syntastic'
Bundle "Shougo/neocomplcache"

" Python Syntax Checker
Bundle 'kevinw/pyflakes-vim'
Bundle 'vim-scripts/pep8'
Bundle 'vim-scripts/Pydiction'

filetype plugin indent on     " required! 


" INSTALLED PACKAGES
" =========================================
" Color scheme Mustang : http://hcalves.deviantart.com/art/Mustang-Vim-Colorscheme-98974484
" Syntastic :https://github.com/scrooloose/syntastic
" FuzzyFinder : http://www.vim.org/scripts/script.php?script_id=1984
" L9 : http://www.vim.org/scripts/script.php?script_id=3252
" Pyflakes : https://github.com/kevinw/pyflakes-vim
" NerdTree : https://github.com/scrooloose/nerdtree
" NerdCommenter : https://github.com/scrooloose/nerdcommenter
" Tagbar : https://github.com/majutsushi/tagbar
" Sparkup : http://jetpackweb.com/blog/2010/03/04/write-html-faster-with-sparkup-vim-and-textmate/
" UltiSnips
" MRU
"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" Ignore some file
set wildignore=*.swp,*.bak,*.pyc,*.class

" Set to auto read when a file is changed from the outside
set autowrite

" With a map leader it's possible to do extra key combinations
" leader is press comma (,) key
" like <leader>w saves the current file
let mapleader=","
let g:mapleader=","

" Fast saving with leader + w
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=7            " Set 7 lines to the curors - when moving vertical..
set ruler           "Always show current position
set hid             "Change buffer - without saving
set nohidden

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set nolazyredraw "Don't redraw while executing macros 
set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them

" No sound on errors
set noerrorbells
set novisualbell
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

set shell=/bin/bash

set guioptions-=T
set background=dark
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
colorscheme mustang
set nonu
set gfn=Ubuntu\ Mono\ 11 

set encoding=utf8
try
    lang en_US
catch
endtry

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=90
endif
  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Useful when moving accross long lines
map j gj
map k gk

map <silent> <leader><cr> :nohlsearch<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Moving tab using CTRL+ the arrows
map <C-right> :bn<CR>
map <C-left> :bp<CR>

" Tab configuration
map <leader>tn :tabnew! %<cr>
map <leader>te :tabedit 
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" My CUSTOM 
"
set cmdheight=1               " Explicitly set the height of the command line
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set pastetoggle=<F3>          " Press F3 for toggle paste mode
set cursorline
set colorcolumn=80 " Mark 80th column with a red line

" Taken From http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%81v.\+/

" Paste using ,v in normal mode
nnoremap <leader>v "+gP

" Set default environment based on current edited files
autocmd BufEnter * silent! lcd %:p:h

" The best thing here! 
" In insert mode, you can paste from clipboard using CTRL+v
inoremap <C-v> <ESC>:set paste<CR>"+gp<ESC>:set nopaste<ENTER>i<RIGHT>

" have command-line completion <tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <tab>s cycle through the possibilities:
set wildmode=list:longest,full

set nowrap          " no line wrapping;
set guioptions+=b   " add a horizontal scrollbar to the bottom

"--- search options ------------
set incsearch       " show 'best match so far' as you type
set hlsearch        " hilight the items found by the search
set ignorecase      " ignores case of letters on searches
set smartcase       " Override the 'ignorecase' option if the search pattern contains upper case characters

" Search and error color highlights
hi Search guifg=#ffffff guibg=#0000ff gui=none ctermfg=white ctermbg=darkblue
hi IncSearch guifg=#ffffff guibg=#8888ff gui=none ctermfg=white
highlight SpellBad guifg=#ffffff guibg=#8888ff gui=none ctermfg=black ctermbg=darkred

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Always show status line, even for one window
set laststatus=2

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" Don't request terminal version string (for xterm)
set t_RV=

"--- Keystrokes ----------------
" h and l wrap between lines, cursor keys wrap in insertion mode
set whichwrap=h,l,~,[,]

" page down with <SPACE>, pageup with - or <BkSpc>
noremap <Space> <PageDown>
noremap <BS> <PageUp>

" allow <BkSpc> to delete line breaks, start of insertion, and indents
set backspace=eol,start,indent

" Execute Python file being edited with <Shift> + e:
nnoremap E w:<CR>:!python % <CR>

" Shortcut to Close quickfix window with leader+c
nnoremap <leader>c <CR>:cclose<CR>

" Set autocomplete form 
set completeopt=menuone,longest,preview

"--- python formatting help ---
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,ctp setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php,ctp setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType vim set omnifunc=syntaxcomplete#Complete

" markdown
au BufEnter,Bufread *.mkd,*.md,*.mdown,*.markdown setlocal tw=0

" http://www.brankovukelic.com/post/2091037293/turn-vim-into-powerful-javascript-editor"

" HTML (tab width 2 chr, no wrapping)
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0

" XHTML (tab width 2 chr, no wrapping)
autocmd FileType xhtml set sw=2
autocmd FileType xhtml set ts=2
autocmd FileType xhtml set sts=2
autocmd FileType xhtml set textwidth=0

" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2

" Folding
" auto save folding : http://princ3.wordpress.com/2007/01/26/automaticaly-save-foldings-in-vim/
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
autocmd BufWinLeave .* mkview
autocmd BufWinEnter .* silent loadview 

autocmd Syntax c,cpp,vim,xml,html,xhtml,js,php,py,python setlocal foldmethod=manual
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

"remove trailing whitespace
"http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.cpp :%s/\s\+$//e
autocmd BufWritePre *.c++ :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e
autocmd BufWritePre *.java :%s/\s\+$//e
autocmd BufWritePre *.php :%s/\s\+$//e
autocmd BufWritePre *.pl :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e

" tabs, not spaces for php, ctp
au BufEnter,BufRead *.php,*.ctp setlocal noexpandtab

" Autoclose quickfix windows when quit
" http://stackoverflow.com/questions/7476126/how-to-automatically-close-the-quick-fix-window-when-leaving-a-file
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" http://stackoverflow.com/questions/1687252/with-vim-use-both-snipmate-and-pydiction-together-share-the-tab-key "
" Change share keys between pydiction and snipmate
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
if has("gui_running")
    " Vimdiff colorscheme
    highlight DiffAdd cterm=none ctermfg=bg ctermbg=Green gui=none guifg=bg guibg=Green
    highlight DiffDelete cterm=none ctermfg=bg ctermbg=Red gui=none guifg=bg guibg=Red
    highlight DiffChange cterm=none ctermfg=bg ctermbg=Yellow gui=none guifg=bg guibg=Yellow
    highlight DiffText cterm=none ctermfg=bg ctermbg=Magenta gui=none guifg=bg guibg=Magenta
endif

" CUSTOM CONFIGURATION FOR INSTALLED PLUGIN
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pep8 using F5
" You can change with this :
let g:pep8_map='F5'

" Pydiction
let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'

"""" PYTHON STYLE """"
let python_highlight_all=1 " Enable all plugin's highlighting.
let python_slow_sync=1 " For fast machines.
let python_print_as_function=1 " Color 'print' function.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips - ultimate snippets
"
set runtimepath+=~/.vim/bundle/UltiSnips
let g:UltiSnipsSnippetsDir='~/.vim/bundle/UltiSnips/UltiSnips/'

set runtimepath+=~/.vim/ultisnips_rep

" UltiSnips plugin
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FuzzFinder Shorcuts. Using F2 for opening FuzzyFinderTextMate
map <leader>f :FufFileWithCurrentBufferDir<CR>
map <F2> :FufFileWithFullCwd<CR>
map <leader>b :FufBuffer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRU shorcuts
map <leader><space> :MRU<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pyflakes configuration
if has("gui_running")
    highlight SpellBad term=underline gui=undercurl guisp=Orange
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure neocomplcache autocomplete 
" http://www.vim.org/scripts/script.php?script_id=2620
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_min_syntax_length = 3 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

highlight Pmenu gui=bold

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif


if has("gui_running")
    highlight SpellBad term=underline gui=undercurl guisp=Orange
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open Window Explorer NerdTree & Tagbar using (left-right sidebar) using <F8>
"
function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose
    elseif nerdtree_open
        TagbarOpen
    elseif tagbar_open
        NERDTree
    else
        NERDTree
        TagbarOpen
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction

" now you can open NERDTree and Tagbar using F8
" http://stackoverflow.com/questions/6624043/how-to-open-or-close-nerdtree-and-tagbar-with-leader
nmap <F8> :call ToggleNERDTreeAndTagbar()<CR>

" TagBar Configuration
let g:tagbar_usearrows=1
let g:tagbar_width=30
nnoremap <leader>l :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""
" NERDTree : https://github.com/scrooloose/nerdtree.git
" MODIFYING NERDTree MY CUSTOM
" how to using NERDTree : http://ykyuen.wordpress.com/2011/04/04/nerdtree-the-file-explorer-in-vivim/
"""""""""""""""""""""""""""""""""""""""""""

" Enable this for make NERDTree load every opening files
" autocmd VimEnter * NERDTree         " Make Always Load NERDTree every opening files
" autocmd VimEnter * wincmd p         " Automatically go to buffer every time open files

" FIXING NERDTree, automatically close if there no file edited 
"https://github.com/scrooloose/nerdtree/issues/21
"
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Use leader + t for opening File Explorer
map <leader>t :NERDTreeToggle<CR>

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

