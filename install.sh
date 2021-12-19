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

read -p "-> Install prompt and scripts (External sources)? [Y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "-> Installed configs without scripts, you will get errors"
    exit 1
fi

echo "-> Installing Fira Code font"
{
    mkdir ~/.local/share/fonts
    cp ./firacode.ttf ~/.local/share/fonts
    fc-cache -f -v
} &> /dev/null
wait

echo "-> Installing Starship prompt"
{source "$(curl -fsSL https://starship.rs/install.sh)"} &> /dev/null
wait

echo "-> Creating scripts directory"
{mkdir ~/stuff/scripts} &> /dev/null
wait

echo "-> Installing goto"
{wget -O ~/stuff/scripts/goto.sh https://raw.githubusercontent.com/iridakos/goto/master/goto.sh} &> /dev/null
wait

echo "-> Installing up"
{wget -O ~/stuff/scripts/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh} &> /dev/null
wait

echo "-> Creating directory for PATH"
{mkdir ~/stuff/scripts/bin} &> /dev/null
wait

echo "-> Installing ext"
{
    wget -O ~/stuff/scripts/bin/ext.sh https://raw.githubusercontent.com/Manas140/sh/main/src/ext
    mv ~/stuff/scripts/bin/ext.sh ~/stuff/scripts/bin/ext
}&> /dev/null
wait

echo "-> Installing calc"
{
    wget -O ~/stuff/scripts/bin/calc.sh https://raw.githubusercontent.com/Manas140/sh/main/src/calc
    mv ~/stuff/scripts/bin/calc.sh ~/stuff/scripts/bin/calc
} &> /dev/null
wait

echo "-> Everything installed"
source ~/.bashrc
