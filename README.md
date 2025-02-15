# My Fish Setup

This is the automation of my fish shell configurations and the technology I use in my daily life as soon as I install Linux.

## Pre Settings

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
cd ./my-fish-setup # Access the repository folder
chmod +x ./install.sh # Permission to run the script
./install.sh # Run script
```
