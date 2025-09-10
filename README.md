# My Fish Shell Setup

Complete Fish shell setup for **Ubuntu** and **Debian** with modern CLI tools.

## Included Tools

- [`oh-my-fish`](https://github.com/oh-my-fish/oh-my-fish) - Fish shell framework
- [`starship`](https://starship.rs) - Cross-shell prompt
- [`zoxide`](https://github.com/ajeetdsouza/zoxide) - Smart directory jumper
- [`fzf`](https://github.com/junegunn/fzf) - Fuzzy finder
- [`eza`](https://github.com/eza-community/eza) - Modern ls replacement
- [`bat`](https://github.com/sharkdp/bat) - Cat with syntax highlighting
- [`nvm`](https://github.com/nvm-sh/nvm) - Node version manager
- [`pnpm`](https://pnpm.io) - Fast package manager
- [`bun`](https://bun.sh) - JavaScript runtime
- [`uv`](https://docs.astral.sh/uv) - Python package installer
- [`docker`](https://docs.docker.com/engine) - Container platform

## Quick Start

### Install Basic Tools

```sh
sudo apt update && sudo apt upgrade -y

# curl + git
sudo apt install -y curl git

# fish-shell
sudo apt-add-repository ppa:fish-shell/release-4
sudo apt update
sudo apt install -y fish

# Set fish as default shell
chsh -s $(which fish)
```

```sh
# oh-my-fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

### Complete Installation Guide

For detailed installation instructions, see [fish-setup-guide.md](docs/fish-setup-guide.md)

## Optional Configuration

### Git Setup

```sh
# Set default branch
git config --global init.defaultBranch main

# Set your credentials
git config --global user.name "your_github_username"
git config --global user.email "your_github_email"
```

### SSH Setup

Create SSH key (Ed25519 - recommended for 2025):

```sh
mkdir -p ~/.ssh
ssh-keygen -t ed25519 -C "your_github_email" -f ~/.ssh/id_ed25519
```

Start SSH agent:

```sh
# Start SSH agent (works in both Fish and Bash)
ssh-agent -c | source || eval "$(ssh-agent -s)"

# Add key to SSH agent
ssh-add ~/.ssh/id_ed25519
```

Display public key (add this key to GitHub):

```sh
cat ~/.ssh/id_ed25519.pub
```
