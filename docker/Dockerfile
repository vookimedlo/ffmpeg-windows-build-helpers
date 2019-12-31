FROM ubuntu:19.10

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y \
    wget \
    ed \
    subversion \
    curl \
    texinfo \
    g++ \
    bison \
    flex \
    cvs \
    yasm \
    automake \
    libtool \
    autoconf \
    gcc \
    cmake \
    git \
    make \
    pkg-config \
    zlib1g-dev \
    mercurial \
    unzip \
    pax \
    nasm \
    meson \
    gperf \
    autogen \
    bzip2 \
    autoconf-archive \
    p7zip-full \
    ragel \
    python3-distutils \
&& rm -rf /var/lib/apt/lists/*

# copy the entire git dir into the new docker container
COPY . ./ffmpeg-windows-build-helpers

WORKDIR /ffmpeg-windows-build-helpers
ENTRYPOINT [ "bash", "./docker/docker-entry.sh" ]
