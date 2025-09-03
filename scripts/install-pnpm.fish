#!/usr/bin/env fish

# Script para instalar pnpm

# Função para verificar se um comando existe
function command_exists
    command -v $argv[1] >/dev/null 2>&1
end

function install_pnpm
    echo "=== Instalando pnpm ==="
    
    if not command_exists pnpm
        echo "Instalando pnpm..."
        if not curl -fsSL https://get.pnpm.io/install.sh | sh -
            echo "Erro: Falha na instalação do pnpm"
            return 1
        end
        echo "pnpm instalado com sucesso!"
    else
        echo "pnpm já está instalado."
    end
    
    return 0
end

# Executar se chamado diretamente
if test (basename (status filename)) = "install-pnpm.fish"
    install_pnpm
    exit $status
end