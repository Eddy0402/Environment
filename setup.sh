#!/bin/sh
cd "${0%/*}"

# Vim
if [ ! -f ~/.vimrc ]; then
    echo Symlink `pwd`/vim/vimrc to ~/.vimrc
    ln -s `pwd`/vim/vimrc ~/.vimrc
fi
if [ ! -d ~/.vim ]; then
    echo Symlink `pwd`/vim/vim to ~/.vim
    ln -s `pwd`/vim/vim ~/.vim
fi
if ! diff --brief `pwd`/vim/clang_completer.py vim/vim/bundle/YouCompleteMe/third_party/ycmd/ycmd/completers/cpp/clang_completer.py >/dev/null
then
    echo Patch YoucompleteMe
    cp `pwd`/vim/clang_completer.py vim/vim/bundle/YouCompleteMe/third_party/ycmd/ycmd/completers/cpp/clang_completer.py
fi
