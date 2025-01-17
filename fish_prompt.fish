function fish_prompt

    set_color -o yellow
    echo -n "User: "

    if functions -q fish_is_root_user; and fish_is_root_user
        set_color -o red
    else
        set_color -o blue
    end

    echo -n $USER
    set_color -o yellow
    echo -n \t "Host: "

    if test -z "$SSH_CLIENT"
        set_color -o cyan
    else
        set_color -o magenta
    end

    echo -n (prompt_hostname)

    set_color -o yellow
    echo -n \t "Time: "
    set_color magenta
    echo -n (date +%X)

    set_color -o yellow
    echo -n \t "Folder: "

    set_color -o green
    echo -n (prompt_pwd) \t

    echo    

    set_color -o green
    echo -n 'Command '

    set_color -o
    if fish_is_root_user
        echo -n (set_color red)'# '
    end
    echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    set_color normal
end
