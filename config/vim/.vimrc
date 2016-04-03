" Li Mingyi's ~/.vimrc
" vim: fdm=marker
" Vundle ---------------------------------------------- {{{1
" Install Vundle:
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
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

Bundle 'gmarik/vundle'

Bundle 'taglist.vim'
Bundle 'The-NERD-tree'
" Bundle 'bufexplorer.zip'
Bundle 'SuperTab'

Bundle 'Clam'
Bundle 'Conque-Shell'
Bundle 'DoxygenToolkit.vim'
Bundle 'Gundo'
Bundle 'Tagbar'
""Bundle 'UltiSnips'

" Color Schemes
Bundle 'badwolf'
Bundle 'bensday'
Bundle 'bocau'
Bundle 'desertEx'
Bundle 'jammy.vim'

" C++
Bundle 'OmniCppComplete'

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

set cc=80
set hidden
set hlsearch
set incsearch
set ruler
set showcmd
set title
set wildmenu
set wildmode=list:longest,list:full

" Omni Complete
set ofu=syntaxcomplete#Complete

set fileencodings=ucs-bom,utf8,cp936,gbk,big5,euc-jp,euc-kr,gb18130,latin1

" Color Schemes --------------------------------------- {{{1
if has("gui_running")
    "set background=dark
    colorscheme jammy
else
    set t_Co=256
    set background=dark
    colorscheme bocau
endif

" Plugins --------------------------------------------- {{{1
" bufExplorer ----------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=42

" Clam ------------------------------------------------ {{{2
" http://www.vim.org/scripts/script.php?script_id=4000
" https://github.com/sjl/clam.vim
" https://bitbucket.org/sjl/clam.vim/
" hg clone https://bitbucket.org/sjl/clam.vim
nnoremap <leader>c :Clam<Space>

" Doxygen --------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="LiMingyi,laconism.LMY@gmail.com"

let g:DoxygenToolkit_briefTag_pre="@Synopsis"
let g:DoxygenToolkit_paramTag_pre="@Param:"
let g:DoxygenToolkit_paramTag_post=" - "
let g:DoxygenToolkit_returnTag="@Returns:"

" Gundo ----------------------------------------------- {{{2
" http://sjl.bitbucket.org/gundo.vim/
" hg clone https://bitbucket.org/sjl/gundo.vim
nnoremap <leader>u :GundoToggle<CR>

" OmniCppComplete ------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=1520
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1

let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteScope = 0

" SuperTab -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=1643
" https://github.com/ervandew/supertab
" #git clone git://github.com/ervandew/supertab.git
let g:SuperTabRetainCompletionType=1

" Tagbar ---------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3465
" http://github.com/majutsushi/tagbar
" git clone git://github.com/majutsushi/tagbar.git
nnoremap <leader>tb :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1

let g:tagbar_type_vala = {
  \ 'ctagstype': 'c#',
  \ 'kinds': [
    \ 'c:class',
    \ 'd:macro',
    \ 'E:event',
    \ 'g:enum',
    \ 'i:interface',
    \ 'm:method',
    \ 'n:namespace',
    \ 'p:properties',
    \ 's:struct',
  \ ]
\ }

" Commands, Mappings and Functions -------------------- {{{1
" Tags ------------------------------------------------ {{{2
set tags+=.tags;
set tags+=tags;
nnoremap <leader>gt :!ctags -R -f .tags<CR><CR>
