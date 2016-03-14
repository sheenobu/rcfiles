#!/bin/bash

function biggerthan() {
  find -size +$1
}

function smallerthan() {
  find -size -$1
}

function catf() {
  cat `find -iname $1`
}

function vif() {
  $EDITOR `find -iname $1`
}

function grepf() {
  grep $1 `find -iname $2`
}

function modifiednewthan() {
  find -mtime "+$1"
}

function modifiedolderthan() {
  find -mtime -$1
}

function nearf() {
  cd $(dirname `find -iname $1`)
}

function pnearf() {
  dirname `find -iname $1`
}

function timename() {
  mv -iv "$1" "$(basename $1 $2)-$(date +%Y-%m-%d_%H.%M)$2"
}

function cdf {
  cd `find -iname $1`
}
