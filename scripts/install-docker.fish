#!/usr/bin/env fish

# Script para instalar Docker Engine

# Função para verificar se um comando existe
function command_exists
    command -v $argv[1] >/dev/null 2>&1
end

function install_docker
    echo "=== Instalando Docker Engine ==="
    
    if not command_exists docker
        echo "Instalando Docker Engine..."
        
        # Atualizar índice de pacotes
        sudo apt-get update
        
        # Instalar pacotes necessários
        if not sudo apt-get install -y ca-certificates curl
            echo "Erro: Falha na instalação de dependências"
            return 1
        end
        
        # Criar diretório para chaves GPG
        sudo install -m 0755 -d /etc/apt/keyrings
        
        # Adicionar chave GPG oficial do Docker
        if not curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
            echo "Erro: Falha ao adicionar chave GPG do Docker"
            return 1
        end
        
        sudo chmod a+r /etc/apt/keyrings/docker.gpg
        
        # Adicionar repositório do Docker
        echo "deb [arch=(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu (lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        
        # Atualizar índice de pacotes
        sudo apt-get update
        
        # Instalar Docker Engine
        if not sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
            echo "Erro: Falha na instalação do Docker Engine"
            return 1
        end
        
        # Adicionar usuário ao grupo docker
        sudo usermod -aG docker $USER
        
        # Iniciar e habilitar serviço Docker
        sudo systemctl start docker
        sudo systemctl enable docker
        
        echo "Docker Engine instalado com sucesso!"
        echo "IMPORTANTE: Faça logout e login novamente para usar Docker sem sudo"
        echo "Ou execute: newgrp docker"
    else
        echo "Docker já está instalado."
    end
    
    return 0
end

# Executar se chamado diretamente
if test (basename (status filename)) = "install-docker.fish"
    install_docker
    exit $status
end