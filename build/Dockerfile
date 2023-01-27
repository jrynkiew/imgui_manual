FROM ubuntu:23.04

WORKDIR /build

ARG CMAKE_VERSION=3.24.1
ARG GLFW_VERSION=3.3.8
ARG SDL_VERSION=2.26.2

ARG CROSS_PATH=/usr
ARG PKG_CONFIG_PATH=/usr/local/x86_64-w64-mingw32/lib/pkgconfig

SHELL [ "/bin/bash", "-c" ]

RUN set -ex \
    \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get upgrade --no-install-recommends -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        ca-certificates \
        libssl-dev \
        libglu1-mesa-dev \
        xorg-dev \
        wget \
        git \
        vim \
        curl \
        autotools-dev \
        build-essential \
        libtool \
        automake \
        pkg-config \
        python3 \
        default-jre \
        libglfw3-dev \
    \
    && wget -q https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz -O - | tar -xz \
    && wget -q https://github.com/libsdl-org/SDL/releases/download/release-${SDL_VERSION}/SDL2-devel-${SDL_VERSION}-mingw.tar.gz -O - | tar -xz \
    \
    && cd cmake-${CMAKE_VERSION} \
    && ./configure \
        --prefix=/usr/local \
        --parallel=`nproc` \
    && make -j`nproc` \
    && make install \
    && cd .. \
    \
    && git clone https://github.com/emscripten-core/emsdk.git emsdk \
    && cd emsdk \
    && chmod +x emsdk_env.sh \
    && ./emsdk install latest \
    && ./emsdk activate latest \
    && cd .. \
    \
    && cd SDL2-${SDL_VERSION} \
    && make native \
    \
    && git clone https://github.com/skaslev/gl3w.git gl3w \
    && cd gl3w \
    && python3 gl3w_gen.py \
    && cmake -B build \
    && cd build \
    && make -j`nproc` \
    && make install

WORKDIR /imgui_nft_app
