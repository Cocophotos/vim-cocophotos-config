# Description

Vim config used for programming notably in:

- TypeScript
- CSS
- HTML
- VueJS
- Python
- Scala (soon)
- C/C++ (soon)

# Installation

You need a fairly recent version of [NeoVim](https://github.com/neovim/neovim/wiki/Installing-Neovim) (0.3.x) to work. It is possible to make it work on Vim 8+ but it is not supported as is.


Just move the .vimrc into your $HOME and create the .vim directory

```bash
#Create the .vim directory
mkdir $HOME/.vim

#Move the config file .vimrc
# WARNING : this may erase an old .vimrc 
mv .vimrc $HOME/.vimrc
```

Then, you need to install [VimPlug](https://github.com/junegunn/vim-plug):

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

This being done, you can install all the plugins (bundles).

# Bundles installation

## Basic install

To install the new bundle, open a terminal and type:

```bash
vim +PlugInstall
```

When complete, just type *:q* in Normal Mode to exit Vim.

## CocConfig and CocInstall

### Prerequisites

You should read the documentation of [coc.nvim](https://github.com/neoclide/coc.nvim), but you need at least the latest LTS of Node.js (8.11.x) to make it work.

### Install language servers

Then, you need to install the Language Servers for coc.nvim. Start vim and run the 
command:

```bash
:CocInstall coc-json coc-css coc-html coc-tsserver coc-tslint-plugin coc-ultisnips coc-python coc-vetur
```

This will install the language servers for:

- JSON
- CSS
- HTML
- TypeScript (+ the linting plugin)
- Ultisnips (for snippets)
- Python
- VueJS (with vetur)

You can choose which language servers you want to install, but we always recommend:

- JSON
- Ultisnips

### Install custom language servers

Some language servers need to be installed separately:

- [digestif](https://github.com/astoff/digestif) for LaTeX
- [flow](https://github.com/facebook/flow) for Flow typing in JavaScript

Our coc-config provides the right configuration for those languager servers. 

### Copy/Paste coc-config

Open vim and execute the command:

```bash
:CocConfig
```

Then copy/paste the coc-settings.json content from this repository

# Bundles description

## Theming

We use Gruvbox as the default theme. It is free, has good constrast, we love it.

## General purpose bundles

- [NerdTree](https://github.com/scrooloose/nerdTree): Tree file explorer. Use Ctrl+n to open the explorer
- [YankRing](https://github.com/vim-scripts/YankRing.vim): Circular buffer for copy/pasting
- [vim-surround](https://github.com/tpope/vim-surround): Allow to change surrounding around text (parentheses, brackets, ...)
- [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): Ctrlp is the most efficient and easy way to open buffers & files on Vim. With the stroke of <C-p> binding you can easily search through all the different files available in the PWD and the best part is that you don’t even have to be precise while typing the name of the file or buffer.
- [vim-easymotion](https://github.com/easymotion/vim-easymotion): Easy motion makes the process of moving around the lines in a document or piece of code much simpler by adding shortcuts to access different parts of the visible lines.
- [vim-airline](https://github.com/bling/vim-airline): The famous status tabline for Vim
- [delimitMate](https://github.com/Raimondi/delimitMate): provides automatic closing of quotes, parenthesis, brackets, etc.
- [gundo](https://github.com/sjl/gundo.vim): Gundo.vim is the Vim plugin to visualize your Vim undo tree.
- [rainbow_parentheses](https://github.com/kien/rainbow_parentheses.vim): Coloring parentheses (brackets, ...) when they are mingled
- [tabular](https://github.com/godlygeek/tabular): Allow fast tabularization of input

## Text object bundles

We have several text object plugins to help text blocks selection and formatting. Also, we have those plugins:

- [vim-expande-region](https://github.com/terryma/vim-expand-region): Expanding selection by pressing `+` (or `_` to shrink).

## Development

Apart from coc.nvim, we have support for:

- C++11 (syntax highlighting)
- Shell Fish (syntax)
- VueJs (syntax hightlighting)
- CMake support
- PEP8 indentation for Python
- TypeScript/JavaScript (syntax hightlighting)

# Cheat sheet

- \<Leader\> is `,`
- Using `tab` in command mode switch between Windows
- \<C-n\> to open NerdTree 
