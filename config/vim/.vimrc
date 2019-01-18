" Li Mingyi's ~/.vimrc
"
" Basic Settings -------------------------------------- {{{1
set nocompatible
syntax on
filetype indent on
filetype plugin on

" no backup
set nobackup
set nowritebackup
set noswapfile

" show line number
set number

" use space instead of tab
set tabstop=4
set shiftwidth=4
set textwidth=80
set expandtab

" show the border
set nowrap

" set indent
set autoindent
set smartindent
set cindent
set cinoptions=g0

set colorcolumn=81
set hidden
set hlsearch
set incsearch
set ruler
set showcmd
set title
set wildmenu
set wildmode=list:longest,list:full

set foldmethod=marker

" set smart case
set ignorecase
set smartcase

set list
set listchars=tab:>-,trail:-

" complete opts
set completeopt=menu,longest

" ignore files inside vcs dirs
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
" ignore object code files
set wildignore+=*.o,*.obj,*.a,*.so,*.d

set fileencodings=ucs-bom,utf8,cp936,gbk,big5,euc-jp,euc-kr,gb18130,latin1

set shell=/bin/bash

" Mouse Support --------------------------------------- {{{2
if has('mouse')
    set mouse=a
endif

" Fonts ----------------------------------------------- {{{2
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
set guifontwide=WenQuanYi\ Micro\ Hei\ Mono

" Vundle ---------------------------------------------- {{{1
" Install Vundle:
" git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
" Usage:
" :BundleList            - list configured bundles
" :BundleInstall         - install(update) bundles
" :BundleSearch          - search for plugins
" :BundleClean           - confirm removal of bundles
"
" see :h vundle for more details or wiki for FAQ

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'scrooloose/nerdtree'

Plugin 'Clam'
Plugin 'Conque-Shell'
Plugin 'DoxygenToolkit.vim'
Plugin 'Gundo'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/fonts'
Plugin 'godlygeek/tabular'

" Color Schemes
Plugin 'tomasr/molokai'

" Programming
"Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'mileszs/ack.vim'

" Color Schemes --------------------------------------- {{{1
if has("gui_running")
    "set background=dark
    colorscheme molokai

    set guioptions-=T
    "set guioptions-=m
    "set guioptions-=r
    "set guioptions-=L
else
    set t_Co=256
    set background=dark
    colorscheme molokai
endif

" Plugins --------------------------------------------- {{{1
" ack.vim, Ack front-end for vim ---------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2572
" https://github.com/mileszs/ack.vim/
" git clone git://github.com/mileszs/ack.vim.git
" https://github.com/ggreer/the_silver_searcher/
let g:ackprg = 'ag --nogroup --nocolor --column'

" Clam ------------------------------------------------ {{{2
" http://www.vim.org/scripts/script.php?script_id=4000
" https://github.com/sjl/clam.vim
" https://bitbucket.org/sjl/clam.vim/
" hg clone https://bitbucket.org/sjl/clam.vim
nnoremap <leader>c :Clam<Space>

" Cscope ---------------------------------------------- {{{2
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

set cscopequickfix=s-,c-,d-,i-,t-,e-

nnoremap <F3> :cp<CR>
nnoremap <F4> :cn<CR>

if has("cscope")  
  if filereadable("cscope.out")  
    cs add cscope.out  
  endif        
endif  

" CtrlP ----------------------------------------------- {{{2
" https://github.com/ctrlpvim/ctrlp
" git clone git://github.com/ctrlpvim/ctrlp.git

" enable cache for ctrlp
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" only search the filename and use regex
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1

" cancel the limit to max files number
let g:ctrlp_max_files = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

" Doxygen --------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="LiMingyi"

let g:DoxygenToolkit_briefTag_pre="@Synopsis"
let g:DoxygenToolkit_paramTag_pre="@Param:"
let g:DoxygenToolkit_paramTag_post=" - "
let g:DoxygenToolkit_returnTag="@Returns:"

" Gundo ----------------------------------------------- {{{2
" http://sjl.bitbucket.org/gundo.vim/
" hg clone https://bitbucket.org/sjl/gundo.vim
nnoremap <leader>u :GundoToggle<CR>

let g:gundo_right = 1
let g:gundo_prefer_python3 = 1

" NERDTree -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=1658
" http://github.com/scrooloose/nerdtree
" git clone git://github.com/scrooloose/nerdtree.git
nnoremap <leader>nt :NERDTreeToggle<CR>

let NERDTreeWinPos=1

" SuperTab -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=1643
" https://github.com/ervandew/supertab
" git clone git://github.com/ervandew/supertab.git
let g:SuperTabRetainCompletionType=1

" Tabular --------------------------------------------- {{{2
" http://github.com/godlikegeek/tabular
" git clone git://github.com/godlikegeek/tabular.git

" Tagbar ---------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3465
" http://github.com/majutsushi/tagbar
" git clone git://github.com/majutsushi/tagbar.git
nnoremap <leader>tb :TagbarToggle<CR>

let g:tagbar_left = 1
let g:tagbar_width = 40

" let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 0
let g:tagbar_autoshowtag = 1

" let tags sorted according to their order int source files
let g:tagbar_sort = 0

let g:tagbar_ctags_bin = '/usr/bin/ctags'

" let Tagbar start with vim
autocmd VimEnter * nested :TagbarOpen

" Ultisnips ------------------------------------------- {{{2
" SirVer/ultisnips
" https://github.com/SirVer/ultisnips
" git clone git://github.com/SirVer/ultisnips.git

" remap Ultisnips
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" YouCompleteMe --------------------------------------- {{{2
" https://github.com/Valloric/YouCompleteMe
" git clone git://github.com/Valloric/YouCompleteMe.git

" let g:ycm_global_ycm_extra_conf = '~/.vim/ycm/cpp/.ycm_extra_conf.py'
" enable completion from tags
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_key_invoke_completion = '<C-a>'

" not need confirm when load a config file
let g:ycm_confirm_extra_conf=0

" Vim-airline ----------------------------------------- {{{2
" https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline-themes
" git clone git://github.com/vim-airline/vim-airline.git
" git clone git://github.com/vim-airline/vim-airline-themes.git
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Make airlines appear all the time
set laststatus=2

" Commands, Mappings and Functions -------------------- {{{1
" Tags ------------------------------------------------ {{{2
set tags+=.tags;
set tags+=tags;
nnoremap <leader>gt :!ctags -R -f .tags<CR><CR>

" Find Conflict Marks --------------------------------- {{{2
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
