#!/bin/sh

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

pkg_deb_update() {
    ci_msg_subsection "Updating ..."
    root_command "apt-get update -y"
}

pkg_deb_install() {
    pkgs="$1"

    ci_msg_subsection "Installing dependencies $pkgs ..."
    root_command "apt-get install -y $pkgs"
}

pkg_gen_locale() {
    locale="${1:-en_US.UTF-8}"

    ci_msg_subsection "Generating locale ($locale) ..."
    root_command "locale-gen $locale"
}

pkg_pip_install() {
    pkgs="$1"

    ci_msg_subsection "Installing python (pip) $pkgs ..."
    root_command "pip3 install $pkgs"
}
