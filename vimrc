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

    " misc
    Plug 'Shougo/vimproc.vim', {'do': 'make'}

    " encoding
    "source $VIM/encode.vim


    " syntax & format
    " {{{ syntax & format
    syn on
    au BufNewFile,BufReadPost *.gradle setl filetype=groovy
    au BufNewFile,BufReadPost *.md setl filetype=markdown
    Plug 'derekwyatt/vim-scala', {'for': 'scala'}
    au BufNewFile,BufReadPost *.sbt setl filetype=scala
    Plug 'slim-template/vim-slim', {'for': 'slim'}
    Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}
    Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
    Plug 'rodjek/vim-puppet', {'for': 'puppet'}
    Plug 'hhvm/vim-hack'
    au BufNewFile,BufReadPost Routefile setl filetype=ruby
    Plug 'wting/rust.vim', {'for': 'rust'}
    Plug 'fatih/vim-go', {'for': 'go'}
    au BufNewFile,BufReadPost *.hbs setl filetype=handlebars
    Plug 'mustache/vim-mustache-handlebars', {'for': 'handlebars'}
    let g:haskell_conceal = 0
    let g:haskell_folds = 0
    let g:haskell_indent = 0
    let g:haskell_shqq = 0
    let g:haskell_rlangqq = 0
    Plug 'akiomik/vim2hs', {'for': 'haskell'}
    Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
    Plug 'othree/yajs.vim', {'for': 'javascript'}
    Plug 'leafgarland/typescript-vim'

    Plug 'scrooloose/syntastic'
    let g:syntastic_java_javac_options="-J-Dfile.encoding=UTF-8 -Xlint"
    let g:loaded_syntastic_haskell_ghc_mod_checker = 0
    let g:syntastic_scala_checkers = ['fsc']
    " set statusline+=%#warningmsg#
    " set statusline+=%{SyntasticStatuslineFlag()}
    " set statusline+=%*
    " let g:syntastic_always_populate_loc_list = 1
    " let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_ignore_files = ['\m\c\.h$', '\m\.sbt$']
    " }}}


    " colorscheme
    " {{{ colorscheme
    Plug 'w0ng/vim-hybrid'
    Plug 'cocopon/lightline-hybrid.vim'
    let g:hybrid_custom_term_colors = 1
    " }}}


    " powerline
    " {{{ powerline
    Plug 'itchyny/lightline.vim'
    let g:lightline = {
          \ 'colorscheme': 'hybrid',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
          \ },
          \ 'component_function': {
          \   'gitbranch': 'fugitive#head'
          \ },
    \ }
    se ls=2
    se nosmd
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
    Plug 'kana/vim-filetype-haskell', {'for': 'haskell'}
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
    Plug 'tpope/vim-fugitive' " for lightline
    " }}}


call plug#end()
" }}}


" colorscheme
" {{{ colorscheme
se t_Co=256
se bg=dark
colorscheme hybrid
" }}}


" completion
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
