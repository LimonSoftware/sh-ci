#!/bin/sh

ci_msg_section() {
    if [ "${CI:-false}" = "true" ]; then
        echo "--- $*"
    else
        echo "$@"
    fi
}

ci_msg_subsection() {
    if [ "${CI:-false}" = "true" ]; then
        echo "~~~ $*"
    else
        echo "  $*"
    fi
}

ci_msg() {
    if [ "${CI:-false}" = "true" ]; then
        echo "$@"
    else
        echo "    $*"
    fi
}

ci_workaround_dir() {
    dir="$1"

    if [ ! -d "$dir" ]; then
        ci_msg_subsection "Adding $dir ..."
        sudo mkdir -p "$dir"
    fi

    if [ ! -O "$dir" ]; then
        ci_msg_subsection "Fixing $dir perms ..."
        root_command chown "$(id -u):$(id -g)" "$dir"
    fi
}
