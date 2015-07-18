FROM ubuntu:14.04.1

MAINTAINER prideout

RUN apt-get -y update --fix-missing && apt-get install -y \
    p7zip-full \
    ccache \
    cmake \
    g++ \
    git \
    libgif-dev \
    libwebp-dev \
    libpng12-dev \
    libtiff5-dev \
    libjpeg-dev \
    libopenjpeg-dev \
    libboost-dev libboost-filesystem-dev libboost-regex-dev libboost-system-dev libboost-thread-dev \
    software-properties-common \
    python \
    wget

RUN echo "/usr/local/lib64/" >/etc/ld.so.conf.d/lib64.conf
RUN echo "/usr/local/lib/" >/etc/ld.so.conf.d/lib.conf

ENV LD_LIBRARY_PATH /usr/local/lib/:/usr/local/lib64/
ENV OIIO_VERSION Release-1.5.17
ENV ILMBASE_VERSION 2.2.0
ENV OPENEXR_VERSION 2.2.0

# Fetch and Build ilmbase

RUN cd /root && \
    wget http://download.savannah.nongnu.org/releases/openexr/ilmbase-${ILMBASE_VERSION}.tar.gz && \
    tar xvfz ilmbase-${ILMBASE_VERSION}.tar.gz
RUN cd /root/ilmbase-${ILMBASE_VERSION} && \
    ./configure && make -j6 install

# Fetch and Build OpenEXR

RUN cd /root && \
    wget http://download.savannah.nongnu.org/releases/openexr/openexr-${OPENEXR_VERSION}.tar.gz && \
    tar xvfz openexr-${OPENEXR_VERSION}.tar.gz
RUN cd /root/openexr-${OPENEXR_VERSION} && \
    ./configure --disable-ilmbasetest && \
    make -j6 install

# Fetch and Build OpenImageIO

RUN cd /root && \
    wget https://github.com/OpenImageIO/oiio/archive/${OIIO_VERSION}.tar.gz && \
    tar xvfz ${OIIO_VERSION}.tar.gz

RUN cd /root/oiio-${OIIO_VERSION} && \
    mkdir release && \
    cd release && \
    cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER="ccache" -DCMAKE_CXX_COMPILER_ARG1="g++" && \
    make -j6 install

# Sanity Checks

RUN python -c 'import multiprocessing; print multiprocessing.cpu_count(), "processors"'
