SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

read -p "-> This will replace some stuff. You sure? [Y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "-> Canceling"
    exit 1
fi

echo "-> Installing Dotfiles"

read -p "-> Generate SSH keys? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "-> Generating SSH key"
    ssh-keygen -t rsa -b 4096
fi

echo "-> Linking bashrc"
ln -sf ${SCRIPT_DIR}/bashrc ~/.bashrc

echo "-> Linking ~/.config/nvim"
ln -sf ${SCRIPT_DIR}/config/nvim ~/.config/nvim

echo "-> Linking starship.toml"
ln -sf ${SCRIPT_DIR}/config/starship.toml ~/.config/starship.toml

read -p "-> Install Starship prompt? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "-> Installing Starship prompt"
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi

read -p "-> Install scripts (External sources)? [Y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "-> Installed configs without scripts, you will get errors"
    exit 1
fi

echo "-> Installing Fira Code font"
mkdir ~/.local/share/fonts > /dev/null 2>&1
cp ./firacode.ttf ~/.local/share/fonts > /dev/null 2>&1
fc-cache -f -v > /dev/null 2>&1

echo "-> Creating scripts directory"
mkdir ~/stuff/scripts > /dev/null 2>&1

echo "-> Installing goto"
wget -O ~/stuff/scripts/goto.sh https://raw.githubusercontent.com/iridakos/goto/master/goto.sh > /dev/null 2>&1

echo "-> Installing up"
wget -O ~/stuff/scripts/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh > /dev/null 2>&1


echo "-> Creating directory for PATH"
mkdir ~/stuff/scripts/bin > /dev/null 2>&1

echo "-> Installing ext"
wget -O ~/stuff/scripts/bin/ext.sh https://raw.githubusercontent.com/Manas140/sh/main/src/ext > /dev/null 2>&1
mv ~/stuff/scripts/bin/ext.sh ~/stuff/scripts/bin/ext > /dev/null 2>&1

echo "-> Installing calc"
wget -O ~/stuff/scripts/bin/calc.sh https://raw.githubusercontent.com/Manas140/sh/main/src/calc > /dev/null 2>&1
mv ~/stuff/scripts/bin/calc.sh ~/stuff/scripts/bin/calc > /dev/null 2>&1

echo "-> Everything installed"
source ~/.bashrc
