# Skip greeting message
set fish_greeting

set SPACEFISH_PROMPT_ADD_NEWLINE false

# Essential tool initialization (load order matters)
if status is-interactive
    # Initialize starship prompt
    starship init fish | source

    # Initialize zoxide (smart directory jumper)
    zoxide init fish | source

    # Initialize fuzzy finder with custom options
    set -Ux FZF_DEFAULT_OPTS "
        --style full
        --preview 'batcat -n --color=always {}'
        --no-clear
    "
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
alias cat='batcat'
alias eza='eza --icons=always --color=always --long --git --no-filesize --no-time --no-user --no-permissions'
alias ls='eza'
alias cd='z'
