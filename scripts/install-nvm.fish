#!/usr/bin/env fish

# Script para instalar NVM e Node.js

function install_nvm
    echo "=== Instalando NVM ==="
    
    if not test -d ~/.nvm
        echo "Instalando nvm..."
        if not curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
            echo "Erro: Falha na instalação do nvm"
            return 1
        end
        
        # Verificar se o plugin nvm para omf está instalado
        if not omf list | grep -q nvm
            echo "Instalando plugin nvm para oh-my-fish..."
            omf install nvm
        end
        
        echo "nvm instalado com sucesso!"
    else
        echo "nvm já está instalado."
    end
    
    # Configurar Node.js LTS
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
        echo "Node.js LTS configurado!"
    else
        echo "Aviso: NVM não encontrado. Certifique-se de que o plugin 'bass' está instalado para oh-my-fish."
        echo "Instale com: omf install bass"
    end
    
    return 0
end

# Executar se chamado diretamente
if test (basename (status filename)) = "install-nvm.fish"
    install_nvm
    exit $status
end