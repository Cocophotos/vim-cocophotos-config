" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" To update : 
" vim +BundleInstall! +BundleClean +q

" Shortcut sheet
" --------------
" leader : ,
" localleader : -
"
" NERDTree
" --------
" Ctrl+e : Toggle Nerdtree
" leader+e : Nerdtree find function
"
" Tagbar
" --------
"  leader+tt : Toggle tagbar
" 
" Gundo
" --------
"  leader+g : Toggle Gundo plugin
"
" Ctrlp
" ------
" Ctrl+p : toggle ctrlp
"
" BufExplorer
" ---------
"  leader+bv : buffers vertically opened
"
"  Vim-CMake
"  ---------
"  run :CMake it should work



"Environment {

    "Basics {
        set nocompatible        
    "}
    
    
    "Bundle {
    "Ensure that vundle works
        filetype off
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
    "}

"}

" Bundles {
    " Deps
        Bundle 'gmarik/Vundle.vim'
        if executable('ack')
            Bundle 'mileszs/ack.vim'
        endif

        if !exists('g:cocophotos_bundle_groups')
            let g:cocophotos_bundle_groups=['general', 'programming', 'web', 'latex']
        endif

        " General
        if count(g:cocophotos_bundle_groups, 'general')
            Bundle 'scrooloose/nerdtree'
            Bundle 'matchit.zip'
            Bundle 'Lokaltog/vim-powerline'
            Bundle 'Lokaltog/vim-easymotion'
            Bundle 'kien/ctrlp.vim'
            Bundle 'altercation/vim-colors-solarized'
            
            "Dependencies of vim-snipmate
            "Bundle 'MarcWeber/vim-addon-mw-utils'
            "Bundle 'tomtom/tlib_vim'
            "Bundle 'garbas/vim-snipmate'
            
            Bundle 'sirver/ultisnips'
            Bundle 'honza/vim-snippets'

            "Buffers on steroids
            Bundle 'jlanzarotta/bufexplorer'

            "Run an interactive program inside Vim (like bash)
            Bundle 'basepi/vim-conque'

            Bundle 'chrisbra/csv.vim'

            Bundle 'tpope/vim-surround'
        endif

    " General Programming
        if count(g:cocophotos_bundle_groups, 'programming')
            Bundle 'tpope/vim-fugitive'
            if executable('ctags')
                Bundle 'majutsushi/tagbar'
            endif
            
            "Bundle 'Shougo/neocomplcache'
            Bundle 'Valloric/YouCompleteMe'
            
            Bundle 'vim-perl/vim-perl'
            Bundle 'rainux/vim-vala'
            "View undo tree in Vim
            Bundle 'sjl/gundo.vim'
            "View color parentheses when they are mingled
            Bundle 'kien/rainbow_parentheses.vim'
            
            Bundle 'ervandew/supertab'

            " Allow fast tabularization of input
            Bundle 'godlygeek/tabular'
            
            "Vim C++11 support
            Bundle 'vim-scripts/Cpp11-Syntax-Support'
            
            "Vim CMake support
            Bundle 'vhdirk/vim-cmake'
            
            "Indentation guide useful in Python for example
            Bundle 'Yggdroot/indentLine'
        endif

    "Web programming
        if count(g:cocophotos_bundle_groups, 'web')
            Bundle 'digitaltoad/vim-jade'
            Bundle 'groenewege/vim-less'
            Bundle 'pangloss/vim-javascript'
            Bundle 'elzr/vim-json'

            "TernJS better completion for javascript
            Bundle 'marijnh/tern_for_vim'
        endif

    "LaTeX
        if count(g:cocophotos_bundle_groups, 'latex')
            "Bundle 'git://git.code.sf.net/p/atp-vim/code'
            "Bundle 'LaTeX-Box-Team/LaTeX-Box'
            "Bundle 'vim-scripts/TeX-9'
        endif

    call vundle#end()
"}

" General {
    set encoding=utf-8 " Necessary to show Unicode glyphs
" }

" Vim UI {
    " Font
    set gfn=Liberation\ Mono\ Regular:h13
    " Color scheme
    
    set background=dark
    colorscheme solarized

    if !has('gui_running')
        let g:solarized_termcolors=256
    endif
    
    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\    " Filename
        set statusline+=%w%h%m%r " Options
        set statusline+=%{fugitive#statusline()} "  Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " filetype
        set statusline+=\ [%{getcwd()}]          " current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set nu                          " Line numbers on
    set showmatch                   " show matching brackets/parenthesis
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms
    set winminheight=0              " windows can be 0 line high
    set ignorecase                  " case insensitive search
    set smartcase                   " case sensitive when uc present
    set wildmenu                    " show list instead of just completing
    set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
    set scrolljump=5                " lines to scroll when cursor leaves screen
    set scrolloff=3                 " minimum lines to keep above and below cursor
    set foldenable                  " auto fold code
    syntax on                       " syntax highlighting always on
    "In case of large file > 10Mb, disable most of the command to speed up
    "editing:
    " Protect large files from sourcing and other overhead.
    if !exists("my_auto_commands_loaded")
        let my_auto_commands_loaded = 1
        " Large files are > 10M
        " Set options:
        " eventignore+=FileType (no syntax highlighting etc
        " assumes FileType always on)
        " noswapfile (save copy of file)
        " bufhidden=unload (save memory when other file is viewed)
        " undolevels=-1 (no undo possible)

        let g:LargeFile = 1024 * 1024 * 5
        augroup LargeFile
            autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload undolevels=-1 | else | set eventignore-=FileType | endif
        augroup END
    endif
    
    "set conceal level and cursor for easier interaction
    if has('conceal')
        set conceallevel=2
        set concealcursor=""
        
        let g:vim_json_syntax_concealcursor=""
        let g:indentLine_noConcealCursor=""
    endif

    "set clipboard=unnamedplus "Always save copy into system clipboard
    "vmap <C-c> "+yi
    "vmap <C-x> "+c
    "vmap <C-v> c<ESC>"+p
    "imap <C-v> <ESC>"+pa
" }

" Formatting {
    "set wrap                        "Auto wrapping
    "set textwidth=79
    "set formatoptions=qrn1
    set colorcolumn=85              "Highlight when you go further than 85 chars
    set autoindent                  " indent at the same level of the previous line
    set shiftwidth=4                " use indents of 4 spaces
    set expandtab                   " tabs are spaces, not tabs
    set tabstop=4                   " an indentation every four columns
    set softtabstop=4               " let backspace delete indent
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    set backspace=indent,eol,start  " use backspace like other apps"

    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
" }

" Key Mappings {
    "The default leader is '\', but many people prefer ',' as it's in a standard location
    let mapleader = ','
    let maplocalleader = '-'
    
    "Remap Esc to go out of Insert mode to jk
    inoremap jk <Esc>

    set switchbuf=useopen
    map <C-tab> :sbnext<CR>

    "Make search in regexpes normal (like Perl and Python)
    nnoremap / /\v
    vnoremap / /\v

    "Remap <tab> in command mode to switch between window    
    map <Tab> <C-W>W

    " Commenting blocks of code.
    autocmd FileType c,cpp,java,scala,javascript let b:comment_leader = '// '
    autocmd FileType sh,ruby,python      let b:comment_leader = '# '
    autocmd FileType conf,fstab          let b:comment_leader = '# '
    autocmd FileType tex                 let b:comment_leader = '% '
    autocmd FileType mail                let b:comment_leader = '> '
    autocmd FileType vim                 let b:comment_leader = '" '
    noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
    noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

    " Some tips worth having
    "{
    "Insert new line in NORMAL mode by pressing Enter
    nmap <CR> o<Esc>
    "}

" }

" Plugins {
    " NerdTree {
        map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.DS_Store']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
    " }

    " TagBar {
        let g:tagbar_autofocus = 1
        nnoremap <silent> <leader>tt :TagbarToggle<CR>
     "}

    " NeoComplCache {
        " Disable Autocompletion when moving cursor
        "let g:neocomplcache_enable_cursor_hold_i = 1

        " Shorten the completion list
        "let g:neocomplcache_max_list = 30

        " Start at startup
        "let g:neocomplcache_enable_at_startup = 1        
    " }

    " Syntastic {
        "Passive syntastic check for perl (because to slow)
        "let g:syntastic_mode_map = { 'mode': 'active',
        "                       \ 'active_filetypes': [],
        "                       \ 'passive_filetypes': ['perl', 'tex'] }
    " }
    
    " Automatic LaTeX Plugin {
        " This script has been uninstalled
        " Autocompletion with Tab and Shift+Tab
        "let g:atp_tab_map=0

        " Tex Options for using -shell-escape (and using numerous of plugin
        " such as minted
        "let b:atp_TexOptions = "-shell-escape,-synctex=1"

        " Tex Flavor
        "let b:atp_TexFlavor = "latex"

        " Redefine the leader for text formatting such as italic, emph, bold,
        " etc.
        "let g:atp_imap_leader_2 = "ii"

        " View via "open" map to vv
        "imap vv <Esc>:View<CR>i
        "map vv :View<CR> 

        " Disable autosaving via CursorHold(I)
        "let b:atp_updatetime_insert = 0 
        "let b:atp_updatetime_normal = 0

        " Use homemade script to compile LaTeX
        nmap <F7> :! makepdf.sh %:p 2 1<CR>
    " }

    " Latex {
        let g:tex_flavor = 'latex'
        " Remove conceal 
        let g:tex_conceal = ''
    " }
    
    " Tags built-in plugin {
        "set tags+=~/.vim/tags/stl
        set tags+=./tags;tags
    " }

        
    " Ultisnips playing nice with YCM {
        " make YCM compatible with UltiSnips (using supertab)
        let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
        let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
        let g:SuperTabDefaultCompletionType = '<C-n>'
        
        " better key bindings for UltiSnipsExpandTrigger
        let g:UltiSnipsExpandTrigger = "<tab>"
        let g:UltiSnipsJumpForwardTrigger = "<tab>"
        let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

        set ttimeoutlen=50  " for faster InsertLeave triggering
        
        " Disable for these filetypes:
        let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'markdown' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ 'mail' : 1,
            \ }
    "} 

    " YCM C++ {
        " launch echo | clang -std=c++11 -stdlib=libc++ -v -E -x c++ -
        " to see which path to include in .ycm_extra_conf.py
        let g:ycm_global_ycm_extra_conf = '~/.vim/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
    " }

    " YCM Tex {
    let g:ycm_semantic_triggers = {
            \  'tex'  : ['\ref{','\cite{'],
    \ }
    " }
    
    " Gundo Options {
        map <silent> <leader>g :GundoToggle<CR>
    " }
    
    " SuperTab Options {
    "    let g:SuperTabLongestEnhanced=1
    "    let g:SuperTabLongestHighlight=1
    " }

    " vim-json options {
        let g:vim_json_syntax_conceal = 0
    " }

    " vim-cpp11 options support {
        au BufNewFile,BufRead *.cpp set syntax=cpp11
    " }

    " indentline --> nothing to do for TeX file {
        let g:indentLine_fileTypeExclude = ['text', 'sh']
    "}
    
    " ctrlp {
    " }

    " CSV {
        au BufEnter *.csv if !exists('b:csv_arrange_leftalign') | let b:csv_arrange_leftalign = 1 | endif
    " }
    
    " Custom settings {
    map <Leader>jt !python -m json.tool<CR>
    " }
" }

" FileType {
    " Pour les fichiers .QML"
    augroup qml
        au! BufRead,BufNewFile *.qml   set filetype=qml
    augroup END

    " For Objective-J files
    augroup objj
	    au! BufRead,BufNewFile *.j set filetype=objj
    augroup END

    augroup tdl
        au BufRead,BufNewFile *.tdl set filetype=tdl
    augroup END

    "For OGRE rules file
    augroup grr
         au! BufNewFile,BufRead *.grr set filetype=grr
     augroup END

     "For Textile file
     augroup textile
         au! BufNewFile,BufRead *.tl,*.txtl,*.textitle set filetype=textile
     augroup END

    " For XML folding
    let g:xml_syntax_folding=1
    au FileType xml setlocal foldmethod=syntax

    "Turn filetype detection on
    filetype plugin indent on
"}
