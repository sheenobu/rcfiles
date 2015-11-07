" Modeline and Notes {

" }
" Environment {
      " Basics {
            set nocompatible         " must be first line
      " }
      " Vundle {
            filetype off                  " required

            " set the runtime path to include Vundle and initialize
            set rtp+=~/.vim/bundle/Vundle.vim
            call vundle#begin()
            " alternatively, pass a path where Vundle should install plugins
            "call vundle#begin('~/some/path/here')

            " let Vundle manage Vundle, required
            Plugin 'VundleVim/Vundle.vim'

            " Go support
            Plugin 'fatih/vim-go'

            Plugin 'tpope/vim-fugitive'

            Plugin 'scrooloose/nerdtree'

            " All of your Plugins must be added before the following line
            call vundle#end()            " required
            filetype plugin indent on    " required
            " To ignore plugin indent changes, instead use:
            "filetype plugin on
            "
            " Brief help
            " :PluginList       - lists configured plugins
            " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
            " :PluginSearch foo - searches for foo; append `!` to refresh local cache
            " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
            "
            " see :h vundle for more details or wiki for FAQ
            " Put your non-Plugin stuff after this line
      " }
" }

" General {
      syntax on
      "set mouse=a

      scriptencoding utf-8

      set nospell
      set history=1000
      set viewoptions=folds,options,cursor,unix,slash
      set virtualedit=onemore

      " Setting up directories {
      "     set backup 
            set undofile
            set undolevels=1000
            set undoreload=1000
      " }
" }

" Vim UI {
      color zellner
      set background=dark
      set tabpagemax=15
      set showmode

      set cursorline
      hi cursorline guibg=#333333
      hi CursorColumn guibg=#333333

      if has('cmdline_info')
            set ruler
            set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
            set showcmd
      endif


      if has('statusline')
              set laststatus=2

            " Broken down into easily includeable segments
            set statusline=%<%f\    " Filename
            set statusline+=%w%h%m%r " Options
            set statusline+=%{fugitive#statusline()} "  Git Hotness
            set statusline+=\ [%{&ff}/%Y]            " filetype
            set statusline+=\ [%{getcwd()}]          " current dir
            "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
            set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
      endif

      set backspace=indent,eol,start      " backspace for dummys
      set linespace=0                              " No extra spaces between rows
      set nu                                          " Line numbers on
      set showmatch                              " show matching brackets/parenthesis
      set incsearch                              " find as you type search
      set hlsearch                              " highlight search terms
      set winminheight=0                        " windows can be 0 line high 
      set ignorecase                              " case insensitive search
      set smartcase                              " case sensitive when uc present
      set wildmenu                              " show list instead of just completing
      set wildmode=list:longest,full      " command <Tab> completion, list matches, then longest common part, then all.
      set whichwrap=b,s,h,l,<,>,[,]      " backspace and cursor keys wrap to
      set scrolljump=5                         " lines to scroll when cursor leaves screen
      set scrolloff=3                         " minimum lines to keep above and below cursor
      set foldenable                          " auto fold code
      set gdefault                              " the /g flag on :s substitutions by default

      set nolist
" }
"
"
"Formatting {
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
" }

"Keybindings {
	nnoremap <F5> "=strftime("%c")<CR>P
	inoremap <F5> <C-R>=strftime("%c")<CR>

	nnoremap <F7> "=strftime("%c")<CR>P
	inoremap <F7> <C-R>=strftime("%c")<CR>
" }

"Copy + Paste {
	" Copy to X CLIPBOARD
	map <leader>cc :w !xsel -i -b<CR>
	map <leader>cp :w !xsel -i -p<CR>
	map <leader>cs :w !xsel -i -s<CR>
	" Paste from X CLIPBOARD
	map <leader>pp :r!xsel -p<CR>
	map <leader>ps :r!xsel -s<CR>
	map <leader>pb :r!xsel -b<CR>
" }

" Plugins {
"    NerdTree {
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
        map <C-n> :NERDTreeToggle<CR>
        let g:NERDTreeDirArrows = 1
        let g:NERDTreeDirArrowExpandable = '▸'
        let g:NERDTreeDirArrowCollapsible = '▾'
    " }
" }
