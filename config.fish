function fish_greeting
    ~/Documents/term_messages
    alias pmang ~/devel/proj-mgr/pmang
    alias ... "cd ../.."
    alias .2 "cd ../.."
    alias .3 "cd ../../.."
    alias .4 "cd ../../../.."
    alias .5 "cd ../../../../.."
    alias config_fish "code /home/dawid/.config/fish"
    alias edit code
end

function fish_prompt
    set -l last_pipestatus $pipestatus
    set -l normal (set_color normal)
    set -l red (set_color red)
    set -l yellow (set_color yellow)
    set -l green (set_color green)
    set -l blue (set_color blue)
    set -l purple (set_color purple)

    set -l suffix '$'
    if contains -- $USER root toor
        set suffix '#'
    end

    set -l color_host $fish_color_host
    if set -q SSH_TTY
        set color_host $fish_color_host_remote
    end

    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" (set_color $fish_color_status) (set_color --bold $fish_color_status) $last_pipestatus)

    echo -n -s  $prompt_status $red '[' $yellow $USER $green '@' $blue (prompt_hostname) ' ' $purple (prompt_pwd) $red ']' $normal $suffix ' '
end