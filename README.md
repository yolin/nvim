install neovim
===============
echo | sudo add-apt-repository ppa:neovim-ppa/stable  
sudo apt-get update  
echo Y | sudo apt-get install neovim  

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60  
echo | sudo update-alternatives --config vi  
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60  
echo | sudo update-alternatives --config vim  
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60  
echo | sudo update-alternatives --config editor  

fix clipboard
==============
apt install xsel  

mv nvim/ ~/.nvim  
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}  
ln -s ~/.nvim $XDG_CONFIG_HOME/nvim  
ln -s ~/.nvim/nvimrc $XDG_CONFIG_HOME/nvim/init.vim  

install ag, very fast search
============================
apt install silversearcher-ag  

run vi and type
===============
:BundleInstall  
