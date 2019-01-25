#!/bin/bash

set -e

mkdir -p output

cd Iosevka-upstream
git clean -dfx
npm install
cp ../private-build-plans-jozsika.toml private-build-plans.toml
npm run build -- ttf-unhinted:jozsika
cd ..

cd Iosevka-nilcons
git clean -dfx
npm install
cp ../private-build-plans-jozsikanilcons.toml private-build-plans.toml
npm run build -- ttf-unhinted:jozsikanilcons
cd ..

cp -av Iosevka-upstream/build/jozsika/*.ttf Iosevka-nilcons/build/jozsikanilcons/*.ttf output
