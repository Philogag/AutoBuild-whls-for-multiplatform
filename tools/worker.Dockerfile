FROM multiarch/alpine:amd64-edge

VOLUME [ “/sys/fs/cgroup” ]

RUN apk add openrc docker \
    && mkdir -p /run/openrc \
    && touch /run/openrc/softlevel \
    && mkdir -p /etc/docker/ \
    && echo '{"storage-driver": "vfs"}' > /etc/docker/daemon.json
    # && rc-update add docker default
