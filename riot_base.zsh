
export RIOTSUPER="$HOME/code/RIOT"
export RIOT="$RIOTSUPER/RIOT"
export boards="$RIOT/boards"
export projects="$RIOTSUPER/projects"
export MAKE=`which make`

none="none"

# init board environment
board_env_init() {}

##
# init RIOT dev environment
riot_init() {}

##
# functionality regarding devices
riot_manage_ports() {
    case $1 in
        is )
            ;;
        reset )
            export PORT=""
            ;;
        set )
            [[ -z $2 && ! -e $2 ]] && echo "plese specify port" && $2 = ""
            export PORT=$2
            ;;
        list )
            find /dev -name '*tty.*' 2>/dev/null | egrep '.usb'
            ;;
        * )
            echo "Please choose between list|set"
            return 1
            ;;
    esac
    echo "PORT set to ${PORT:-none}"
    return 0
}

# set QUIET env variable
riot_manage_quiet() {
    if [[ "${1:l}" == "true" || "$1" == "1" ]]; then
        export QUIET=1
    elif [[ "${1:l}" == "false" || "$1" == "0" ]]; then
        export QUIET=0
    else
        echo "Varaible QUIET is currently set to $QUIET"
    fi
}

riot_manage_board() {
    lBOARDS=`find $boards -type d -depth 1 -exec basename -s -a {} ";" | grep -v common`

    case $1 in
        is )
            echo "BOARD is ${BOARD:-none}"
            return 0
            ;;
        reset )
            export BOARD=""
            echo "env BOARD set to ${BOARD:-none}"
            return 0
            ;;
        list )
            echo "  List of available boards:"
            echo "$lBOARDS"
            return 0
            ;;
        set )
            for lBOARD in `echo $lBOARDS`; do
                if [[ "${2:u}" == "${lBOARD:u}" ]]; then
                    export BOARD=$lBOARD
                    echo "env BOARD set to $BOARD"
                    return 0
                fi
            done

            echo "Sorry, $2 not found."
            echo "  List of available boards:"
            echo "$lBOARDS"
            return 1
            ;;
    esac
    echo "Cmd $1 not found. Available list|set"
    return 1
}

# RIOT stuff
riot() {
    case "${1:u}" in
        RIOT|THIRDPARTY_CPU|THIRDPARTY_BOARDS )
            cd $RIOTSUPER/$1
            ;;
        ENV )
            case "${2:u}" in
                PORTS )
                    riot_manage_ports $3 $4
                    ;;
                BOARD )
                    riot_manage_board $3 $4
                    ;;
                QUIET )
                    riot_manage_quiet $3
                    ;;
                * )
                    echo "Sorry $2 not known"
                    return 2
                    ;;
            esac
            ;;
        * )
            echo "Sorry $1 not known."
            return 1
            ;;
    esac
}

export PATH=/usr/local/gcc-arm-none-eabi-4_8-2013q4/bin:$PATH

#if [[ -e "$RIOTSUPER/tftp.zsh" ]]; then
#    source "$RIOTSUPER/tftp.zsh"
#fi
