#!/usr/bin/env fish

# Função para verificar se o comando foi executado com sucesso
function check_execution
    if test $status -eq 0
        echo "✓ $argv instalado/configurado com sucesso"
    else
        echo "✗ Erro ao instalar/configurar $argv" >&2
        exit 1
    end
end

# Definir Fish como shell padrão
if test (which fish)
    set fish_path (which fish)
    echo "Alterando shell padrão para Fish..."
    chsh -s $fish_path
    check_execution "Fish como shell padrão"
else
    echo "✗ Fish não encontrado! Instale o Fish primeiro." >&2
    exit 1
end

# Obtendo o diretório do script
set SCRIPT_DIR (dirname (realpath (status filename)))

# Instalar Starship
echo "Instalando Starship..."
curl -sS https://starship.rs/install.sh | sh
check_execution "Starship"

# Configurar Starship
echo "Configurando Starship..."
mkdir -p ~/.config
cp -f "$SCRIPT_DIR/config/starship.toml" ~/.config/ 2>/dev/null
check_execution "Starship Config"

# Instalar Zoxide
echo "Instalando Zoxide..."
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
check_execution "Zoxide"

# Instalar Fzf
echo "Instalando Fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
check_execution "Fzf"

# Instalar NVM
echo "Instalando NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
check_execution "NVM"

# Configurar Fish
echo "Configurando Fish..."
mkdir -p ~/.config/fish
cp -f "$SCRIPT_DIR/config/config.fish" ~/.config/fish/ 2>/dev/null
check_execution "Fish Config"

# Carregar NVM no Fish
echo "Configurando Node.js (LTS)..."
function nvm
    bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
end
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'
npm update -g npm
check_execution "Node.js LTS"

# Instalar Pnpm
echo "Instalando Pnpm..."
curl -fsSL https://get.pnpm.io/install.sh | sh -
check_execution "Pnpm"

# Instalar Bun
echo "Instalando Bun..."
sudo apt install -y unzip
curl -fsSL https://bun.sh/install | bash
check_execution "Bun"

# Garantir que os binários estão no PATH
fish_add_path $HOME/.local/bin $HOME/.nvm $HOME/.bun/bin

echo "✓ Configuração concluída! Por favor, reinicie o terminal para aplicar as mudanças."
