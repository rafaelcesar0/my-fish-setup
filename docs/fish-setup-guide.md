# Fish Shell Development Environment Setup

This comprehensive guide provides step-by-step instructions for setting up a complete Fish shell development environment with modern tools and utilities.

## Install [`bat`](https://github.com/sharkdp/bat) [`zoxide`](https://github.com/ajeetdsouza/zoxide) [`fzf`](https://github.com/junegunn/fzf)

```sh
sudo apt install bat zoxide fzf -y

# Create symlink for bat command
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```

## Install [`eza`](https://github.com/eza-community/eza)

```sh
sudo apt update
sudo apt install -y gpg

sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
```

## Install [`starship`](https://starship.rs/)

```sh
curl -sS https://starship.rs/install.sh | sh
```
Configure starship.toml (optional):

```sh
cat > ~/.config/starship.toml << 'EOF'
add_newline = false
EOF
```

## Install [`nvm`](https://github.com/nvm-sh/nvm)

Install and integrate it with Fish:

```sh
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Install Oh My Fish plugin for nvm integration
omf install nvm

# Install and set Node.js LTS as default
nvm install --lts
nvm use --lts
nvm alias default "lts/*"
npm update -g npm
```

## Install [`pnpm`](https://pnpm.io/)

```sh
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

## Install [`bun`](https://bun.sh/)

```sh
sudo apt install -y unzip
curl -fsSL https://bun.sh/install | bash
```

## Install [`uv`](https://docs.astral.sh/uv/)

```sh
curl -LsSf https://astral.sh/uv/install.sh | sh
```

## Install Docker Engine
Follow the official installation guide for [`Ubuntu`](https://docs.docker.com/engine/install/ubuntu/) or [`Debian`](https://docs.docker.com/engine/install/debian/).

## Configure Fish Shell

Edit your Fish configuration file:

```sh
code ~/.config/fish/config.fish
```

Then copy and paste the following configuration:

```sh
# Skip greeting message
set fish_greeting

set SPACEFISH_PROMPT_ADD_NEWLINE false

# Essential tool initialization (load order matters)
if status is-interactive
    # starship
    starship init fish | source

    # zoxide
    zoxide init fish | source

    # fzf
    set -Ux FZF_DEFAULT_OPTS "--style full --no-clear"
    set -Ux FZF_CTRL_T_OPTS "--preview 'batcat -n --color=always {}'"
    set -Ux FZF_CTRL_R_OPTS ""
    fzf --fish | source
end

# aliases
alias i='sudo apt install'
alias i-get='sudo apt-get install'
alias upd='sudo apt update && sudo apt upgrade -y'
alias clean='sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get clean'
alias mkdir='mkdir -pv'
alias cls='clear'
alias f5='source ~/.config/fish/config.fish'
alias fishrc='code ~/.config/fish/config.fish'
alias bat='batcat'
alias ls='eza --color --long --git --no-filesize --icons --no-time --no-user --no-permissions'
alias cd='z'

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# uv
set -x PATH $HOME/.local/bin $PATH
```

After saving the configuration, reload your Fish shell:

```sh
source ~/.config/fish/config.fish
```
