#!/bin/bash

if [ ! -f '/var/swap.1' ]; then
	echo "Swap with size ${SWAP_SIZE}"
    /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=${SWAP_SIZE}
	/sbin/mkswap /var/swap.1
	/sbin/swapon /var/swap.1
fi
