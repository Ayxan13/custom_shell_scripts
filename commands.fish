#!/usr/bin/fish

# Add this line to ~/.config/fish/config.fish
#   source path/to/this/dir/commands.fish
# For example:
#   source "$HOME/src/custom_shell_scripts/commands.fish"


function osName
    echo (grep '^NAME=' /etc/os-release | cut -d '"' -f 2)
end

function makeSysup
    if type -q dnf
        set installer "dnf"
    else
        set installer "apt"
    end

    if type -q snap
        set snapRefresh "snap refresh"
    else
        set snapRefresh "true"
    end
    echo "sudo $snapRefresh && sudo $installer update -y && sudo $installer upgrade -y && sudo $installer autoremove -y"
end

abbr -a sysup "$(makeSysup)" # Update the system

functions -e osName
functions -e makeSysup

for script in $(dirname $(status --current-filename))/scripts/*.fish
    source $script
end
