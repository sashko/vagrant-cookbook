#!/bin/bash
# vagrant-cookbook
# Copyright (C) 2017 Pelagicore AB
#
# Permission to use, copy, modify, and/or distribute this software for
# any purpose with or without fee is hereby granted, provided that the
# above copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
# WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR
# BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES
# OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
# WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
# ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
# SOFTWARE.
#
# For further information see LICENSE
#
#
# Usage: grub-enable-cgroup-memory.sh
#

if ! grep "cgroup_enable=memory quiet" /etc/default/grub > /dev/null; then
	sed -i '/GRUB_CMDLINE_LINUX_DEFAULT=/c \GRUB_CMDLINE_LINUX_DEFAULT=\"cgroup_enable=memory swapaccount=1 quiet\"' /etc/default/grub
	update-grub
    touch /vagrant/VAGRANT_NEEDS_RELOAD
fi
