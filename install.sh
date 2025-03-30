#!/usr/bin/env fish

# zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# bat
sudo apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# eza
sudo apt update
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# oh-my-fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# starship
curl -sS https://starship.rs/install.sh | sh -s -- -y
mkdir -p ~/.config

# copy config files
cp -f "$PWD/config/starship.toml" ~/.config/
cp -f "$PWD/config/config.fish" ~/.config/fish/config.fish

# nvm
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
omf install nvm

# node lts
fish -c 'nvm install --lts; nvm use --lts; nvm alias default "lts/*"; npm update -g npm'

# pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -

# bun
curl -fsSL https://bun.sh/install | bash
