function fish_prompt
    if test -n "$SSH_TTY"
        echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)' '
    end

    echo -n (set_color blue)(prompt_pwd)' '

    set_color -o
    if fish_is_root_user
        echo -n (set_color red)'# '
    end
    echo -n (set_color purple)"$USER"  🏳️‍⚧️ (set_color yellow)'❯'(set_color white)'❯'(set_color purple)'❯'(set_color black)'❯'
    set_color normal
end
