# Description

# Installation

Just move the directory and the .vimrc into your $HOME

```bash
#Move the .vim directory
# WARNING : this may erase an old .vim directory
mv .vim $HOME/.vim

#Move the config file .vimrc
# WARNING : this may erase an old .vimrc 
mv .vimrc $HOME/.vimrc
```

Then, you need to install Vundle.vim (https://github.com/gmarik/Vundle.vim):

```bash
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
```

This being done, you can install all the plugins (bundles).

# Bundles installation

## Basic install

To install the new bundle, open a terminal and type:

```bash
vim +BundleInstall
```

When complete, just type *:q* in Normal Mode to exit Vim.

## YouCompleteMe install

You need to compile YouCompleteMe yourself. To do so, go to the YouComplete subdirectory

```bash
cd $HOME/.vim/bundle/YouCompleteMe
```

Then you can compile it with

```bash
./install.py
```

If you want the C++ semantic completer support, use:

```bash
./install.py --clang-completer
```

Please refer to the YouCompleteMe documentation for more information (https://github.com/Valloric/YouCompleteMe)

## YouCompleteMe LaTeX Completer

I've designed a Semantic LaTeX Completer for YCM that can automatically complete
\ref and \cite labels. Please refer to this [repository](https://github.com/Cocophotos/vim-ycm-latex-semantic-completer)
to use and install it.

# Bundles description

- YankRing: https://github.com/vim-scripts/YankRing.vim (allow a circular buffer)

# Cheat Sheet 

- YankRing: default keys : \<C-P\> after paste for previous yanked text, \<C-N\> after paste for next yanked text
