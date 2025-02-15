if status is-interactive
    # Inicializando ferramentas
    starship init fish | source
    zoxide init fish | source
    fzf --fish | source

    # Removendo mensagem de boas-vindas do Fish
    set fish_greeting

    # Opções padrão do FZF
    set -Ux FZF_DEFAULT_OPTS "
        --height 40%
        --layout=reverse
        --border
        --info=inline
    "

    # Aliases úteis
    alias i='sudo apt install'
    alias i-get='sudo apt-get install'
    alias upd='sudo apt update && sudo apt upgrade -y'
    alias mkdir='mkdir -pv'
    alias f5='source ~/.config/fish/config.fish'
    alias cls='clear'
    alias clean='sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get clean'
    alias fishrc='code ~/.config/fish/config.fish'
end

# Configuração do PATH
set -Ux fish_user_paths $HOME/bin $HOME/.local/bin /usr/local/bin $fish_user_paths

# Função para usar NVM no Fish via Bass
function nvm
    bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
    nvm use default
end
