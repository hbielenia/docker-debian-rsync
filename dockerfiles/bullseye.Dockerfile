# syntax=docker/dockerfile:1

# docker-debian-rsync - Docker configuration for rsync on Debian
# Written in 2024 by Hubert Bielenia <hbielenia@users.noreply.github.com>
# To the extent possible under law, the author(s) have dedicated all copyright and related
# and neighboring rights to this software to the public domain worldwide. This software
# is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

FROM debian:bullseye@sha256:f58b816c2acc96e3e1dfe6b6c166c3d52b5541571ac4fa72a64a0bb5beaf25a3
RUN adduser --disabled-password --no-create-home --uid 1000 rsync
RUN apt-get update \
	&& apt-get install -y rsync=3.2.3-4+deb11u3 \
	&& rm -rf /var/lib/apt/lists/*
USER 1000:1000
ENTRYPOINT [ "/usr/bin/rsync" ]
CMD [ "--help" ]

