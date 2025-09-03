#!/usr/bin/env fish

# Script para instalar oh-my-fish e bass plugin

function install_oh_my_fish
    echo "=== Instalando Oh My Fish ==="
    
    if not test -d ~/.local/share/omf
        echo "Instalando oh-my-fish..."
        if not curl -L https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
            echo "Erro: Falha na instalação do oh-my-fish"
            return 1
        end
        echo "oh-my-fish instalado com sucesso!"
    else
        echo "oh-my-fish já está instalado."
    end
    
    # Instalar bass plugin (necessário para NVM)
    if not omf list | grep -q bass
        echo "Instalando plugin bass para oh-my-fish..."
        omf install bass
        echo "Plugin bass instalado!"
    else
        echo "Plugin bass já está instalado."
    end
    
    return 0
end

# Executar se chamado diretamente
if test (basename (status filename)) = "install-oh-my-fish.fish"
    install_oh_my_fish
    exit $status
end