#!/bin/bash

LIBRARIES="aJson PubNub Temboo MQTTClient PubSubClient Firmata"
ARCHES="msp430 lm4f cc3200"
OSTYPE=`uname`

if [[ "$OSTYPE" == "Linux" ]]; then
	OS_PATH="../build/linux/work/hardware"
elif [[ "$OSTYPE" == "Darwin" ]]; then
	OS_PATH="../build/macosx/work/hardware"
	echo $OS_PATH
elif [[ "$OSTYPE" == *_NT-* ]]; then
	OS_PATH="../build/windows/work/hardware"
fi

for ARCH in $ARCHES
do
	echo $ARCH
	for LIBRARY in $LIBRARIES
	do
		rsync -av --exclude=".*" ../libraries/$LIBRARY $OS_PATH/$ARCH/libraries/ >/dev/null 2>&1
	done
done
