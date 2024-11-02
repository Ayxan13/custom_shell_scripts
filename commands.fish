#!/usr/bin/fish

# Copy into ~/.config/fish/config.fish


# Update the system
abbr -a sysup "sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y"


for script in $(dirname $(status --current-filename))/scripts/*.fish
    source $script
end
