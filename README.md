# My Fish Setup

This is the automation of my fish shell configurations and the technology I use in my daily life as soon as I install Linux.

### Configuring Git (optional)

```bash
git config --global init.defaultBranch main
git config --global user.name "your_github_username" # Input your github username
git config --global user.email "your_github_email" # Input your github email
```

### Create SSH key (optional)

```bash
mkdir -p ~/.ssh
ssh-keygen -t rsa -C "your_github_email" -N "" -f ~/.ssh/id_rsa # replace "your_github_email"
# Starting the SSH agent
eval "$(ssh-agent -s)"
# Printing SSH public key
cat ~/.ssh/id_rsa.pub
```


## Installs

<!-- ### [Fish Shell](https://github.com/fish-shell/fish-shell) and [Oh-My-Fish](https://github.com/oh-my-fish/oh-my-fish) -->

```sh
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install -y curl git unzip fish
```

Command: `fish`

```sh
chsh -s (which fish)
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

```sh
# Instala Bass
omf install bass
```

```sh
# Instala Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y
mkdir -p ~/.config
cp -f "$PWD/config/starship.toml" ~/.config/
```

```sh
# Instala Zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
```

```sh
# Instala FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
```

```sh
# Instala NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
```

```sh
# Configurar Fish
mkdir -p ~/.config/fish
cp -f "$PWD/config/config.fish" ~/.config/fish/
```

Command: `exec fish`

```sh
# Instala Node LTS
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'
npm update -g npm
```

```sh
# Instala PNPM
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

```sh
# Instala Bun
curl -fsSL https://bun.sh/install | bash
```

Command: `exec fish`

## Download repository

### HTTPS

```bash
git clone https://github.com/rafaelcesar0/my-fish-setup.git
```
### or SSH

```bash
git clone git@github.com:rafaelcesar0/my-fish-setup.git
```
### or <b><u>[download ZIP](https://github.com/rafaelcesar0/my-fish-setup/archive/refs/heads/main.zip)</u></b>


## 3. Run the [*install.sh*](https://github.com/rafaelcesar0/my-fish-setup/blob/main/install.sh) script

```bash
cd "$(pwd)/my-fish-setup" # Access the repository folder
chmod +x ./install.sh # Permission to run the script
./install.sh # Run script
```
