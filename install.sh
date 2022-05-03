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

echo "-> Copying ~/.config/nvim"
ln -sf ${SCRIPT_DIR}/config/nvim ~/.config/

read -p "-> install bspwm configuration? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "-> Copying ~/.config/bspwm"
    ln -sf ${SCRIPT_DIR}/config/bspwm ~/.config/

    echo "-> Copying ~/.config/sxhkd"
    ln -sf ${SCRIPT_DIR}/config/sxhkd ~/.config/

    echo "-> Copying ~/.config/polybar"
    ln -sf ${SCRIPT_DIR}/config/polybar ~/.config/

    echo "-> Copying ~/.config/picom"
    ln -sf ${SCRIPT_DIR}/config/picom ~/.config/

    echo "-> Copying ~/.config/rofi"
    ln -sf ${SCRIPT_DIR}/config/rofi ~/.config/

    echo "-> Copying ~/.config/dunst"
    ln -sf ${SCRIPT_DIR}/config/dunst ~/.config/

    echo "-> Copying ~/.config/kitty"
    ln -sf ${SCRIPT_DIR}/config/kitty ~/.config/

    echo "-> Copying ~/.config/zathura"
    ln -sf ${SCRIPT_DIR}/config/zathura ~/.config

    echo "-> Copying ~/.config/VSCodium"
    cp -r ${SCRIPT_DIR}/config/VSCodium ~/.config

    echo "-> Copying ~/.config/Insomnia/"
    cp -r ${SCRIPT_DIR}/config/Insomnia ~/.config/Insomnia

    echo "-> Copying ~/.config/gtk-3.0/"
    ln -sf ${SCRIPT_DIR}/config/gtk-3.0 ~/.config/
fi

echo "-> Creating ~/.local/share/fonts"
mkdir -p ~/.local/share/fonts >/dev/null 2>&1

echo "-> Installing Fonts (Firacode, Sometype)"
cp ./fonts/* ~/.local/share/fonts >/dev/null 2>&1
fc-cache -f -v >/dev/null 2>&1

read -p "-> Install Starship prompt? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"

    echo "-> Linking starship.toml"
    ln -sf ${SCRIPT_DIR}/config/starship.toml ~/.config/starship.toml
fi

read -p "-> Install scripts (External sources)? [Y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "-> Installed configs without scripts, you will get errors"
    exit 1
fi

echo "-> Creating scripts directory"
mkdir -p ~/stuff/scripts >/dev/null 2>&1

echo "-> Installing goto"
curl -o ~/stuff/scripts/goto.sh https://raw.githubusercontent.com/iridakos/goto/master/goto.sh >/dev/null 2>&1

echo "-> Installing up"
curl -o ~/stuff/scripts/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh >/dev/null 2>&1

echo "-> Creating directory for PATH"
mkdir -p ~/stuff/scripts/bin >/dev/null 2>&1

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

        echo "-> Installing scripts from local folder"
        cp -r ./scripts/* ~/stuff/scripts

        sudo chmod +x ~/stuff/scripts/bin/*
    else
        echo "-> Wrong password. Skiping"
    fi

fi

echo "-> Everything installed. Restart terminal or type 'source ~/.bashrc'"
