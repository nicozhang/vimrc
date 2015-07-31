"set runtimepath=/home/seanxue/cfg/vim,$VIMRUNTIME
"source /home/seanxue/cfg/vim/.vimrc

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' "need manual install

" plugin list
Plugin 'vim-scripts/winmanager--Fox'
Plugin 'vim-scripts/python.vim'
Plugin 'vim-scripts/tlib'
Plugin 'vim-scripts/python_match.vim'
Plugin 'vim-scripts/dbext.vim'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe' "need manual install dependings
Plugin 'Raimondi/delimitMate'
Plugin 'Lokaltog/vim-powerline'
Plugin 'majutsushi/tagbar'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'hdima/python-syntax'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'godlygeek/tabular'
Plugin 'bronson/vim-visual-star-search'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'guns/xterm-color-table.vim'
Plugin 'uarun/vim-protobuf'
Plugin 'yegappan/grep'
Plugin 'elzr/vim-json'
Plugin 'aklt/plantuml-syntax'
Plugin 'tpope/vim-surround'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
"Plugin 'powerman/vim-plugin-viewdoc'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" vim-airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2


" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" vi settings
" global functioins
function! GetSys()
    if has("win32")
        return "win32"
    elseif has("unix")
        return "unix"
    else
        return "mac"
    endif
endfunction

" generic
"set runtimepath=~/cfg/vim,$VIMRUNTIME
set nocompatible
set number
set showcmd
set encoding=utf-8
"set termencoding=gb18030
set fileformats=unix,dos,mac
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
syntax on
filetype plugin indent on
" syntax enable
nmap <F1> :help 

set history=600 "Command history count
set wildmenu "Turn on Wild menu
set wildmode=longest:full,list,full
set ruler "Always show current positon 
set cmdheight=2 "Command buffer heigh
set backspace=indent,eol,start
set shortmess=atToO
set autowriteall "auto save change

if &diff == 1
  set scrollbind
endif

set smartcase
set ignorecase "Ignore case when searching
set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers

set showmatch "Show matching bracets when text indicator is over them
set matchtime=3 "How many tenths of a second to blin

" settings of tab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set autoindent 
set smartindent
set nofoldenable

set mouse=v "catch mouse TODO set variant from OSs

if has("gui_running")
  set background=dark
  colorscheme peaksea
else
  set background=dark
  colorscheme desert
endif

let mapleader = ","
let g:mapleader = ","

""buffer manipulate""
" last used buffer
nmap <leader>b :b#<CR>
" goto next buffer
nmap <leader>bn :bn<CR>
nmap <C-b> :bn<CR>
" goto previous buffer
nmap <leader>bp :bp<CR>
nmap <C-S-b> :bp<CR>
" goto buffer by indicate buffer id
nmap <leader>B :b 
" goto indicate buffer
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

nnoremap <Leader>x :split<CR>
nnoremap <Leader>y :vsplit<CR>
nnoremap <Leader>C :close<CR>

"" man.vim
source $VIMRUNTIME/ftplugin/man.vim
nmap <leader>M :Man <C-R>=expand("<cword>")<CR><CR>

" settings of exuberant ctags
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Auto_Open=1
let Tlist_Inc_Winwidth=0
let Tlist_Auto_Update=1
let Tlist_Compact_Format=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow = 1
autocmd BufWrite *.h,*.c,*.hpp,*.cc,*.cpp,*.rl,*.def,*.py call UpdateTags()
"autocmd BufRead,BufNewFile *.h,*.hpp,*.c,*.cpp,*.cc setlocal tags+=~/.ctags/tags
" colorize 80 char to indicate more line over length
autocmd BufRead,BufNewFile *.h,*.hpp,*.c,*.cpp,*.cc,*.py 2match Underlined /.\%81v/
set tags=./tags;${HOME}/.ctags/tags
nmap <leader>l :ts<CR>
nmap <leader>tn :tn<CR>
nmap <leader>tp :tp<CR>
map <A-l> :ts<CR>

let g:winManagerWindowLayout='BufExplorer,FileExplorer'
let g:winManagerWidth=30
"let g:persistentBehaviour=0
nmap wm :WMToggle<cr>
nmap <F6> :WMToggle<cr>

" tagbar settings
let g:tagbar_width=30
nmap <F7> :TagbarToggle<CR>

" NERD commenter settings
let NERDShutUp=1

" remove trailing space before writting buffer
autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.cc,*.py,*.json,*.proto :%s/\s\+$//e

" doxygen settings
let g:DoxygenToolkit_authorName="Sean Xue"
let g:DoxygenToolkit_licenseTag=""
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief "
let g:DoxygenToolkit_paramTag_pre = "@param "
let g:DoxygenToolkit_returnTag = "@return "
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30
map <leader>d :Dox<cr>

""grep.vim configs""
nnoremap <silent> <F3> :Grep<CR>
nnoremap <silent> <F4> :cclose<CR>
nnoremap <silent> <leader><F3> :copen<CR>
" ignoring binary files, perl regexp, search recursive
let g:Grep_Default_Options='-IPr'
" skipped files
let g:Grep_Skip_Files='tags *.bak *~'

" yankring
let g:yankring_history_file='.yankring_history'

" other key maps
map <leader>nh :nohl<CR>
map <leader>nn :set nonumber<CR>
map <leader>q :quit<CR>
map <leader>qa :quitall<CR>
nmap Q :q<CR>
nmap QA :qa<CR>

" tselectfiles settings
nmap <leader>o :TSelectFilesInSubdirs<CR>
nmap <leader>O :TSelectFiles<CR>

" format xml file
map <leader>f :%s/></>\r</g<CR>gg=G

function! DelTagOfFile(file)
    let fullpath = a:file
    let cwd = getcwd()
    let tagfilename = cwd . "/tags"
    let f = substitute(fullpath, cwd . "/", "", "")
    let f = escape(f, './')
    let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
    let resp = system(cmd)
endfunction

function! UpdateTags()
    let f = expand("%:p")
    let cwd = getcwd()
    let tagfilename = cwd . "/tags"
    echo tagfilename
    if filereadable(tagfilename)
        call DelTagOfFile(f)
        let cmd = 'ctags -a -f ' . tagfilename . ' "' . f . '"'
    else
        let cmd = 'ctags -R'
    endif
    let resp = system(cmd)
endfunction

" completation
set completeopt=longest,menu,menuone,preview
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
let g:ycm_key_list_select_completion = ['<TAB>', '<Enter>', 'Down']
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:UltiSnipsExpandTrigger="<c-e>"

" for ptyhon
autocmd FileType python setlocal textwidth=80
autocmd BufNewFile *.py 0put =\"# -*- coding: utf-8 -*-\<nl>\"|$
let g:python_highlight_all = 1
let g:python_version_2 = 1

" for indent guides
let g:indent_guides_enable_on_vim_startup = 1  " 默认关闭
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 1  " 从第二层开始可视化显示缩进

" let tagbar support proto
let g:tagbar_type_proto= {
    \ 'ctagstype' : 'proto',
    \ 'kinds'     : [
        \ 'i:imports:1:0',
        \ 'p:package:0:0',
        \ 'm:message:0:1',
        \ 'e:enum:0:1',
        \ 'f:field:1:0',
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope': {
    \ },
    \ 'scope2kind': {
    \ }
\ }
inoremap jk <esc>
"set cursorline
"set mouse=a
"Set line space
set linespace=20
nnoremap <leader>j :bn<cr>
nnoremap <leader>k :bp<cr>
