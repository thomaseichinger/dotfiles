try_source() {
    if [[ -e $1 ]]; then
        source $1
    else
        [[  -z $2 ]] && $2 = "*W*"
        echo "$2: $1 couldn't be found!"
    fi
}