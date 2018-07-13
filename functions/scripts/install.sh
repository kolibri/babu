#!/bin/bash

function install {
    clearBuildDir
    checkout
    install-deps
}

function clearBuildDir {
    rm -rf ./vendor
}

function install-deps {
    composer install
}
