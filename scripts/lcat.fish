function lcat -a path
    # Usage: lcat <path>
    # Behaves like `ls` if `path` is a directory, and `bat`/`cat` if
    # `path` is a file.

    if test -d $path
        ls -lvF $path
    else
        if type -q batcat
            batcat $path
        else
            cat $path
        end
    end
end