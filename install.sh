#!/usr/bin/env fish

function log
    set_color green
    echo "➜ $argv"
    set_color normal
end

# Instala Starship
log "Instalando Starship..."
curl -sS https://starship.rs/install.sh | sh -s -- -y
mkdir -p ~/.config
cp -f "$PWD/config/starship.toml" ~/.config/

# Instala Zoxide
log "Instalando Zoxide..."
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Instala FZF
log "Instalando FZF..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Instala plugins do Fish
log "Instalando plugins do Fish..."
omf install https://github.com/fabioantunes/fish-nvm
omf install bass

# Instala NVM e Node
log "Instalando NVM e Node..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
mkdir -p ~/.config/fish
cp -f "$PWD/config/config.fish" ~/.config/fish/

function nvm
    bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
end

nvm install --lts
nvm use --lts
nvm alias default 'lts/*'
npm update -g npm

# Instala PNPM
log "Instalando PNPM..."
curl -fsSL https://get.pnpm.io/install.sh | sh -

# Instala Bun
log "Instalando Bun..."
curl -fsSL https://bun.sh/install | bash

log "✓ Configuração concluída! Por favor, reinicie o terminal."
