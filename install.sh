#!/bin/bash

# Obtendo o diretório do script
set SCRIPT_DIR (dirname (realpath (status filename))

# Atualiza pacotes e instala dependências
sudo apt update && sudo apt install -y curl git unzip

# Instala Bass
omf install bass

# Instala Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y
mkdir -p ~/.config
cp -f "$SCRIPT_DIR/config/starship.toml" ~/.config/

# Instala Zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Instala FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Instala NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash

# Configurar Fish
mkdir -p ~/.config/fish
cp -f "$SCRIPT_DIR/config/config.fish" ~/.config/fish/

# Aplica mudanças
exec fish

nvm install --lts
nvm use --lts
nvm alias default 'lts/*'
npm update -g npm

# Instala PNPM
curl -fsSL https://get.pnpm.io/install.sh | sh -

# Instala Bun
curl -fsSL https://bun.sh/install | bash

# Aplica mudanças
exec fish
