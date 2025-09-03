#!/usr/bin/env fish

# Script para instalar eza

# Função para verificar se um comando existe
function command_exists
    command -v $argv[1] >/dev/null 2>&1
end

function install_eza
    echo "=== Instalando eza ==="
    
    if not command_exists eza
        echo "Instalando eza..."
        sudo apt update
        if not sudo apt install -y gpg
            echo "Erro: Falha na instalação do gpg"
            return 1
        end
        
        sudo mkdir -p /etc/apt/keyrings
        if not wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
            echo "Erro: Falha ao adicionar chave GPG do eza"
            return 1
        end
        
        echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
        sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
        sudo apt update
        
        if not sudo apt install -y eza
            echo "Erro: Falha na instalação do eza"
            return 1
        end
        
        echo "eza instalado com sucesso!"
    else
        echo "eza já está instalado."
    end
    
    return 0
end

# Executar se chamado diretamente
if test (basename (status filename)) = "install-eza.fish"
    install_eza
    exit $status
end