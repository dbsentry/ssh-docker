#!/bin/bash -e
#############################################################################
#                       Confidentiality Information                         #
#                                                                           #
# This module is the confidential and proprietary information of            #
# DBSentry Corp.; it is not to be copied, reproduced, or transmitted in any #
# form, by any means, in whole or in part, nor is it to be used for any     #
# purpose other than that for which it is expressly provided without the    #
# written permission of DBSentry Corp.                                      #
#                                                                           #
# Copyright (c) 2020-2021 DBSentry Corp.  All Rights Reserved.              #
#                                                                           #
#############################################################################

FIRST_START_DONE="${CONTAINER_STATE_DIR}/sshd-first-start-done"

if [ ! -e "$FIRST_START_DONE" ]; then
	touch $FIRST_START_DONE
fi

cd /container/service/sshd/assets
chown -R root:root  etc/ssh/* etc/motd etc/lshell.conf
mv etc/ssh/* /etc/ssh
mv etc/lshell.conf /etc
mv etc/motd /etc

/usr/bin/ssh-keygen -A

adduser -D -s /usr/bin/lshell alice
adduser -D -s /usr/bin/lshell bob
adduser -D -s /usr/bin/lshell carol
adduser -D -s /usr/bin/lshell erin
adduser -D -s /usr/bin/lshell frank
adduser -D -s /usr/bin/lshell grace
passwd -u alice
passwd -u bob
passwd -u carol
passwd -u erin
passwd -u frank
passwd -u grace

addgroup -S alice lshell
addgroup -S bob lshell
addgroup -S carol lshell
addgroup -S erin lshell
addgroup -S frank lshell
addgroup -S grace lshell

[ -d /run/sshd ] || mkdir /run/sshd

exit 0
