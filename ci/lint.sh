#!/bin/sh -e

. ./sh-ci

pkg_deb_update
pkg_deb_install "shellcheck"

for f in $(ls "$SH_CI_DIR"/lib/*) "$SH_CI_DIR"/sh-ci $0; do
    real_f="$(realpath "$f")"
    sh_lint "$real_f"
done
