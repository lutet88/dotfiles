if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_config theme choose "Tomorrow Night"
fish_add_path -m ~/.local/bin
fish_add_path -m ~/.lc3
zoxide init fish --cmd cd | source

function fish_greeting
    echo Welcome (set_color FF5F05)lutet(set_color normal)!
    echo It is (set_color A386C9; date +%c; set_color normal)
end

source ~/.bashrc_fish
alias mc=micro
