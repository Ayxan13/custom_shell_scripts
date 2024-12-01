#!/usr/bin/fish

# Add this line to ~/.config/fish/config.fish
#   source path/to/this/dir/commands.fish
# For example:
#   source "$HOME/src/custom_shell_scripts/commands.fish"

set os_name (grep '^NAME=' /etc/os-release | cut -d '"' -f 2)

if test "$os_name" = "Fedora Linux"
    set installer "dnf"
else
    set installer "apt"
end

# Update the system

abbr -a sysup "sudo $installer update -y && sudo $installer upgrade -y && sudo $installer autoremove -y"

set -e os_name
set -e installer

for script in $(dirname $(status --current-filename))/scripts/*.fish
    source $script
end
