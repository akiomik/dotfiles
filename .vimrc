" general settings
se nu
se sw=4
se ts=4
se sc
se si
se hls
se is
se title
se et
se nf-=octal
se ruler
se sm
se bs=2
se cul
se sta
se fdm=marker

" my autocmds
if has("autocmd")
    " save cursor position
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     exe "normal g`\"" |
        \ endif
endif


" keymap
if &diff
    map <Leader>1 :diffget LOCAL<CR>
    map <Leader>2 :diffget BASE<CR>
    map <Leader>3 :diffget REMOTE<CR>
endif


" NeoBundle
" $ mkdir -p ~/.vim/bundle
" $ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
" run :NeobundleInstall on vim
se nocp                       " Be iMproved
filetype off                  " Required!

if has('vim_starting')
    se runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim' " Let NeoBundle manage NeoBundle

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'


" encoding
"source $VIM/encode.vim


" syntax
syn on
NeoBundle 'derekwyatt/vim-scala.git'
au BufNewFile,BufReadPost *.scala setl filetype=scala

" colorscheme
NeoBundle 'desert256.vim'
NeoBundle 'molokai'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
NeoBundle 'akiomik/itermcolors-vim'
set t_Co=256
colorscheme molokai
"set background=dark
"colorscheme solarized

" powerline
NeoBundle 'Lokaltog/vim-powerline'
set guifont=Inconsolata\ for\ Powerline
let g:Powerline_symbols = 'fancy'
se ls=2
se nosmd

" SQLUtilities
" run :SQLUFormatter on vim??
NeoBundle 'Align'
NeoBundle 'SQLUtilities'

" Vimshell
NeoBundle 'Shougo/vimshell'
command! Scala :VimShellInteractive scala
command! Sbt :VimShellInteractive sbt

" git-gutter
NeoBundle 'akiomik/git-gutter-vim'

" fugitive
NeoBundle 'tpope/vim-fugitive'

" minibufexplorer
NeoBundle 'minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1
nmap <C-n> :MBEbn<CR>
nmap <C-p> :MBEbp<CR>
"nmap <C-d> :bd<CR>

" nerdtree
NeoBundle 'scrooloose/nerdtree'
let g:NERDTreeDirArrows=0
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" vimfiler
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer = 1

" coffee
NeoBundle 'kchmck/vim-coffee-script'
au BufNewFile,BufReadPost *.coffee setl filetype=coffee
au BufNewFile,BufReadPost *.coffee setl sw=2 et

" puppet
NeoBundle 'rodjek/vim-puppet'
au BufNewFile,BufReadPost *.pp setl filetype=puppet

" syntastic
NeoBundle 'scrooloose/syntastic'
let g:syntastic_java_javac_options="-J-Dfile.encoding=UTF-8 -Xlint"

" comment
NeoBundle 'tomtom/tcomment_vim'

" ctrlp
NeoBundle 'kien/ctrlp.vim'

" indent
NeoBundle 'nathanaelkane/vim-indent-guides'

" tagbar
NeoBundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

" scss
NeoBundle 'cakebaker/scss-syntax.vim'

" surround
NeoBundle 'tpope/vim-surround'

" easymotion
NeoBundle 'Lokaltog/vim-easymotion'

filetype plugin indent on
NeoBundleCheck
