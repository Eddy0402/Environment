" NeoBundle Scripts-----------------------------
    if has('vim_starting')
      if &compatible
        set nocompatible               " Be iMproved
      endif
      " Required:
      set runtimepath+=/home/eddy/.vim/bundle/neobundle.vim/
    endif
    " Required:
    call neobundle#begin(expand('/home/eddy/.vim/bundle'))
    " Let NeoBundle manage NeoBundle
    " Required:
    NeoBundleFetch 'Shougo/neobundle.vim'
    " Add or remove Bundles here:
        NeoBundle 'jistr/vim-nerdtree-tabs'
        NeoBundle 'scrooloose/nerdtree'
        NeoBundle 'airblade/vim-gitgutter'
        NeoBundle 'bling/vim-airline'
        NeoBundle 'taglist.vim'
        NeoBundle 'tpope/vim-fugitive'

        NeoBundle 'Valloric/YouCompleteMe'
        NeoBundle 'jiangmiao/auto-pairs'

        "NeoBundle 'Rip-Rip/clang_complete'
        "NeoBundle 'Shougo/neocomplcache.vim'
        "Bundle 'vim-scripts/Syntastic'

        "Bundle 'jQuery'
        "Bundle 'Better-Javascript-Indentation'
        "Bundle 'hail2u/vim-css3-syntax'
        "Bundle 'othree/html5.vim'
        "Bundle 'skammer/vim-css-color'
    " You can specify revision/branch/tag.
    NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
    " Required:
    call neobundle#end()
    " Required:
    filetype plugin indent on
    " If there are uninstalled bundles found on startup,
    " this will conveniently prompt you to install them.
    NeoBundleCheck
" End NeoBundle Scripts-------------------------

" Persistent settings
    syntax on
    set fileencodings=ucs-bom,utf-8,big5,gbk,latin1 " File encoding fallback
    let OS = substitute( system( 'uname'  ), "\n", "", "" )

    augroup resCur " Save cursor position
        autocmd!
        autocmd BufReadPost * call setpos(".", getpos("'\""))
    augroup END

    " Fixme: make airline don't lose color when write to ~/.vimrc
"    augroup MyAutoCmd
"        autocmd!
"        autocmd MyAutoCmd BufWritePost ~/.vimrc nested source ~/.vimrc
"    augroup END

" gitgutter
    let g:gitgutter_realtime = 100

" Airline
    " Enable the list of buffers
    let g:airline#extensions#tabline#enabled = 1
    " Show just the filename
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline_powerline_fonts = 1
    let g:airline_section_a = airline#section#create_left(['filetype','mode'])
    let g:airline_section_b = airline#section#create_left(['ffenc',"%f"])
    let g:airline_section_c = airline#section#create_left([''])
    let g:airline_section_x = airline#section#create_right([''])
    let g:airline_section_y = airline#section#create_right(['0x%2B','%3l:%3c','%P'])
    let g:airline_section_z = airline#section#create_right(['filetype'])
    call airline#parts#define_accent('w', 'yellow')

    set laststatus=2

" NERDTree
    nnoremap ! :NERDTreeToggle <CR>
    " Automatically open NERDTree if no file were specified or not input from
    " stdin
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    let NERDTreeMapActivateNode='j'
    let NERDTreeMapOpenRecursively="J"

" TList
    nnoremap @ :TlistToggle <CR>

" File Type settings
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType c setlocal omnifunc=clang_complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd Filetype gitcommit setlocal spell textwidth=80
    autocmd Filetype md setlocal filetype=markdown

    au BufRead,BufNewFile *.html set shiftwidth=2
    au BufRead,BufNewFile *.html set tabstop=2
    au BufRead,BufNewFile *.md set filetype=markdown

" YouCompleteMe
    let g:ycm_min_num_of_chars_for_completion = 1
    let g:ycm_error_symbol = ">"
    let g:ycm_warning_symbol = "?"
    let g:ycm_complete_in_comments = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_collect_identifiers_from_tags_files = 1
    " Annoying default startup confirm...
    let g:ycm_confirm_extra_conf = 0
    " Filepath complete use working directory
    let g:ycm_filepath_completion_use_working_dir = 1

" Auto-pairs
    let g:AutoPairsFlyMode = 1


" Editor settings
    set smartindent
    set number
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set cmdheight=1
    set cino=N-s
    set wildmenu
    set backspace=eol,start,indent
    set lazyredraw
    set smarttab
    set cino+=(0

    cmap w!! w !sudo tee > /dev/null %

    " Leader Key Related
    set timeoutlen=1000 " Leader timeout time
    nnoremap <Leader>q :qa!<CR>
    nnoremap <Leader>v :e ~/.vimrc
    nnoremap <Leader>q :bp <BAR> bd #<CR>
    nnoremap <Leader>V :source ~/.vimrc<CR>
    " Copy from X11 clipboard
    vnoremap <Leader>y "+y
    " Paste from X11 clipboard
    nnoremap <Leader>p "+p
    inoremap <Leader><ESC> <ESC>A

    " Visual mode pressing * or # searches for the current selection
    " " Super useful! From an idea by Michael Naumann
    vnoremap <silent> * :call VisualSelection('f')<CR>
    vnoremap <silent> # :call VisualSelection('b')<CR>"

    noremap <Leader>1 :b1<CR>
    noremap <Leader>2 :b2<CR>
    noremap <Leader>3 :b3<CR>
    noremap <Leader>4 :b4<CR>
    noremap <Leader>5 :b5<CR>
    noremap <Leader>6 :b6<CR>
    noremap <Leader>7 :b7<CR>
    noremap <Leader>8 :b8<CR>
    noremap <Leader>9 :b9<CR>

    " A try to use rare key-sequence to exit insert mode
    inoremap jf <Esc>
    inoremap fj <Esc>

    " Cursor movement
    vmap k <Left>
    nmap k <Left>
    vmap ; <Right>
    nmap ; <Right>
    vmap l <Down>
    nmap l <Down>
    vmap o <Up>
    nmap o <Up>

    " Cursor movement faster
    vmap K <Home>
    nmap K <Home>
    vmap L 6<Down>
    nmap L 6<Down>
    vmap O 6<Up>
    nmap O 6<Up>
    nnoremap : <End>
    vnoremap : <End>

    " Replace O with J
    nnoremap J<Space> O
    nnoremap JJ O<Esc>
    nnoremap j<Space> o
    nnoremap jj o<Esc>

    " Space to enter command mode
    nnoremap <Space> :

    " Window switch
    nnoremap <Leader>o :wincmd k <CR>
    nnoremap <Leader>l  :wincmd j <CR>
    nnoremap <Leader>k :wincmd h <CR>
    nnoremap <Leader>; :wincmd l <CR>
    nnoremap <c-Up> :wincmd k <CR>
    nnoremap <c-Down>  :wincmd j <CR>
    nnoremap <c-Left> :wincmd l <CR>
    nnoremap <c-Right> :wincmd h <CR>

    " Buffer switch
    set hidden
    nnoremap <c-O> :enew<CR>
    nnoremap <c-L> :bnext<CR>
    nnoremap <c-K> :bprevious<CR>
    nnoremap <Leader>j :bnext<CR>
    nnoremap <Leader>f :bprevious<CR>

    " Single key delete
    nmap - dd

    map<tab> v>
    map<s-tab> v<

" Style settings
    colorscheme elflord
    set t_Co=256
    set cursorline
    set cursorcolumn
    set list
    set listchars=tab:»\ ,trail:-,extends:>,precedes:<
    highlight CursorColumn cterm=NONE ctermbg=237 ctermfg=NONE
    highlight CursorLine cterm=NONE ctermbg=237 ctermfg=NONE
    highlight LineNr cterm=NONE ctermfg=DarkGrey ctermbg=NONE
    highlight CursorLineNr cterm=NONE ctermfg=DarkGrey ctermbg=NONE
    highlight SpecialKey ctermfg=9
    highlight SignColumn cterm=NONE ctermbg=234 ctermfg=5
    highlight GitGutterAdd cterm=NONE ctermbg=234 ctermfg=1
    highlight GitGutterChange cterm=NONE ctermbg=234 ctermfg=2
    highlight GitGutterDelete cterm=NONE ctermbg=234 ctermfg=3
    highlight GitGutterChangeDelete cterm=NONE ctermbg=234 ctermfg=4
    highlight OverLength ctermbg=239 ctermfg=white
    highlight YcmErrorSign ctermbg=242 ctermfg=black
    highlight YcmWarningSign ctermbg=231 ctermfg=black
    highlight YcmErrorLine ctermbg=242 ctermfg=black
    highlight YcmWarningLine ctermbg=231 ctermfg=black
    highlight YcmErrorSection ctermbg=242 ctermfg=black
    highlight YcmWarningSection ctermbg=231 ctermfg=black

    match OverLength /\%81v.\+/

" Helper functions
    function! ShowSpaces(...)
      let @/='\v(\s+$)|( +\ze\t)'
      let oldhlsearch=&hlsearch
      if !a:0
        let &hlsearch=!&hlsearch
      else
        let &hlsearch=a:1
      end
      return oldhlsearch
    endfunction

    function! TrimSpaces()
        :%s/\s\+$//
    endfunction

    function! Checkspell()
        echo "set spell"
        "Action                       Shortcut
        "next spelling                ]s
        "previous spelling            [s
        "spelling suggestions 	      z=
        "spelling good, add           zg
        "spelling good, session       zG
        "spelling wrong, add          zw
        "spelling wrong, session      zW
        "spelling repeat all in file  :spellr
    endfunction

    function! GenCtags()
        !ctags -R --fields=+l
    endfunction
