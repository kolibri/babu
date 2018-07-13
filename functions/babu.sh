#!/bin/bash

set -ex

BUILD_DIR=/tmp/build

# tl:dr 
# + Very simple and leightweight.
# - You will get naming conflicts

# define build steps as functions
# functions may not be named as existing commands/tools.
# so result may be a tool agnostic build dsl :)

# import functions from another file
source ./scripts/install.sh

function test {
    ./vendor/bin/simple-phpunit
}

function server {
    ./bin/console server:start
}

function all {
    install
    test
    server
}

if [ $# -lt 1 ]
then
    echo "Usage : $0 task [extra options]"
    exit
fi

# checking if first argument is a function
if [ -n "$(type -t ${1})" ] && [ "$(type -t ${1})" = function ]; 
then
    `$1`
else 
    echo $1 is NOT a function; 
    exit 1
fi

set +ex
