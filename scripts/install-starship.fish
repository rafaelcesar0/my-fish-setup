#!/usr/bin/env fish

# Script para instalar starship

# Função para verificar se um comando existe
function command_exists
    command -v $argv[1] >/dev/null 2>&1
end

function install_starship
    echo "=== Instalando Starship ==="
    
    if not command_exists starship
        echo "Instalando starship..."
        if not curl -sS https://starship.rs/install.sh | sh -s -- -y
            echo "Erro: Falha na instalação do starship"
            return 1
        end
        echo "starship instalado com sucesso!"
    else
        echo "starship já está instalado."
    end
    
    # Criar diretório de configuração
    mkdir -p ~/.config
    
    # Copiar arquivo de configuração do starship
    if test -f "$PWD/config/starship.toml"
        cp -f "$PWD/config/starship.toml" ~/.config/
        echo "Arquivo starship.toml copiado."
    else
        echo "Aviso: Arquivo starship.toml não encontrado em $PWD/config/"
    end
    
    return 0
end

# Executar se chamado diretamente
if test (basename (status filename)) = "install-starship.fish"
    install_starship
    exit $status
end