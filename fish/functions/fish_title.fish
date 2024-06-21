function fish_title
    if [ $_ != fish ]
        echo (prompt_pwd)": $_"
    else
        echo (prompt_pwd)":"
    end
end
