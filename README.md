install neovim
===============
sudo apt-get install software-properties-common

``` old
echo | sudo add-apt-repository ppa:neovim-ppa/stable  
sudo apt-get update  
echo Y | sudo apt-get install neovim

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60  
echo | sudo update-alternatives --config vi  
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60  
echo | sudo update-alternatives --config vim  
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60  
echo | sudo update-alternatives --config editor  
```

use snap to install v0.10  
snap install nvim --classic

sudo update-alternatives --install /usr/bin/vi vi /snap/nvim/current/usr/bin/nvim 60  
echo | sudo update-alternatives --config vi  
sudo update-alternatives --install /usr/bin/vim vim /snap/nvim/current/usr/bin/nvim 60  
echo | sudo update-alternatives --config vim  
sudo update-alternatives --install /usr/bin/editor editor /snap/nvim/current/usr/bin/nvim 60  
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

```
tip: other method to install nodejs  
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash  
nvm install 22  
```
pip install pynvim  

run vi and type
===============
:PlugInstall  
:call mkdp#util#install()  
exit run vi again  
:CocInstall coc-snippets coc-css coc-json  



Troubleshotting
===============
sudo apt-get update  
echo Y | sudo apt-get install neovim  
cd ~/.nvim/
git fetch
git reset --hard origin/master  
git clen -f -f -x
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}  
ln -s ~/.nvim $XDG_CONFIG_HOME/nvim  
ln -s ~/.nvim/nvimrc $XDG_CONFIG_HOME/nvim/init.vim  
vi  
:PlugInstall  
// if got error, type enter  
// if got retry, type R  
exit vi  
vi again  
:call mkdp#util#install()  
:CocInstall coc-snippets coc-css coc-json  
exit vi
finished  

