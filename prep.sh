#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function prep () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  local SELFPATH="$(readlink -m -- "$BASH_SOURCE"/..)"
  cd -- "$SELFPATH" || return $?

  echo '%%env'
  env | sort --version-sort
  echo '%%out'
  ( echo 'c=64'
    echo 'j={}'
    echo 'm<<.
      [
      ]'$'\n.'
  ) | tee --append -- "$GITHUB_OUTPUT" | nl -ba

  echo '%%end'
}










prep "$@"; exit $?
