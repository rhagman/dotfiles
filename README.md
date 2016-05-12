# dotfiles
My config files

# Usage
## Manual install on Ubuntu
### vim
Install vim and dependencies needed:
```bash
$ sudo apt install vim-gnome-py2 ctags build-essential cmake python-dev python3-dev
```

Set up the dotfiles (only vim):
```bash
$ mkdir -p ~/.config && cd ~/.config
$ git clone https://github.com/rhagman/dotfiles.git
$ cd ~ && mv .vimrc .vimrc.old && ln -s .config/dotfiles/.vimrc .vimrc
```

Set up Vundle:
```bash
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ cd ~/.vim/bundle/YouCompleteMe
$ git submodule update --init --recursive
$ ./install.py --clang-completer
```
