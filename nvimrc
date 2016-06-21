" vim:fdm=marker
"NeoBundle begin" {{{
if has('vim_starting')
 set nocompatible
 set runtimepath+=~/.nvim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.nvim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
"}}}

NeoBundle     'jeetsukumaran/vim-markology'
NeoBundle     'nonsense/tomorrow-night-vim-theme'
"NeoBundle    'honza/vim-snippets'
NeoBundle     'vim-scripts/JSON.vim'
"NeoBundle     'godlygeek/tabular'
"NeoBundle    'mileszs/ack.vim'
NeoBundle     'junegunn/vim-easy-align'
"NeoBundle     'tommcdo/vim-lion'
NeoBundle     'edkolev/tmuxline.vim'
NeoBundle    'Shougo/unite.vim'
NeoBundle    'editorconfig/editorconfig-vim'
NeoBundle    'scrooloose/syntastic'
"NeoBundle    'jaxbot/semantic-highlight'
NeoBundle    'scrooloose/nerdtree'
NeoBundle    'scrooloose/nerdcommenter'
NeoBundle    'fatih/vim-go'
NeoBundle    'bronson/vim-trailing-whitespace'
NeoBundle    'elmcast/elm-vim'

"NeoBundle    ''
"NeoBundle    ''

" NeoBundle end {{{

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"}}}

"Basic" {{{
  color Tomorrow-Night
  syntax on
  let mapleader = ","
  let maplocalleader = ","

  set nospell
  set history=1000
  set viewoptions=folds,options,cursor,unix,slash
  set virtualedit=onemore


  " Setting up directories {{{
  "     set backup
        set undofile
        set undolevels=1000
        set undoreload=1000
   "}}}

"}}}

"Formatting {{{
      set nowrap                           " wrap long lines
      set autoindent                       " indent at the same level of the previous line
      set shiftwidth=4                     " use indents of 4 spaces
      set tabstop=4                        " an indentation every four columns
      set softtabstop=4                    " let backspace delete indent
      "set matchpairs+=<:>                 " match, to be used with %
      set pastetoggle=<F12>                " pastetoggle (sane indentation on pastes)
      "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

      " Remove trailing whitespaces and ^M chars
      autocmd FileType c,cpp,go,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }}}

"Plugin specific" {{{
  "NerdTree" {{{
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	map <leader>nn :NERDTreeToggle<CR>
	map <leader>nf :NERDTreeFind<CR>
  "}}}
  "Numbers" {{{
	set number
  "}}}
  "Unite" {{{
	map <leader>u :Unite<CR>
  "}}}
  "Gista" {{{
	let g:gista#post_private = 1
  "}}}
  "Go" {{{
	let g:go_fmt_command = "goimports"
	let g:go_metalinter_autosave = 1
  "}}}
  "Whitespace" {{{
  "}}}
  "Elm" {{{
	let g:elm_detailed_complete = 1
	let g:elm_format_autosave = 1
	let g:elm_syntastic_show_warnings = 1
  "}}}
"}}}
