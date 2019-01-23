# Jozsika font

This is just a specialized automated build of Iosevka:
  - everything is Iosevka Term, so no ligations
  - only Regular, Bold and Bold Italic edition
  - Regular's reported weight: 400, real weight: 300
  - Bold's reported weight: 700, real weight: 500

For build dependencies, see:
https://gist.github.com/cowboy/f494f3ae6db9cbb0fb6450a395895281

I did this on Debian Sid at 2019-01-23:

    sudo apt update ; sudo apt install build-essential curl ttfautohint npm nodejs
    mkdir /tmp/jozsika-depends
    cd /tmp/jozsika-depends
    curl -sLo premake5.tar.gz https://github.com/premake/premake-core/releases/download/v5.0.0-alpha11/premake-5.0.0-alpha11-linux.tar.gz
    tar xvf premake5.tar.gz && sudo mv premake5 /usr/local/bin/ && rm premake5.tar.gz
    curl -sLo otfcc.tar.gz https://github.com/caryll/otfcc/archive/v0.9.6.tar.gz
    tar xvf otfcc.tar.gz && mv otfcc-0.9.6 otfcc
    cd otfcc
    premake5 gmake && cd build/gmake && make config=release_x64
    cd ../../bin/release-x64
    sudo cp otfccbuild otfccdump /usr/local/bin/
    cd /
    rm -rf /tmp/jozsika-build

When all build dependencies are installed, you can use `./build.sh` to build!