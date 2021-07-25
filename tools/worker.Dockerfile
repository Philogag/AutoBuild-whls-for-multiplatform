FROM multiarch/alpine:amd64-edge

VOLUME [ “/sys/fs/cgroup” ]

RUN apk add openrc docker \
    && mkdir -p /run/openrc \
    && touch /run/openrc/softlevel \
    # && rc-update add docker default
