#!/usr/bin/env sh

if [ "$SET_CONTAINER_TIMEZONE" = "true" ]; then
    echo ${CONTAINER_TIMEZONE} >/etc/timezone \
    && ln -sf /usr/share/zoneinfo/${CONTAINER_TIMEZONE} /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata
    echo "Container timezone set to: $CONTAINER_TIMEZONE"
else
    echo "Container timezone not modified"
fi

printenv | sed 's/^\(.*\)$/export \1/g' > /root/env

cron -f
