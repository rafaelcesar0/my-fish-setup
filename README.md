# My Fish Setup

This is the automation of my fish shell configurations and the technology I use in my daily life as soon as I install Linux.

```sh
sudo apt update && sudo apt upgrade -y
```

### Install Git, Curl and Wget

```sh
sudo apt install -y git curl wget
```

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

```sh
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish &&
fish &&
chsh -s (which fish) &&
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```
Close terminal

```sh
omf install bass

curl -sS https://starship.rs/install.sh | sh

mkdir -p ~/.config
cp -f "$SCRIPT_DIR/config/starship.toml" ~/.config/

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

mkdir -p ~/.config/fish
cp -f "$SCRIPT_DIR/config/config.fish" ~/.config/fish/

function nvm
    bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
end

nvm install --lts
nvm use --lts
nvm alias default 'lts/*'
npm update -g npm

curl -fsSL https://get.pnpm.io/install.sh | sh -

sudo apt install -y unzip
curl -fsSL https://bun.sh/install | bash

fish_add_path $HOME/.local/bin $HOME/.nvm $HOME/.bun/bin

echo "✓ Configuração concluída! Por favor, reinicie o terminal para aplicar as mudanças."

```

<!-- ## Download repository

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
cd "$(pwd)/my-fish-setup" && # Access the repository folder
chmod +x ./install.sh && # Permission to run the script
./install.sh # Run script
``` -->
