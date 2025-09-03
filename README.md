# My _`fish-shell`_ Setup

My ***Fish*** shell setup for ***Ubuntu*** and ***Debian*** includes:

[`oh-my-fish`](https://github.com/oh-my-fish/oh-my-fish)
[`starship`](https://starship.rs)
[`zoxide`](https://github.com/ajeetdsouza/zoxide)
[`fzf`](https://github.com/junegunn/fzf)
[`eza`](https://github.com/eza-community/eza)
[`bat`](https://github.com/sharkdp/bat)
[`nvm`](https://github.com/nvm-sh/nvm)
[`pnpm`](https://pnpm.io)
[`bun`](https://bun.sh)
[`uv`](https://docs.astral.sh/uv)
[`docker`](https://docs.docker.com/engine)


## Install Basic Tools `curl` `git` [`fish-shell`](https://github.com/fish-shell/fish-shell) [`oh-my-fish`](https://github.com/oh-my-fish/oh-my-fish)

```sh
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

### For detailed installation instructions, see [fish-setup-guide.md](https://github.com/rafaelcesar0/my-fish-setup/blob/main/docs/fish-setup-guide.md)

## Configure `git` (optional)

```sh
# Set default branch
git config --global init.defaultBranch main

# Set your credentials
git config --global user.name "your_github_username"
git config --global user.email "your_github_email"
```

## Configure `SSH` (optional)

```sh
# Create SSH key
mkdir -p ~/.ssh
ssh-keygen -t rsa -C "your_github_email" -N "" -f ~/.ssh/id_rsa

# Start SSH agent
eval "$(ssh-agent -s)"

# Display public key (add this key to GitHub)
cat ~/.ssh/id_rsa.pub
```
