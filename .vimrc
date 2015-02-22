" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" To update : 
" vim +PluginInstall! +PluginClean +q

" Shortcut sheet
" --------------
" leader : ,
" localleader : -
"
" Tagbar
" --------
"  leader+tt : Toggle tagbar
" 
" Gundo
" --------
"  leader+g : Toggle Gundo plugin
"
"  Vim-CMake
"  ---------
"  run :CMake it should work
"
"  Unite
"  --------
"  leader+un



"Environment {

    "Basics {
        set nocompatible
        "Ensure a POSIX-compliant SHELL so that Vundle will run properly
        if $SHELL =~ 'bin/fish'
            set shell=/bin/bash
        endif
    "}
    
    
    "Plugin {
    "Ensure that vundle works
        filetype off
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
    "}

"}

" Plugins {
    " Deps
        Plugin 'gmarik/Vundle.vim'

        if executable('ack')
            Plugin 'mileszs/ack.vim'
        endif

        if !exists('g:cocophotos_bundle_groups')
            let g:cocophotos_bundle_groups=['general', 'textobj', 'programming', 'web', 'latex', 'spelling']
        endif

        " General
        if count(g:cocophotos_bundle_groups, 'general')
            Plugin 'matchit.zip'
            Plugin 'Lokaltog/vim-powerline'
            Plugin 'Lokaltog/vim-easymotion'
            Plugin 'altercation/vim-colors-solarized'
            
            Plugin 'sirver/ultisnips'
            Plugin 'honza/vim-snippets'
            Plugin 'chrisbra/csv.vim'
            Plugin 'tpope/vim-surround'

            "Allow ANSI color code in Vim (through conceal features)
            Plugin 'powerman/vim-plugin-AnsiEsc'

            "Allow fish shell syntax
            Plugin 'dag/vim-fish'

            "Powerfull Vim SHELL (in pure Vim Script)
            Plugin 'Shougo/vimshell.vim'
            Plugin 'Shougo/vimproc.vim'

            "Powerfull vim search capabilities (basically replacing
            "bufexplorer, nerdtree, ctrlp...
            "file_mru needs neomru
            Plugin 'Shougo/neomru.vim'
            Plugin 'Shougo/unite.vim'

            "unite outline to get a overview of everything in special files
            Plugin 'Shougo/unite-outline'

            "Yankring
            Plugin 'vim-scripts/YankRing.vim'
        endif

        "Text objects
        if count(g:cocophotos_bundle_groups, 'textobj')
            Plugin 'austintaylor/vim-indentobject'
            Plugin 'bootleq/vim-textobj-rubysymbol'
            Plugin 'coderifous/textobj-word-column.vim'
            Plugin 'kana/vim-textobj-datetime'
            Plugin 'kana/vim-textobj-entire'
            Plugin 'kana/vim-textobj-function'
            Plugin 'kana/vim-textobj-user'
            Plugin 'lucapette/vim-textobj-underscore'
            Plugin 'nathanaelkane/vim-indent-guides'
            Plugin 'nelstrom/vim-textobj-rubyblock'
            Plugin 'thinca/vim-textobj-function-javascript'
            Plugin 'vim-scripts/argtextobj.vim'
        endif

        " General Programming
        if count(g:cocophotos_bundle_groups, 'programming')
            Plugin 'tpope/vim-fugitive'
            if executable('ctags')
                Plugin 'majutsushi/tagbar'
            endif
            
            "Plugin 'Shougo/neocomplcache'
            Plugin 'Valloric/YouCompleteMe'
            
            Plugin 'vim-perl/vim-perl'
            Plugin 'rainux/vim-vala'
            "View undo tree in Vim
            Plugin 'sjl/gundo.vim'
            "View color parentheses when they are mingled
            Plugin 'kien/rainbow_parentheses.vim'
            
            Plugin 'ervandew/supertab'

            " Allow fast tabularization of input
            Plugin 'godlygeek/tabular'
            
            "Vim C++11 support
            Plugin 'vim-scripts/Cpp11-Syntax-Support'
            
            "Vim CMake support
            Plugin 'vhdirk/vim-cmake'
            
            "Indentation guide useful in Python for example
            Plugin 'Yggdroot/indentLine'
            
            "Expanding selection by pressing + (or _ to shrink)
            Plugin 'terryma/vim-expand-region'
        endif

        "Web programming
        if count(g:cocophotos_bundle_groups, 'web')
            Plugin 'digitaltoad/vim-jade'
            Plugin 'groenewege/vim-less'
            Plugin 'pangloss/vim-javascript'
            Plugin 'elzr/vim-json'

            "TernJS better completion for javascript
            Plugin 'marijnh/tern_for_vim'

            "JSX correct indentation and highlighting
            Plugin 'mxw/vim-jsx' 
        endif

        "LaTeX
        if count(g:cocophotos_bundle_groups, 'latex')
            "Plugin 'git://git.code.sf.net/p/atp-vim/code'
            "Plugin 'LaTeX-Box-Team/LaTeX-Box'
            "Plugin 'vim-scripts/TeX-9'
        endif

        "Spelling
        if count(g:cocophotos_bundle_groups, 'spelling')
            Plugin 'vim-scripts/LanguageTool'
        endif

    call vundle#end()
"}

" General {
    set encoding=utf-8 " Necessary to show Unicode glyphs
" }

" Vim UI {
    " Font
    set anti enc=utf-8
    set gfn=Source\ Code\ Pro\ Regular:h13
    "set gfn=Liberation\ Mono\ Regular:h13
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
    
    " CSV {
        au BufEnter *.csv if !exists('b:csv_arrange_leftalign') | let b:csv_arrange_leftalign = 1 | endif
    " }

    " YankRing {
        let g:yankring_history_file = '.yankring_history'
        nnoremap ,yr :YRShow<CR>
        nnoremap C-y :YRShow<CR>
    " }
    
    " Custom settings {
        map <Leader>jt !python -m json.tool<CR>
    " }
    
    " LanguageTool {
        let g:languagetool_jar='$HOME/.vim/LanguageTool/languagetool-commandline.jar'
    " }
    
    " Unite {
    
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])
    call unite#custom#profile('default', 'context', {'start_insert': 1})
    
    let g:unite_data_directory='~/.unite'
    let g:unite_source_history_yank_enable=1
    let g:unite_source_rec_max_cache_files=5000
    
    if executable('ag')
        let g:unite_source_grep_command='ag'
        let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C4'
        let g:unite_source_grep_recursive_opt=''
    elseif executable('ack')
        let g:unite_source_grep_command='ack'
        let g:unite_source_grep_default_opts='--no-heading --no-color -C4'
        let g:unite_source_grep_recursive_opt=''
    endif

    nnoremap <leader>t :<C-u>Unite -buffer-name=files   -vertical -start-insert file_rec/async:!<cr>
    nnoremap <leader>f :<C-u>Unite -buffer-name=files   -vertical -start-insert file<cr>
    nnoremap <leader>r :<C-u>Unite -buffer-name=mru     -vertical -start-insert file_mru<cr>
    nnoremap <leader>o :<C-u>Unite -buffer-name=outline -vertical -start-insert outline<cr>
    nnoremap <leader>y :<C-u>Unite -buffer-name=yank    -vertical -start-insert history/yank<cr>
    nnoremap <leader>e :<C-u>Unite -buffer-name=buffer  -vertical -start-insert buffer<cr>
    nnoremap <leader>/ :<C-u>Unite -no-quit -buffer-name=search -vertical -start-insert grep:.<cr>
    nnoremap <leader>l :<C-u>Unite -buffer-name=line -vertical -start-insert line<cr>
    nnoremap <leader>o :<C-u>Unite -buffer-name=outline -vertical -start-insert outline<cr>

    autocmd FileType unite call s:unite_settings()

    function! s:unite_settings()
        let b:SuperTabDisabled=1
        imap <silent><buffer><expr> <C-x> unite#do_action('split')
        imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
        imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
        nmap <buffer> <ESC> <Plug>(unite_exit)
    endfunction
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

    " Activate spelling for LaTeX files
    autocmd BufEnter *.tex setlocal spell

    " Activate 79 characters wrap for tex file
    autocmd BufRead,BufNewFile *.tex setlocal textwidth=79

    "Turn filetype detection on
    filetype plugin indent on
"}
