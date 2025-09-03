#!/usr/bin/env fish

# Script para instalar bun

# Função para verificar se um comando existe
function command_exists
    command -v $argv[1] >/dev/null 2>&1
end

function install_bun
    echo "=== Instalando bun ==="
    
    if not command_exists bun
        echo "Instalando bun..."
        if not curl -fsSL https://bun.sh/install | bash
            echo "Erro: Falha na instalação do bun"
            return 1
        end
        echo "bun instalado com sucesso!"
    else
        echo "bun já está instalado."
    end
    
    return 0
end

# Executar se chamado diretamente
if test (basename (status filename)) = "install-bun.fish"
    install_bun
    exit $status
end