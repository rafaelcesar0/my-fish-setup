# Skip greeting message
set fish_greeting

set SPACEFISH_PROMPT_ADD_NEWLINE false

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
alias eza='eza --color --long --git --no-filesize --icons --no-time --no-user --no-permissions'
alias ls='eza'
alias cd='z'