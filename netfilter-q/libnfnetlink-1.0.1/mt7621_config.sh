#!/bin/sh

ToolChainPrefix="mipsel-linux-"

ConfigOpt="--host=arm-linux --target=arm-linux --build=i686-pc-linux"

CC=${ToolChainPrefix}gcc
CXX=${ToolChainPrefix}c++
CPP=${ToolChainPrefix}cpp
LD=${ToolChainPrefix}ld
AR=${ToolChainPrefix}ar
STRIP=${ToolChainPrefix}strip
RANLIB=${ToolChainPrefix}ranlib
CFLAGS="-O2 -fomit-frame-pointer -pipe -Os"

env CC=$CC \
env CFLAGS="$CFLAGS" \
./configure  --host=mipsel-linux --target=mipsel-linux --build=i686-pc-linux

