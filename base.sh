#!/bin/bash

# Every prototype needs it's basic setup.

set -ex

rm -rf ./vendor ./coverage
composer install -n
./vendor/bin/simple-phpunit --coverage-html=coverage
./bin/console server:start

set +ex
