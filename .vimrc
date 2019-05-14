" vim: set foldmarker={{,}} foldlevel=0 foldmethod=marker spell:


"Environment {{
    "Basics {{
        set nocompatible
        "Ensure a POSIX-compliant SHELL so that Vundle will run properly
        if $SHELL =~ 'bin/fish'
            set shell=/bin/bash
        endif
    "}}
"}}

" General {{
    set encoding=utf-8 " Necessary to show Unicode glyphs
" }}

" Plugins {{
    call plug#begin('~/.vim/plugged')

    ""Theming
    Plug 'morhetz/gruvbox'


    ""General
    Plug 'scrooloose/nerdTree'
    Plug 'tpope/vim-surround'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'bling/vim-airline'
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
    Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
    "Allow fish shell syntax
    Plug 'dag/vim-fish'
    "Vue JS hightlighting"
    Plug 'posva/vim-vue'
    "Vim C++11 support
    Plug 'vim-scripts/Cpp11-Syntax-Support'
    "Vim CMake support
    Plug 'vhdirk/vim-cmake'
    "Follow indentation from PEP8
    Plug 'Vimjas/vim-python-pep8-indent'
    "Syntax hightlighting for TypeScript 
    Plug 'leafgarland/typescript-vim'

    call plug#end()
" }}

" Vim UI {{
    " Font
    set gfn=Source\ Code\ Pro\ Regular:h13
    
    " Color scheme
    "set background=dark
    "set background=light
    colorscheme gruvbox 

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
" }}

" Plugins options {{
    " Ultisnips & coc.nvim {{
        " Make TAB usable between ultisnips and coc.nvim 
        let g:UltiSnipsExpandTrigger='<Nop>'
        let g:UltiSnipsJumpForwardTrigger = '<TAB>'
        let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'
        let g:coc_snippet_next = '<TAB>'
        let g:coc_snippet_prev = '<S-TAB>'
    " }}
    " coc.nvim {{
        " Play nice with LaTeX and digestif
        let g:coc_filetype_map = {
            \ 'tex': 'latext',
            \ 'plaintex': 'tex',
        \ }

        " Have coc-status in statusline
        set statusline^=%{coc#status()}
    " }}
    
    " NerdTree {{
        nmap <C-n> :NERDTreeToggle<CR>
    " }}
" }}
