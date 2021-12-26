#!/bin/bash

# https://github.com/Ultimaker/cura-build-environment.git

sudo apt install -y gfortran python3-sip-dev python-sip-dev freetype2-demos ^libfreetype6.* "^libxcb.*" libx11-xcb-dev \
                    libglu1-mesa-dev libxcb-xkb-dev "^libxcb.*" libx11-xcb-dev libglu1-mesa-dev libxrender-dev \
                    libfbclient2 libodbc1 libpq5 libsybdb5 libgles2-mesa-dev libxext-dev libinput-dev libxkbcommon-dev libfontconfig1-dev \
                    libfontconfig-dev libxcb-xinerama0-dev '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev \
                    flex bison gperf libicu-dev libxslt-dev ruby libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev \
                    libxrandr-dev libdbus-1-dev libfontconfig1-dev libcap-dev libxtst-dev libpulse-dev libudev-dev libpci-dev \
                    libasound2-dev libxss-dev libegl1-mesa-dev gperf bison "^libxcb1.*" libffi-dev \
                    python3-sip-dev python-sip-dev patchelf python3-sip python-sip python-pyqt5 python3-pyqt5 \
                    python-enum34

sudo pip install PyQt5==5.13.2 PyQt5-sip sip enum34
sudo pip3 install PyQt5==5.13.2 PyQt5-sip sip enum34

mkdir -p build
cd build
#cmake .. -DCMAKE_INSTALL_PREFIX=/home/$USER/cura-build-env -DCMAKE_BUILD_TYPE=Release -DSIP_MODULE_NAME=sip -DCURA_ARCUS_BRANCH_OR_TAG=4.4
cmake .. \
    -DCMAKE_INSTALL_PREFIX=/home/$USER/cura-build-env \
    -DCMAKE_BUILD_TYPE=Release \
    -DCURA_ARCUS_BRANCH_OR_TAG=4.4 \
    -DCURA_SAVITAR_BRANCH_OR_TAG=3.6
make
