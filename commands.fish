#!/usr/bin/fish


for script in $(dirname $(status --current-filename))/scripts/*.fish
    source $script
end
