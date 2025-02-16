if status is-interactive
    # Start Tools
    starship init fish | source
    zoxide init fish | source
    fzf --fish | source

    # Remove fish welcome message
    set fish_greeting

    # FZF Standard Options
    set -Ux FZF_DEFAULT_OPTS "
        --height 40%
        --layout=reverse
        --border
        --info=inline
    "

    # Useful Aliases
    alias i='sudo apt install'
    alias i-get='sudo apt-get install'
    alias upd='sudo apt update && sudo apt upgrade -y'
    alias mkdir='mkdir -pv'
    alias f5='source ~/.config/fish/config.fish'
    alias cls='clear'
    alias clean='sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get clean'
    alias fishrc='code ~/.config/fish/config.fish'
end

# PATH Configuration
set -Ux fish_user_paths $HOME/bin $HOME/.local/bin /usr/local/bin $fish_user_paths

# NVM
function nvm
  bass source $HOME/.nvm/nvm.sh --no-use ";" nvm $argv
end
set -x NVM_DIR ~/.nvm
nvm use default --silent
