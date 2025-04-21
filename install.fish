#!/usr/bin/env fish

# Função para verificar se um comando existe
function command_exists
    command -v $argv[1] >/dev/null 2>&1
end

echo "Iniciando instalação das ferramentas..."

# bat, zoxide e fzf
if not command_exists bat; and not command_exists batcat
    echo "Instalando bat, zoxide e fzf..."
    sudo apt install bat zoxide fzf -y
    mkdir -p ~/.local/bin
    # Criar link simbólico apenas se batcat existir e bat não
    if test -e /usr/bin/batcat; and not test -e ~/.local/bin/bat
        ln -s /usr/bin/batcat ~/.local/bin/bat
    end
else
    echo "bat, zoxide e fzf já estão instalados."
end

# eza
if not command_exists eza
    echo "Instalando eza..."
    sudo apt update
    sudo apt install -y gpg
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    sudo apt update
    sudo apt install -y eza
else
    echo "eza já está instalado."
end

# oh-my-fish
if not test -d ~/.local/share/omf
    echo "Instalando oh-my-fish..."
    curl -L https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
else
    echo "oh-my-fish já está instalado."
end

# starship
if not command_exists starship
    echo "Instalando starship..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
else
    echo "starship já está instalado."
end

# Criar diretório de configuração
mkdir -p ~/.config

# Copiar arquivos de configuração
echo "Copiando arquivos de configuração..."
if test -f "$PWD/config/starship.toml"
    cp -f "$PWD/config/starship.toml" ~/.config/
    echo "Arquivo starship.toml copiado."
else
    echo "Aviso: Arquivo starship.toml não encontrado em $PWD/config/"
end

if test -f "$PWD/config/config.fish"
    mkdir -p ~/.config/fish
    cp -f "$PWD/config/config.fish" ~/.config/fish/config.fish
    echo "Arquivo config.fish copiado."
else
    echo "Aviso: Arquivo config.fish não encontrado em $PWD/config/"
end

# nvm
if not test -d ~/.nvm
    echo "Instalando nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

    # Verificar se o plugin nvm para omf está instalado
    if not omf list | grep -q nvm
        echo "Instalando plugin nvm para oh-my-fish..."
        omf install nvm
    end
else
    echo "nvm já está instalado."
end

# node lts
echo "Configurando Node.js LTS..."
# Carregar o NVM temporariamente
if test -s ~/.nvm/nvm.sh
    bass source ~/.nvm/nvm.sh
    # Verificar se já existe uma versão LTS
    if not nvm ls | grep -q 'lts'
        nvm install --lts
    end
    nvm use --lts
    nvm alias default "lts/*"
    npm update -g npm
else
    echo "Aviso: NVM não encontrado. Certifique-se de que o plugin 'bass' está instalado para oh-my-fish."
    echo "Instale com: omf install bass"
end

# pnpm
if not command_exists pnpm
    echo "Instalando pnpm..."
    curl -fsSL https://get.pnpm.io/install.sh | sh -
else
    echo "pnpm já está instalado."
end

# bun
if not command_exists bun
    echo "Instalando bun..."
    curl -fsSL https://bun.sh/install | bash
else
    echo "bun já está instalado."
end

echo "Instalação concluída com sucesso!"
echo "Para garantir que todas as ferramentas estejam disponíveis, você pode reiniciar o terminal ou executar: exec fish"
