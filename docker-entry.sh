#! /bin/sh

if ! test -d /var/lib/mock/epel-7-x86_64; then
    su - jenkins -c "~jenkins/scripts/refresh-chroot --initial" || :
fi

exec "$@"
