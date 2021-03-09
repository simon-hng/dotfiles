mkdir ~/.config/nvim -p
rm ~/.config/nvim/init.vim ~/.tmux.conf

# Link nvim config
ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim

# Link tmux config
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
