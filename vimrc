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
se nowrap
se bsk=/tmp/*,/private/tmp/*

" my autocmds
" {{{ my autocmds
if has("autocmd")
    " save cursor position
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     exe "normal g`\"" |
        \ endif
endif
" }}}


" keymaps
" {{{ keymaps
if &diff
    map <Leader>1 :diffget LOCAL<CR>
    map <Leader>2 :diffget BASE<CR>
    map <Leader>3 :diffget REMOTE<CR>
endif
" }}}


" plugins
" {{{ plugins
call plug#begin('~/.vim/plugged')


    " encoding
    "source $VIM/encode.vim


    " syntax & format
    " {{{ syntax & format
    syn on
    au BufNewFile,BufReadPost *.md setl filetype=markdown
    Plug 'derekwyatt/vim-scala', {'for': 'scala'}
    Plug 'derekwyatt/vim-sbt', {'for': 'sbt'}
    Plug 'slim-template/vim-slim', {'for': 'slim'}
    au BufNewFile,BufReadPost *.rb setl sw=2 et
    Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}
    Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
    au BufNewFile,BufReadPost *.coffee setl sw=2 et
    Plug 'rodjek/vim-puppet', {'for': 'puppet'}
    Plug 'hhvm/vim-hack'
    au BufNewFile,BufReadPost Routefile setl filetype=ruby
    Plug 'wting/rust.vim', {'for': 'rust'}

    Plug 'scrooloose/syntastic'
    let g:syntastic_java_javac_options="-J-Dfile.encoding=UTF-8 -Xlint"
    " }}}


    " colorscheme
    " "{{{ colorscheme
    Plug 'desert256.vim'
    Plug 'tomasr/molokai'
    Plug 'altercation/vim-colors-solarized'
    Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
    Plug 'akiomik/itermcolors-vim'
    "set background=dark
    "colorscheme solarized
    "}}}


    " powerline
    " {{{ powerline
    Plug 'Lokaltog/vim-powerline'
    set guifont=Inconsolata\ for\ Powerline
    let g:Powerline_symbols = 'fancy'
    se ls=2
    se nosmd
    "Plug 'bling/vim-airline'
    " }}}


    " tab
    " {{{ tab
    Plug 'minibufexpl.vim'
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplMapWindowNavArrows = 1
    let g:miniBufExplMapCTabSwitchBuffs = 1
    nmap <C-n> :MBEbn<CR>
    nmap <C-p> :MBEbp<CR>
    "nmap <C-d> :bd<CR>
    " }}}


    " filer
    " {{{ filer
    Plug 'scrooloose/nerdtree'
    let g:NERDTreeDirArrows=0
    autocmd vimenter * if !argc() | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

    Plug 'Shougo/unite.vim'
    Plug 'Shougo/vimfiler.vim'
    let g:vimfiler_as_default_explorer = 1

    Plug 'kien/ctrlp.vim'
    " }}}


    " formatter
    " {{{ formatter
    " run :SQLUFormatter on vim??
    Plug 'SQLUtilities'

    Plug 'junegunn/vim-easy-align'
    " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    vmap <Enter> <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

    Plug 'tomtom/tcomment_vim'
    " }}}


    " vimshell
    " {{{ vimshell
    Plug 'Shougo/vimshell'
    command! Scala :VimShellInteractive scala
    command! Sbt :VimShellInteractive sbt
    " }}}


    " indent
    " {{{ indent
    Plug 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_start_level=2
    let g:indent_guides_guide_size=0
    let g:indent_guides_auto_colors=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
    " }}}


    " tagbar
    " {{{ tagbar
    Plug 'majutsushi/tagbar'
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
    " }}}


    " text objects
    " {{{
    Plug 'tpope/vim-surround'
    " }}}


    " motions
    " {{{ motions
    Plug 'Lokaltog/vim-easymotion'
    Plug 'kana/vim-smartword'
    " }}}


    " multiple cursor
    Plug 'terryma/vim-multiple-cursors'

    " over
    Plug 'osyo-manga/vim-over'


    " git
    " {{{ git
    Plug 'akiomik/git-gutter-vim'
    Plug 'tpope/vim-fugitive'
    " }}}


call plug#end()
" }}}

" colorscheme
" {{{ colorscheme
set t_Co=256
colorscheme molokai
" }}}
