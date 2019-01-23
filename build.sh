#!/bin/bash

set -e

cd Iosevka
git clean -dfx
npm install
cp ../private-build-plans.toml .
npm run build -- ttf-unhinted:jozsika
cp -av build/jozsika/*.ttf ../output
