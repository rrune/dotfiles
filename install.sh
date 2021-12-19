read -p "This will replace some stuff. You sure? [Y/n] " -n 1 -r
#echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Canceling"
    exit 1
fi

echo "Installing Dotfiles"

echo "Generating SSH Key"
ssh-keygen -t rsa -b 4096

echo "Linking bashrc"
ln -s ./bashrc ~/.bashrc

echo "Linking ~/.config/nvim"
ln -s ./config/nvim ~/.config/nvim

echo "Linking starship.toml"
ln -s ./config/starship.toml ~/.config/starship.toml

read -p "Install prompt and scripts (External sources)? [Y/n] " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Installed configs without scripts, you will get errors"
    exit 1
fi

echo "Installing Starship prompt"
source "$(curl -fsSL https://starship.rs/install.sh)"

echo "Creating scripts directory"
mkdir ~/stuff/scripts

echo "Installing goto"
wget -o ~/stuff/scripts/goto.sh https://raw.githubusercontent.com/iridakos/goto/master/goto.sh

echo "Installing up"
wget -o ~/stuff/scripts/up.sh

echo "Creating directory for PATH"
mkdir ~/stuff/scripts/bin

echo "Installing ext"
wget -o ~/stuff/scripts/bin/ext https://raw.githubusercontent.com/Manas140/sh/main/src/External

echo "Installing calc"
wget -o ~/stuff/scripts/bin/calc https://raw.githubusercontent.com/Manas140/sh/main/src/calc

echo "Everything installed"
source ~/.bashrc
