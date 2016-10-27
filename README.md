# vimsetting

#fix clipboard
apt install xsel

    mv nvim/ ~/.nvim
    mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
    ln -s ~/.nvim $XDG_CONFIG_HOME/nvim
    ln -s ~/.nvim/nvimrc $XDG_CONFIG_HOME/nvim/init.vim
