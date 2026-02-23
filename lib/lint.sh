#!/bin/sh

sh_lint() {
    scripts="$1"

    check_command "shellcheck"

    ci_msg_section "Running linter ..."

    for s in $scripts; do
        shellcheck -x "$s"
    done
}
