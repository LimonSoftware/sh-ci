#!/bin/sh

check_command() {
    cmd="$1"
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "ERROR: $cmd not found, please install it"
        echo "INFO: On Debian based distributions"
        echo "$ sudo apt install $cmd"
        exit 1
    fi
}

get_toprepo_url() {
    git config --get remote.origin.url
}

root_command() {
    if [ "$(whoami)" = "root" ]; then
# shellcheck disable=SC2068
        $@
    else
        check_command "sudo"
# shellcheck disable=SC2068
        sudo --preserve-env=DEBIAN_FRONTEND $@
    fi
}
