if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_config theme choose "Rosé Pine Moon"

    #Aliases sorted properly

    # DESI
    alias desimnt="sshfs vivien@perlmutter.nersc.gov:/global/cfs/cdirs/desi/ ~/mnt"

    #Onedrive management
    alias monitor='onedrive --monitor'
    alias drivesync='onedrive --synchronize' #NOTE: -d was removed from the end so if it stops working blame that

    #Utilities
    alias configure="./configure && make && sudo make install"
    alias pingtest='ping www.google.com -c 3'
    alias copy='git clone'
    alias enes="trans -s en -t es"
    alias esen="trans -s es -t en"
    alias clip="xclip -selection c"

    # Python
    alias prp="pipenv run python"
    alias pyscratch="e ~/experiments/pythonia/scratch.py"
    alias pinstall="pip install --user --break-system-packages"
    alias py="ipython"
    alias ipy='ptipython'

    alias killscreen="sudo brightnessctl s 0"
    alias screenup="sudo brightnessctl s 40"

    # Emacs
    alias E="sudoedit"
    alias e="~/bin/eclient"
    alias newdoom="doom sync && systemctl restart --user emacs"
    alias enw="emacsclient -nw"


    alias nemosu="pwd|xargs sudo nemo &"
    alias nemohere="pwd|xargs nemo &" #


    alias man='batman'
    alias l="/usr/bin/less -r"
    alias o="xdg-open"
    alias ka="killall"
    alias epubgrep="unzip -p '*.epub' | grep -a --color"
    alias sc="systemctl"
    alias r="ranger"
    # alias cat='bat'
    # alias diff = 'batdiff'
    # alias bg = 'batgrep'

    #Spotify
    alias spotpause="playerctl --player spotify pause"
    alias spotnext="playerctl --player spotify next"
    alias spotprev="playerctl --player spotify previous"
    alias spotplay="playerctl --player spotify play"
    alias spottoggle="playerctl --player spotify play-pause"
    alias pauseall="playerctl --all-players pause"

    #Debian/mint
    alias apt='sudo apt'
    alias sapt='sudo apt'
    alias inscribe="sudo add-apt-repository"
    #alias purge="sudo apt autoremove && sudo apt clean"
    alias aptinfo="apt-cache show"

    #Manjaro
    alias pac='/usr/bin/pacman'
    alias summon="sudo --preserve-env=pacman_program pacman -S"
    alias exterminate="sudo --preserve-env=pacman_program pacman -Rs"
    alias purge="sudo --preserve-env=pacman_program pacman -Qdtq"
    alias update="pacman -Qu"
    alias upgrade="sudo --preserve-env=pacman_program pacman -Syu"
    alias pacinfo="pacman -Si"
    alias pacsearch="pacman -Ss"
    alias rosettav="o ~/Downloads/pacrosetta.html"
    alias rosettaw="w3m ~/Downloads/pacrosetta.html"
    alias ypac='env pacman_program="/usr/bin/pacman" yay'
    alias ysummon="ypac -S"
    alias yupgrade="ypac -Syu"
    alias yinfo="ypac -Si"
    alias ysearch="ypac -Ss"

    #Fun
    alias pyscp='python ~/experiments/pythonia/scp-scraper.py' #FIXME
    alias supercalli='echo supercalifragilisticexpialidocious'
    alias commitstrip='$BROWSER "http://www.commitstrip.com/en/?random=1"'
    alias exeunt='exit'
    alias fortunes='ls "/usr/share/fortune" | fgrep dat'
    #alias pycharm="sudo bash $HOME/.local/share/umake/ide/pycharm/bin/pycharm.sh"

    #Files
    alias zconf="e ~/.zshrc"
    alias xconf="e ~/.xonshrc"
    # alias "rm -rf"="echo Bad Idea"



    # Env Vars
    export LESSOPEN="| batpipe"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"

    export PATH="/home/vivien/go/bin:$PATH"
    export PATH="/home/vivien/.local/bin:$PATH"
    export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
    export PATH="$HOME/.pub-cache/bin:$PATH"
    export PATH="$HOME/.cargo/bin:$PATH"
    export PATH="/usr/local/opt/texinfo/bin:$PATH"
    export PATH="$HOME/.local/share/umake/ide:$PATH"
    export PATH="$HOME/bin:/usr/local/bin:$PATH"
    export PATH="/usr/racket:$PATH"
    export PATH="$HOME/experiments/pythonia:$PATH"
    export PATH="$HOME/usr/local/bin:$PATH"
    export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
    export PATH="$HOME/.config/emacs/bin:$PATH"
    export PATH="$HOME/.idris2/bin:$PATH"
    export PATH="$HOME/.yarn/bin:$PATH"
    export PATH="$HOME/drive/work/langs/roc/roc-nightly:$PATH"

    export WINEARCH="win64"
    export WINEPATH="/usr/bin"
    export WINEPREFIX="$HOME/.wine"
    # export PATH="$WINEPATH:$PATH"

    export MANPATH="$HOME/anaconda3/share/man:$HOME/funny-manpages:/usr/share/man:$MANPATH"
    # $EDITOR should open in terminal
    # export BROWSER='/usr/bin/firefox'
    export EDITOR="/home/vivien/bin/eclient"
    export SUDO_EDITOR="emacsclient -c"
    # $VISUAL opens in GUI with non-daemon as alternate
    export VISUAL="/home/vivien/bin/eclient"
    export TERMINAL='tilix'
    export GRAVEYARD="$HOME/.local/share/Trash"
    export TEXT_AID_TOO_EDITOR="emacsclient -c"
    export TEXT_AID_TOO_SECRET="HELLO-WORLD"
    export SAVEHIST=1000
    export FOREIGN_ALIASES_SUPPRESS_SKIP_MESSAGE=True
    # export pacman_program="/usr/bin/powerpill"

    # DESI ROOT
    export DESIROOT="$HOME/d/urap/data"
    export DESI_SPECTRO_REDUX="$HOME/d/urap/data"
    export DESI_API_CONFIG_FILE="$HOME/d/urap/desiapi/etc/docker/config.toml"
    # export RR_TEMPLATE_DIR="$HOME/d/urap/libs/redrock/py/redrock/templates"
    export RR_TEMPLATE_DIR="$HOME/d/urap/libs/redrock/py/redrock/templates"

    export PYTHONPATH="$HOME/drive/work/urap/desiapi/py:$PYTHONPATH"
    export PATH="$HOME/drive/work/urap/desiapi/bin:$PATH"


    starship init fish | source

end
