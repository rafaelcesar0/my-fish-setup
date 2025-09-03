# Initialize fuzzy finder with custom options
if status is-interactive
    # global options
    set -Ux FZF_DEFAULT_OPTS "--style full --no-clear"
    # file preview
    set -Ux FZF_CTRL_T_OPTS "--preview 'batcat -n --color=always {}'"
    # command line history
    set -Ux FZF_CTRL_R_OPTS ""
    fzf --fish | source
end