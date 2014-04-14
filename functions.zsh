# encryption/decryption
function encrypt() {
    openssl des3 -salt -in $1 -out $2
}
function decrypt() {
    openssl des3 -d -salt -in $1 -out $2
}

# 
function speedtest() {
  wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test100.zip
}

#
function s() {
    if [[ $# -eq 0 ]]; then
        subl .
    else
        subl "$@"
    fi
}

function gitio() {
    if [ -z "${1}" -o -z "${2}" ]; then
        echo "Usage: \`gitio slug url\`"
        return 1
    fi
    curl -i http://git.io/ -F "url=${2}" -F "code=${1}"
}

# Use Git’s colored diff when available
hash git &>/dev/null
if [[ $? -eq 0 ]]; then
    function diff() {
        git diff --no-index --color-words "$@"
    }
fi

# Determine size of a file or total size of a directory
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh
    else
        local arg=-sh
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@"
    else
        du $arg .[^.]* *
    fi
}

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
function targz() {
    local tmpFile="${@%/}.tar"
    tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1

    size=$(
        stat -f"%z" "${tmpFile}" 2> /dev/null; # OS X `stat`
        stat -c"%s" "${tmpFile}" 2> /dev/null # GNU `stat`
    )

    local cmd=""
    if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
        # the .tar file is smaller than 50 MB and Zopfli is available; use it
        cmd="zopfli"
    else
        if hash pigz 2> /dev/null; then
            cmd="pigz"
        else
            cmd="gzip"
        fi
    fi

    echo "Compressing .tar using \`${cmd}\`..."
    "${cmd}" -v "${tmpFile}" || return 1
    [ -f "${tmpFile}" ] && rm "${tmpFile}"
    echo "${tmpFile}.gz created successfully."
}

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}
