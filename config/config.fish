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
    # global options
    set -Ux FZF_DEFAULT_OPTS "--style full --no-clear"
    # file preview
    set -Ux FZF_CTRL_T_OPTS "--preview 'batcat -n --color=always {}'"
    # command line history
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
alias eza='eza --color --long --git --no-filesize --icons --no-time --no-user --no-permissions'
alias ls='eza'
alias cd='z'

# pnpm
set -gx PNPM_HOME "/home/rafael/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
