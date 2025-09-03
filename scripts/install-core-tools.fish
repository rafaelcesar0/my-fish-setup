#!/usr/bin/env fish

# Script para instalar bat, zoxide e fzf

# Função para verificar se um comando existe
function command_exists
    command -v $argv[1] >/dev/null 2>&1
end

function install_core_tools
    echo "=== Instalando Core Tools (bat, zoxide, fzf) ==="
    
    if not command_exists bat; and not command_exists batcat
        echo "Instalando bat, zoxide e fzf..."
        if not sudo apt install bat zoxide fzf -y
            echo "Erro: Falha na instalação das ferramentas básicas"
            return 1
        end
        
        mkdir -p ~/.local/bin
        # Criar link simbólico do batcat para bat se necessário
        if command_exists batcat; and not command_exists bat
            if not test -e ~/.local/bin/bat
                ln -s /usr/bin/batcat ~/.local/bin/bat
                echo "Link simbólico bat -> batcat criado"
            end
        end
        echo "Core tools instaladas com sucesso!"
    else
        echo "Core tools já estão instaladas."
    end
    
    return 0
end

# Executar se chamado diretamente
if test (basename (status filename)) = "install-core-tools.fish"
    install_core_tools
    exit $status
end