# My *`fish-shell`* Setup

Meu setup **modular** para terminal **`Ubuntu/Debian`** com instalação personalizada.

## 💻 Dependências básicas

Instalando e configurando `curl` `git` `unzip` + [`fish-shell`](https://github.com/fish-shell/fish-shell) como default

```bash
sudo apt-add-repository ppa:fish-shell/release-4
sudo apt update
sudo apt install -y curl git unzip fish

chsh -s $(which fish)
```

Config Git (opcional)

```bash
# Configurar branch padrão
git config --global init.defaultBranch main

# Configurar suas credenciais
git config --global user.name "seu_usuario_github"
git config --global user.email "seu_email_github"
```

Config SSH (opcional)

```bash
# Criar chave SSH
mkdir -p ~/.ssh
ssh-keygen -t rsa -C "seu_email_github" -N "" -f ~/.ssh/id_rsa

# Iniciar o agente SSH
eval "$(ssh-agent -s)"

# Exibir a chave pública (adicione esta chave no GitHub)
cat ~/.ssh/id_rsa.pub
```
## 📜 Instalação Modular

### ⬇️ Download do repositório

Baixe o repositório via `git clone` ou [`Download ZIP`](https://github.com/rafaelcesar0/my-fish-setup/archive/refs/heads/main.zip) e execute:

```bash
# Acessar a pasta do repositório
cd my-fish-setup

# Dar permissão de execução ao script
chmod +x ./install.fish

# Executar o instalador interativo
./install.fish
```

### 🎯 Opções de Instalação

O novo sistema oferece **3 modos** de instalação:

1. **📦 Instalação Completa** - Instala todas as ferramentas
2. **🎨 Instalação Personalizada** - Escolha quais ferramentas instalar
3. **📋 Listar Ferramentas** - Veja o que está disponível

### ⚡ Instalação Manual (Legado)

Para usar o método anterior (instala tudo de uma vez):

```bash
# Usar o instalador legado
chmod +x ./install-legacy.fish
./install-legacy.fish
```

Ou instalação ultra-rápida:
```bash
chmod +x ./install-manual.sh
./install-manual.sh
```

## 🏗️ Arquitetura Modular

### 📁 Estrutura do Projeto

```
my-fish-setup/
├── install.fish              # 🎛️ Orquestrador principal (interativo)
├── install-legacy.fish       # 📦 Instalador antigo (completo)
├── install-manual.sh         # ⚡ Instalação rápida
├── scripts/                  # 🔧 Scripts individuais
│   ├── install-core-tools.fish  # bat, zoxide, fzf
│   ├── install-eza.fish         # eza (ls moderno)
│   ├── install-oh-my-fish.fish  # framework + plugins
│   ├── install-starship.fish    # prompt personalizado
│   ├── install-nvm.fish         # gerenciador Node.js
│   ├── install-pnpm.fish        # package manager
│   ├── install-bun.fish         # runtime JS
│   ├── install-docker.fish      # Docker Engine
│   └── install-uv.fish          # Python package manager
└── config/                   # ⚙️ Módulos de configuração
    ├── config-base.fish         # aliases e configs básicas
    ├── config-starship.fish     # inicialização starship
    ├── config-zoxide.fish       # inicialização zoxide
    ├── config-fzf.fish          # inicialização fzf
    ├── config-pnpm.fish         # PATH pnpm
    ├── config-bun.fish          # PATH bun
    ├── config-uv.fish           # PATH UV (Python)
    └── starship.toml            # tema starship
```

### ✨ Como Funciona

1. **`install.fish`** → Menu interativo para escolha
2. **Scripts individuais** → Instalam tecnologia específica  
3. **Módulos de config** → Combinados no `config.fish` final
4. **Resultado** → Setup personalizado baseado na seleção

## 🛠️ Recursos instalados

O script instala e configura automaticamente:

- [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)
- [starship](https://starship.rs/)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [fzf](https://github.com/junegunn/fzf)
- [eza](https://github.com/eza-community/eza)
- [bat](https://github.com/sharkdp/bat)
- [nvm](https://github.com/nvm-sh/nvm)
- [pnpm](https://pnpm.io/)
- [bun](https://bun.sh/)
- [Docker Engine](https://docs.docker.com/engine/)
- [UV](https://docs.astral.sh/uv/) (Python package manager)
