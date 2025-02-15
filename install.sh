#!/usr/bin/env fish

function log_info
    set_color green
    echo "➜ $argv"
    set_color normal
end

function log_error
    set_color red
    echo "✖ $argv"
    set_color normal
    return 1
end

function check_command
    if not type -q $argv[1]
        log_error "Comando '$argv[1]' não encontrado. Instalação falhou."
        exit 1
    end
end

# Instala Starship
log_info "Instalando Starship..."
if not type -q starship
    curl -sS https://starship.rs/install.sh | sh -s -- -y
    or log_error "Falha ao instalar Starship"
end

# Configura Starship
mkdir -p ~/.config
cp -f "$PWD/config/starship.toml" ~/.config/
or log_error "Falha ao copiar configuração do Starship"

# Instala Zoxide
log_info "Instalando Zoxide..."
if not type -q zoxide
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    or log_error "Falha ao instalar Zoxide"
end

# Instala FZF
log_info "Instalando FZF..."
if not test -d ~/.fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
    or log_error "Falha ao instalar FZF"
end

# Instala plugins do Fish
log_info "Instalando plugins do Fish..."
omf install https://github.com/fabioantunes/fish-nvm
omf install bass
or log_error "Falha ao instalar plugins do Fish"

# Instala NVM
log_info "Instalando NVM..."
if not test -d ~/.nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    or log_error "Falha ao instalar NVM"
end

# Configura Fish
log_info "Configurando Fish..."
mkdir -p ~/.config/fish
cp -f "$PWD/config/config.fish" ~/.config/fish/
or log_error "Falha ao copiar configuração do Fish"

# Configura NVM e instala Node LTS
log_info "Configurando NVM e instalando Node LTS..."
function nvm
    bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
end

# Verifica se o NVM está funcionando
if not functions -q nvm
    log_error "NVM não foi configurado corretamente"
    exit 1
end

nvm install --lts
or log_error "Falha ao instalar Node LTS"

nvm use --lts
nvm alias default 'lts/*'
npm update -g npm
or log_error "Falha ao configurar Node"

# Instala PNPM
log_info "Instalando PNPM..."
if not type -q pnpm
    curl -fsSL https://get.pnpm.io/install.sh | sh -
    or log_error "Falha ao instalar PNPM"
end

# Instala Bun
log_info "Instalando Bun..."
if not type -q bun
    curl -fsSL https://bun.sh/install | bash
    or log_error "Falha ao instalar Bun"
end

# Verifica se tudo foi instalado corretamente
log_info "Verificando instalações..."
set required_commands fish omf starship zoxide fzf node npm pnpm bun

for cmd in $required_commands
    check_command $cmd
end

log_info "✓ Configuração concluída com sucesso!"
log_info "Por favor, reinicie o terminal para aplicar todas as mudanças."
