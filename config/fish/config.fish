if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_config theme choose "Tomorrow Night"

function fish_greeting
    echo Welcome (set_color FF5F05)lutet(set_color normal)!
    echo It is (set_color A386C9; date +%c; set_color normal)
end

source ~/.bashrc_fish
alias mc=micro
