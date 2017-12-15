#!/usr/bin/env bats

load addons-common
load addons-fake

setup() {
    fake-pass git "fetch --tags"
    fake-pass git "rebase origin/master"
}

teardown() {
    clean-fake
}

@test "exit code is 0 when run 'git-elegant rebase'" {
    run git-elegant rebase
    [ "$status" -eq 0 ]
}
