#!/bin/sh
PREFIX=/usr
MAKE=make
SUDO=sudo

# https://raw.githubusercontent.com/sroberts/peid4yara/master/peid.yar
#if [ ! -f shlr/yara/peid.yar ]; then
#(
#	cd shlr/yara
#	wget -c http://radare.org/get/peid.yar.gz
#	gunzip peid.yar.gz
#)
#fi

rm -rf yara
git clone https://github.com/plusvic/yara.git || exit 1
cd yara || exit 1
sh bootstrap.sh
./configure --prefix=${PREFIX} || exit 1
${MAKE} || exit 1
exec ${SUDO} ${MAKE} install
