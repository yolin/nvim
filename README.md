install neovim
===============
sudo apt-get install software-properties-common

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

git clone https://github.com/yolin/nvim.git  
mv nvim/ ~/.nvim  
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}  
ln -s ~/.nvim $XDG_CONFIG_HOME/nvim  
ln -s ~/.nvim/nvimrc $XDG_CONFIG_HOME/nvim/init.vim  

fix split window messed up when scrolling
==========================================
echo 'declare -x COLORTERM="gnome-terminal"' >> ~/.bashrc

install ag, very fast search
============================
apt install silversearcher-ag  


install nodejs, for coc plugin
============================
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -  
sudo apt-get install -y nodejs yarn

run vi and type
===============
:source %
:PlugInstall  
:call mkdp#util#install()
exit run vi again  
:CocInstall coc-snippets coc-css coc-json
