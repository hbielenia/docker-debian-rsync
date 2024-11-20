===================
docker-debian-rsync
===================
This repository holds configuration for building Docker images
with `rsync`_ installed. I started yet another ``rsync`` image beacause
I wanted plain `Debian image`_ with rsync and without any helper scripts
wrapped around it.

For now, this configuration only supports Debian images as bases.
If you want Alpine base instead, try `corpusops/sync`_.

Download
========
Images built from this repository are available from `Docker Hub`_ as
`hbielenia/debian-rsync`_ and from `GitHub Container Registry`_
as ``ghcr.io/hbielenia/docker-debian-rsync``.

Images
======
The currently built images are:
- ``3.2``, also tagged ``3.2-bullseye``, ``3.2.3``, ``3.2.3-bullseye``,
  ``3.2.3-4-bullseye``, ``3.2.3-4-deb11u1-bullseye`` and ``latest``.
- ``3.2-slim``, also tagged ``3.2-bullseye-slim``, ``3.2.3-slim``,
  ``3.2.3-bullseye-slim``, ``3.2.3-4-bullseye-slim``,
  ``3.2.3-4-deb11u1-bullseye-slim`` and ``latest-slim``.

Usage
=====
``rsync`` is configured to be this image's entry point, so it can be used
in place of ``rsync`` executable. This example shows syncing the
``/home/example/source`` directory on ``remotehost``
to ``/home/example/target`` on local host::

  docker run -v /home/example/target:/mnt --rm hbielenia/rsync remotehost:/home/example/source/ /mnt

Check `rsync documentation`_ for information on supported command line flags
and more.

Building locally
================
To build an image on your local machine, you must have `Docker Engine`_
installed and ``docker`` available in your command line. Then, after
cloning this repository, execute in it's directory::

  docker build -t rsync:latest -f dockerfiles/bullseye.Dockerfile .

This will create an image tagged ``rsync:latest`` in your local Docker image
store. You can change this tag name to whatever you like, as long as it
doesn't conflict with other image tags.

Issues and support
==================
Bug reports and feature requests are collected at `GitHub Issues`_.
For questions and usage help, please use `Discussions`_ instead. Bear in mind
that this project isn't a full time job and no one is under any obligation
to answer. However, there is genuine intent of providing support on a
best effort basis.

If you or your company require more commitment, you can inquire about
paid support at ``hbielenia@users.noreply.github.com``.

Copyright
=========
This configuration isn't very original, but in case it's copyrightable
now or in the future, in whole or in part, it's released under the terms
of `CC0 1.0 Universal`_ license. This license is pretty much the same as
public domain, but adjusted for countries where author can't simply release
into public domain. See ``COPYING.txt`` for full license text.

.. _rsync: https://rsync.samba.org/
.. _Debian image: https://hub.docker.com/_/debian
.. _corpusops/sync: https://hub.docker.com/r/corpusops/rsync
.. _Docker Hub: https://hub.docker.com/
.. _hbielenia/debian-rsync: https://hub.docker.com/r/hbielenia/debian-rsync
.. _GitHub Container Registry: https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry
.. _Docker Engine: https://docs.docker.com/engine/
.. _GitHub Issues: https://github.com/hbielenia/docker-rsync/issues
.. _Discussions: https://github.com/hbielenia/docker-rsync/discussions
.. _CC0 1.0 Universal: https://creativecommons.org/publicdomain/zero/1.0/
