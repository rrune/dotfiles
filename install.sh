SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

read -p "-> This will replace some stuff. You sure? [Y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "-> Canceling"
    exit 1
fi

echo "-> Installing Dotfiles"

read -p "-> Generate SSH keys? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "-> Generating SSH key"
    ssh-keygen -t rsa -b 4096
fi

echo "-> Linking bashrc"
ln -sf ${SCRIPT_DIR}/bashrc ~/.bashrc

echo "-> Linking gitconfig"
ln -sf ${SCRIPT_DIR}/gitconfig ~/.gitconfig

#echo "-> Linking ~/.config/nvim"
#ln -sf ${SCRIPT_DIR}/config/nvim ~/.config/nvim


read -p "-> Install Starship prompt? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"

    echo "-> Linking starship.toml"
    ln -sf ${SCRIPT_DIR}/config/starship.toml ~/.config/starship.toml

    echo "-> Installing Fira Code font"
    mkdir ~/.local/share/fonts >/dev/null 2>&1
    cp ./files/firacode.ttf ~/.local/share/fonts >/dev/null 2>&1
    fc-cache -f -v >/dev/null 2>&1
fi

read -p "-> Install scripts (External sources)? [Y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "-> Installed configs without scripts, you will get errors"
    exit 1
fi

echo "-> Creating scripts directory"
mkdir ~/stuff/scripts >/dev/null 2>&1

echo "-> Installing goto"
curl -o ~/stuff/scripts/goto.sh https://raw.githubusercontent.com/iridakos/goto/master/goto.sh >/dev/null 2>&1

echo "-> Installing up"
curl -o ~/stuff/scripts/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh >/dev/null 2>&1

echo "-> Creating directory for PATH"
mkdir ~/stuff/scripts/bin >/dev/null 2>&1

read -p "-> Sudo needed for chmod. Install? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo -k
    if sudo true; then
        echo "-> Installing ext"
        curl -o ~/stuff/scripts/bin/ext.sh https://raw.githubusercontent.com/Manas140/sh/main/src/ext >/dev/null 2>&1
        mv ~/stuff/scripts/bin/ext.sh ~/stuff/scripts/bin/ext >/dev/null 2>&1

        echo "-> Installing calc"
        curl -o ~/stuff/scripts/bin/calc.sh https://raw.githubusercontent.com/Manas140/sh/main/src/calc >/dev/null 2>&1
        mv ~/stuff/scripts/bin/calc.sh ~/stuff/scripts/bin/calc >/dev/null 2>&1

        sudo chmod +x ~/stuff/scripts/bin/ext
        sudo chmod +x ~/stuff/scripts/bin/calc
    else
        echo "-> Wrong password. Skiping"
    fi

fi

echo "-> Everything installed. Restart terminal or type 'source ~/.bashrc'"
