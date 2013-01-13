" general settings
se nu
se sw=4
se ts=4
se sc
se si
se hls
se is
se title


" my autocmds
if has("autocmd")
	" no expand tab file types
	autocmd FileType make set noet
	autocmd BufEnter *.tsv set noet

	" save cursor position
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\     exe "normal g`\"" |
		\ endif
endif


" NeoBundle
" $ mkdir -p ~/.vim/bundle
" $ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
" run :NeobundleInstall on vim
se nocompatible               " Be iMproved
filetype off                  " Required!

if has('vim_starting')
	se runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))


" syntax
syn on
NeoBundle 'derekwyatt/vim-scala.git'


" colorscheme
NeoBundle 'desert256.vim'
NeoBundle 'molokai'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'ootoovak/vim-tomorrow-night'
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
