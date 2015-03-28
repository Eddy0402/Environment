#!/bin/sh
# Ensure the working directory

mkdir -p ~/backup

# VIM
if [ -f ~/.vimrc ]; then
    echo backup ~/.vimrc
    cp ~/.vimrc ~/backup/.vimrc
fi
if [ -d ~/.vim ]; then
    echo backup ~/.vim
    cp -r ~/.vim ~/backup/.vim
fi
if [ -f ~/.ycm_extra_conf.py ]; then
    echo backup ~/.ycm_extra_conf.py
    cp ~/.ycm_extra_conf.py ~/backup/.ycm_extra_conf.py
fi
if [ -f ~/.NERDTreeBookmarks ]; then
    echo backup ~/.NERDTreeBookmarks
    cp ~/.NERDTreeBookmarks ~/backup/.NERDTreeBookmarks
fi


# ZSH
if [ -f ~/.zshrc ]; then
    echo backup ~/.zshrc
    cp ~/.zshrc ~/backup/.zshrc
fi
if [ -d ~/.oh-my-zsh ]; then
    echo backup ~/.oh-my-zsh
    cp -r ~/.oh-my-zsh ~/backup/.oh-my-zsh
fi

