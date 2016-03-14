#!/bin/bash

function biggerthan() {
  gfind -size +$1
}

function smallerthan() {
  gfind -size -$1
}

function catf() {
  cat `gfind -iname $1`
}

function vif() {
  $EDITOR `gfind -iname $1`
}

function grepf() {
  grep $1 `gfind -iname $2`
}

function modifiednewthan() {
  gfind -mtime "+$1"
}

function modifiedolderthan() {
  gfind -mtime -$1
}

function nearf() {
  cd $(dirname `gfind -iname $1`)
}

function pnearf() {
  dirname `gfind -iname $1`
}

function timename() {
  mv -iv "$1" "$(basename $1 $2)-$(date +%Y-%m-%d_%H.%M)$2"
}

function cdf {
  cd `gfind -iname $1`
}
