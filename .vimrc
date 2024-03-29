" vim: set foldmarker={{,}} foldlevel=0 foldmethod=marker spell:


"Environment {{
    "Basics {{
        set nocompatible
        "Ensure a POSIX-compliant SHELL so that Vundle will run properly
        if $SHELL =~ 'bin/fish'
            set shell=/bin/sh
        endif
    "}}
"}}

" General {{
    set encoding=utf-8 " Necessary to show Unicode glyphs

    "fix for yankring and neovim
    let g:yankring_clipboard_monitor=0
" }}

" Plugins {{
    call plug#begin('~/.vim/plugged')

    ""Theming
    Plug 'morhetz/gruvbox'
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    Plug 'NLKNguyen/papercolor-theme'


    ""General
    Plug 'scrooloose/nerdTree'
    Plug 'tpope/vim-surround'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-scripts/YankRing.vim'
    "Autoclose parens, brackets, quotes
    Plug 'Raimondi/delimitMate'
    Plug 'sjl/gundo.vim'
    "View color parentheses when they are mingled
    Plug 'kien/rainbow_parentheses.vim'
    " Allow fast tabularization of input
    Plug 'godlygeek/tabular'
    " Snippets manager and engine 
    Plug 'SirVer/ultisnips'
    " Real snippets that integrate with vim-snippets
    Plug 'honza/vim-snippets'
    " For git integration (notably easy integration with vim-airline)
    Plug 'tpope/vim-fugitive'
    
    
    ""Text objects
    Plug 'austintaylor/vim-indentobject'
    Plug 'bootleq/vim-textobj-rubysymbol'
    Plug 'coderifous/textobj-word-column.vim'
    Plug 'kana/vim-textobj-datetime'
    Plug 'kana/vim-textobj-entire'
    Plug 'kana/vim-textobj-function'
    Plug 'kana/vim-textobj-user'
    Plug 'lucapette/vim-textobj-underscore'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'nelstrom/vim-textobj-rubyblock'
    Plug 'thinca/vim-textobj-function-javascript'
    Plug 'vim-scripts/argtextobj.vim'
    Plug 'bps/vim-textobj-python'
    "Expanding selection by pressing + (or _ to shrink)
    Plug 'terryma/vim-expand-region'


    ""Development
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    "Allow fish shell syntax
    Plug 'dag/vim-fish'
    "Vue JS hightlighting"
    Plug 'posva/vim-vue'
    "HTML5+Vue indentation support"
    Plug 'othree/html5.vim'
    Plug 'posva/vim-vue'
    "Vim C++11 support
    Plug 'vim-scripts/Cpp11-Syntax-Support'
    "Vim CMake support
    Plug 'vhdirk/vim-cmake'
    "Follow indentation from PEP8
    Plug 'Vimjas/vim-python-pep8-indent'
    "Syntax hightlighting for TypeScript 
    Plug 'leafgarland/typescript-vim'
    "Syntax hightlighting for TypeScript + React
    Plug 'peitalin/vim-jsx-typescript'
    " Syntax hightlighting for QML
    Plug 'peterhoeg/vim-qml'
    " Integration with ReasonML (don't forget to install :CocInstall
    " coc-reason for coc.nvim support)
    Plug 'reasonml-editor/vim-reason-plus'
    " Syntax hightlighting for Nix
    Plug 'LnL7/vim-nix'

    call plug#end()
" }}

" Vim UI {{
    " Font
    set gfn=Source\ Code\ Pro\ Regular:h14
    
    " Color scheme
    set background=dark
    "set background=light
    "colorscheme gruvbox 
    colorscheme PaperColor 
    let g:airline_theme='onedark'

    if !has('gui_running')
        let g:solarized_termcolors=256
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
    syntax on                       " syntax highlighting always on
" }}

" Formatting {{
    set colorcolumn=85              "Highlight when you go further than 85 chars
    set autoindent                  " indent at the same level of the previous line
    set shiftwidth=4                " use indents of 4 spaces
    set expandtab                   " tabs are spaces, not tabs
    set tabstop=4                   " an indentation every four columns
    set softtabstop=4               " let backspace delete indent
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    set backspace=indent,eol,start  " use backspace like other apps"

    " Remove trailing whitespaces and ^M chars
    "autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
    "autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    "autocmd FileType java setl autoindent noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
" }}

" Key Mappings {{
    "The default leader is '\', but many people prefer ',' as it's in a standard location
    let mapleader = ','
    let maplocalleader = '-'
    
    set switchbuf=useopen
    map <C-tab> :sbnext<CR>

    "Make search in regexpes normal (like Perl and Python)
    nnoremap / /\v
    vnoremap / /\v

    "Remap <tab> in command mode to switch between window    
    map <Tab> <C-W>W


    " Some tips worth having
    "Insert new line in NORMAL mode by pressing Enter
    nmap <CR> o<Esc>

    autocmd FileType c,cpp,java,scala,javascript let b:comment_leader = '// ' | let b:comment_follower = ''
    autocmd FileType sh,ruby,python      let b:comment_leader = '# ' | let b:comment_follower = ''
    autocmd FileType conf,fstab          let b:comment_leader = '# ' | let b:comment_follower = ''
    autocmd FileType plaintex,tex        let b:comment_leader = '% ' | let b:comment_follower = '' 
    autocmd FileType mail                let b:comment_leader = '> ' | let b:comment_follower = ''
    autocmd FileType vim                 let b:comment_leader = '" ' | let b:comment_follower = ''
    autocmd FileType html                let b:comment_leader = '<!-- ' | let b:comment_follower = ' !-->'
    noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'/')<CR>/<CR>:<C-B>silent <C-E>'<,'>s/$/<C-R>=escape(b:comment_follower,'/')<CR>/g<CR>:nohlsearch<CR>
    noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'/')<CR>//e<CR>:<C-B>silent <C-E>'<,'>s/<C-R>=escape(b:comment_follower,'/')<CR>$//e<CR>:nohlsearch<CR>
" }}

" Plugins options {{
    " Ultisnips & coc.nvim {{
        " Make TAB usable between ultisnips and coc.nvim 
        let g:UltiSnipsExpandTrigger='<Nop>'
        let g:UltiSnipsJumpForwardTrigger = '<TAB>'
        let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'
        let g:coc_snippet_next = '<TAB>'
        let g:coc_snippet_prev = '<S-TAB>'

        " Directory for snippets
        let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']
    " }}
    
    " coc.nvim {{
        " Play nice with LaTeX and digestif
        let g:coc_filetype_map = {
            \ 'tex': 'latext',
            \ 'plaintex': 'tex',
        \ }

        " Have coc-status in statusline
        set statusline^=%{coc#status()}

        " Use K to show documentation in preview window.
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        function! s:show_documentation()
            if (index(['vim','help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
            else
                call CocAction('doHover')
            endif
        endfunction

        " Use ctrl+space to trigger completion
        inoremap <silent><expr> <C-@> coc#refresh()


        " Make <CR> auto-select the first completion item and notify coc.nvim to
        " format on enter, <cr> could be remapped by other vim plugin
        inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
        
        " Use tab and S-tab to navigate into completion popup
        inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " }}
    
    " NerdTree {{
        nmap <C-n> :NERDTreeToggle<CR>
    " }}

    " Vue {{
        au BufRead,BufNewFile *.vue set filetype=vue.html 
    " }}
" }}
