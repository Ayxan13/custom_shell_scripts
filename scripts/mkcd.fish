function mkcd -a path
    # Usage: mkdir <path>
    # Behaves like mkdir <path> && cd <path>

    mkdir $path && cd $path
end