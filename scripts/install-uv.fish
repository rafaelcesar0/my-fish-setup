#!/usr/bin/env fish

# Script para instalar UV (Python package manager)

# Função para verificar se um comando existe
function command_exists
    command -v $argv[1] >/dev/null 2>&1
end

function install_uv
    echo "=== Instalando UV (Python Package Manager) ==="
    
    if not command_exists uv
        echo "Instalando UV..."
        
        # Instalar UV usando o instalador oficial
        if not curl -LsSf https://astral.sh/uv/install.sh | sh
            echo "Erro: Falha na instalação do UV"
            return 1
        end
        
        # Adicionar UV ao PATH da sessão atual (temporário)
        set -gx PATH "$HOME/.cargo/bin" $PATH
        
        echo "UV instalado com sucesso!"
        echo "NOTA: Reinicie o terminal ou execute 'exec fish' para usar UV"
        echo "Localização: ~/.cargo/bin/uv"
    else
        echo "UV já está instalado."
    end
    
    return 0
end

# Executar se chamado diretamente
if test (basename (status filename)) = "install-uv.fish"
    install_uv
    exit $status
end