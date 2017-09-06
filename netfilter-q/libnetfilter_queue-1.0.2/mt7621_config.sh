#!/bin/sh

ToolChainPrefix="mipsel-linux-"
ToolChainBin="/opt/buildroot-gcc463/usr/bin"
ToolChainInclude="/opt/buildroot-gcc463/usr/bin/include"
ToolChainLib="/opt/buildroot-gcc463/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib"

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
env LIBNFNETLINK_CFLAGS="-I${USERAPPS_ROOT}/netfilter-q/libnfnetlink-1.0.1/include" \
env LIBNFNETLINK_LIBS="-L${USERAPPS_ROOT}/netfilter-q/libnfnetlink-1.0.1/src/.libs" \
env LIBMNL_CFLAGS="-I${USERAPPS_ROOT}/netfilter-q/libmnl-1.0.4/include" \
env LIBMNL_LIBS="-L${USERAPPS_ROOT}/netfilter-q/libmnl-1.0.4/src/.libs" \
./configure  --host=mipsel-linux --target=mipsel-linux

