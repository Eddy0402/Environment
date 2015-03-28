#!/bin/sh
# Ensure the working directory
cd "${0%/*}"

git submodule init

# VIM
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
if [ ! -f ~/.ycm_extra_conf.py ]; then
    echo Symlink `pwd`/vim/ycm_extra_conf.py to ~/.ycm_extra_conf.py
    ln -s `pwd`/vim/ycm_extra_conf.py ~/.ycm_extra_conf.py
fi
if [ ! -f ~/.NERDTreeBookmarks ]; then
    echo Symlink `pwd`/vim/NERDTreeBookmarks to ~/.NERDTreeBookmarks
    ln -s `pwd`/vim/NERDTreeBookmarks ~/.NERDTreeBookmarks
fi

cp -r./vim/ycmd ./vim/vim/bundle/YouCompleteMe/third_party/

# ZSH
if [ ! -f ~/.zshrc ]; then
    echo Symlink `pwd`/zsh/zshrc to ~/.zshrc
    ln -s `pwd`/zsh/zshrc ~/.zshrc``
fi
if [ ! -d ~/.oh-my-zsh ]; then
    echo Symlink `pwd`/zsh/oh-my-zsh to ~/.oh-my-zsh
    ln -s `pwd`/zsh/oh-my-zsh ~/.oh-my-zsh
fi
