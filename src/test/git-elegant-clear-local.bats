#!/usr/bin/env bats -ex

load addons-common
load addons-read
load addons-fake

setup() {
    fake-pass git "branch -lvv" "first [gone]"
    fake-pass git "elegant pull master"
    fake-pass git "branch -d first"
}

teardown() {
    clean-fake
}

@test "exit code is 0 when run 'git-elegant clear-local'" {
  run git-elegant clear-local
  [ "$status" -eq 0 ]
}
