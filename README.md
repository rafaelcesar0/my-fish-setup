# My Fish Setup

Automatização das minhas configurações do Fish Shell e das tecnologias que uso diariamente após uma instalação limpa do Linux.

## 📋 Sumário
- [Pré-requisitos](#pré-requisitos)
- [Configuração inicial](#configuração-inicial)
- [Instalação](#instalação)
- [Recursos instalados](#recursos-instalados)
- [Solução de problemas](#solução-de-problemas)

## 🚀 Pré-requisitos

- Sistema operacional Linux (Ubuntu/Debian)
- Git (para clonar o repositório)
- Permissões de sudo

## ⚙️ Configuração inicial

### 1. Configurar Git (Opcional)
Se você ainda não configurou o Git, execute os comandos abaixo:
```bash
# Configurar branch padrão
git config --global init.defaultBranch main

# Configurar suas credenciais
git config --global user.name "seu_usuario_github"
git config --global user.email "seu_email_github"
```

### 2. Configurar SSH (Opcional)
Se você preferir usar SSH para o Git:
```bash
# Criar chave SSH
mkdir -p ~/.ssh
ssh-keygen -t rsa -C "seu_email_github" -N "" -f ~/.ssh/id_rsa

# Iniciar o agente SSH
eval "$(ssh-agent -s)"

# Exibir a chave pública (adicione esta chave no GitHub)
cat ~/.ssh/id_rsa.pub
```

## 💻 Instalação

### 1. Instalar dependências básicas
```bash
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install -y curl git unzip fish
```

### 2. Obter o repositório
Escolha **um** dos métodos abaixo:

**Via HTTPS:**
```bash
git clone https://github.com/rafaelcesar0/my-fish-setup.git
```

**Via SSH:**
```bash
git clone git@github.com:rafaelcesar0/my-fish-setup.git
```

**Via Download:**
- [Baixar ZIP](https://github.com/rafaelcesar0/my-fish-setup/archive/refs/heads/main.zip)

### 3. Executar o script de instalação
```bash
# Acessar a pasta do repositório
cd my-fish-setup

# Dar permissão de execução ao script
chmod +x ./install.sh

# Executar o script
./install.sh
```

## 🛠️ Recursos instalados

O script instala e configura automaticamente:

- [Fish Shell](https://fishshell.com/) - Shell moderno e amigável
- [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish) - Gerenciador de pacotes para Fish
- [Starship](https://starship.rs/) - Prompt minimalista e rápido
- [Zoxide](https://github.com/ajeetdsouza/zoxide) - Navegação inteligente entre diretórios
- [FZF](https://github.com/junegunn/fzf) - Busca fuzzy no terminal
- [NVM](https://github.com/nvm-sh/nvm) - Gerenciador de versões Node.js
- [PNPM](https://pnpm.io/) - Gerenciador de pacotes Node.js alternativo
- [Bun](https://bun.sh/) - Runtime JavaScript all-in-one

## ❗ Solução de problemas

Se encontrar algum problema durante a instalação:

1. Verifique se todas as dependências foram instaladas corretamente
2. Certifique-se de que está usando o Fish Shell (`fish` no terminal)
3. Confira se tem permissões de sudo
4. Em caso de erros, tente executar o script novamente

## 📝 Contribuindo

Sinta-se à vontade para contribuir com este projeto! Abra uma issue ou envie um pull request.

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
