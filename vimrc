if has("gui_running")
  " vim's plugins
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'ntpeters/vim-better-whitespace'
  Plugin 'bling/vim-airline'
  Plugin 'tomtom/tcomment_vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'kien/ctrlp.vim'
  Plugin 'mileszs/ack.vim'
  Plugin 'scrooloose/syntastic'

  " sntax plugins
  Plugin 'fatih/vim-go'
  Plugin 'voithos/vim-python-syntax'
  Plugin 'Valloric/YouCompleteMe'

  call vundle#end()

  " disable error beep
  set noeb vb t_vb=
  " set default window's size
  set lines=75 columns=120

  " deactivate menubar, toolbar and scrollbar
  set guioptions-=m  "menu bar
  set guioptions-=T  "toolbar
  set guioptions-=r  "right scrollbar
  set guioptions-=L  "left scrollbar

  " fushar's setting
  set nocp noet ai cin bs=2 cb=unnamed
  set number ruler autoread showcmd showmode fdm=marker nobackup
  syntax on

  " filetype on
  filetype plugin indent on

  " startup programs
  let g:nerdtree_tabs_open_on_gui_startup=0

  " enable auto update vim tags
  let g:ycm_collect_identifiers_from_tags_files=1
  let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
  let g:ycm_python_binary_path='python'

  " set vim appearance
  let base16colorspace=256
  set background=dark
  colorscheme hybrid
  set guifont=Inconsolata-g\ for\ Powerline:h10
  set guicursor=n-v-c-i:block-Cursor
  highlight Cursor guifg=black guibg=grey
  highlight iCursor guifg=black guibg=darkgrey

  " set tags
  set tags=./tags,tags;
  let Tlist_Use_Right_Window=1

  " syntax options
  set hlsearch
  set ignorecase
  set incsearch
  " default indent for unknown file
  set shiftwidth=2
  set tabstop=2
  set smarttab
  set expandtab
  autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
  autocmd FileType python setlocal shiftwidth=4 tabstop=4
  autocmd FileType go setlocal shiftwidth=8 tabstop=8

  " set folding type
  set foldmethod=manual
  set foldlevel=1

  " air line
  set laststatus=2
  let g:airline_powerline_fonts=1
  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#tabline#fnamemod=':t'

  " paste the last yanked characters in registry
  vnoremap m "_d"0P

  " ctrl-p config
  let g:ctrlp_working_path_mode='ra'

  " get rid trailing whitespace
  autocmd FileType javascript,c,cpp,java,python,html,css,php,coffe,xml,yml autocmd BufWritePre <buffer> StripWhitespace

  " syntastic configuration
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list=1
  let g:syntastic_auto_loc_list=1
  let g:syntastic_check_on_open=1
  let g:syntastic_check_on_wq=1
  let g:syntastic_enable_baloons=1

  " set indentation shortcut
  nnoremap <S-tab> <
  nnoremap <tab> >
  vnoremap <S-tab> <
  vnoremap <tab> >

  " navigation through split windows
  map <C-q> <C-W>q
  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-h> <C-W>h
  map <C-l> <C-W>l
  map <C-x> <C-w>x

  " navigation through power tab
  map <C-tab> :bnext<CR>
  map <C-S-tab> :bprev<CR>

  " Key Binding
  let mapleader=","
  nnoremap ; :
  inoremap kj <ESC>:w<CR>
  inoremap <C-BS> <C-W>
  nnoremap <leader>a :Ack
  nnoremap <leader>A za
  nnoremap <leader>l :NERDTreeToggle<CR>
  nnoremap <leader>f <CR><ESC>/
  vnoremap <leader>F zf
  nnoremap <leader>r :%s/
  nnoremap <leader>b :YcmCompleter GoToDefinition<CR>
  nnoremap <leader>t :TlistToggle<CR>
  inoremap <leader>t <ESC>:TlistToggle<CR>
  nnoremap <leader>z <c-r>
  nnoremap <ESC> :noh<CR><ESC>
  nnoremap tt 81\|i<CR>
  nnoremap sa <s-v>G
  nnoremap <leader>w :Bclose<CR>
  " inoremap II <Esc>I
  " inoremap AA <Esc>A
  " inoremap OO <Esc>O
  " inoremap SS <Esc>S
  " inoremap DD <Esc>ddi
  " inoremap UU <Esc>u<CR>i

  " Commenting line Key Binding
  nnoremap <leader>c :TComment<CR>
  vnoremap <leader>c :TComment<CR>
  nnoremap <leader>C :TCommentBlock<CR>
  vnoremap <leader>C :TCommentBlock<CR>
endif
