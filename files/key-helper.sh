#!/bin/bash

for CONTAINER in $(ls -1 /var/lib/lxc); do
	echo "Copying id_rsa.pub to ${CONTAINER}"
	mkdir -p "/var/lib/lxc/${CONTAINER}/rootfs/root/.ssh" && \
	cp ~/.ssh/id_rsa.pub "/var/lib/lxc/${CONTAINER}/rootfs/root/.ssh/authorized_keys" && \
	chown 0600 "/var/lib/lxc/${CONTAINER}/rootfs/root/.ssh" && \
	chown 0400 "/var/lib/lxc/${CONTAINER}/rootfs/root/.ssh/authorized_keys";
done
