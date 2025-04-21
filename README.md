# My *`fish-shell`* Setup

Meu setup para terminal **`Ubuntu/Debian`**.

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
## ✍️ Instale manualmente
[install-manual.sh](https://github.com/rafaelcesar0/my-fish-setup/blob/main/install-manual.sh)

## 📜 Script de instalação

### ⬇️ Download do repositório

Baixe o repositório via `git clone` ou [`Download ZIP`](https://github.com/rafaelcesar0/my-fish-setup/archive/refs/heads/main.zip) e execute:

```bash
# Acessar a pasta do repositório
cd my-fish-setup

# Dar permissão de execução ao script
chmod +x ./install.fish

# Executar o script
./install.fish
```

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
