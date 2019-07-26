mkdir ~/.config/nvim
mkdir ~/nvimbackup
mkdir ~/nvimundo

ln -sf ~/nvimfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/nvimfiles/ginit.vim ~/.config/nvim/ginit.vim

touch ~/nvimfiles/local_init.vim
