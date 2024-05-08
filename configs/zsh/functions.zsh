
function confirm() {
    local answer
    echo -ne "You're sure you want to run ${RED}$* ${NC}? ${yellow}[yN] "
    read -q answer
        echo
    if [[ "${answer}" =~ ^[Yy]$ ]]; then
        command "${@}"
    else
        return 1
    fi
}

function confirm_wrapper() {
    if [ "$1" = '--root' ]; then
        local as_root='true'
        shift
    fi

    local prefix=''

    if [ "${as_root}" = 'true' ] && [ "${USER}" != 'root' ]; then
        prefix="sudo"
    fi
    confirm ${prefix} "$@"
}

poweroff() { confirm_wrapper $0 "$@"; }
reboot() { confirm_wrapper $0 "$@"; }
hibernate() { confirm_wrapper $0 "$@"; }

