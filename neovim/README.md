## Neovim setup 
#### Install neovim from neovim's [Github](https://github.com/neovim/neovim/blob/master/INSTALL.md#linux)
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```
#### Make directory for nvim config 
```
mkdir -p ~/.config/nvim
nvim ~/.config/nvim/init.vim
```
#### Copy init.vim from this repo to local

#### Install vim plug
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
#### open nvim
```
nvim
```
#### Install plugins 
```
:PlugInstall
```
#### Close and Reopen nvim
