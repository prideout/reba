FROM ubuntu:14.04.1

MAINTAINER prideout

RUN apt-get -y update --fix-missing && apt-get install -y \
    ccache cmake \
    g++ gdb software-properties-common \
    python python-setuptools python-dev python-pip scons \
    libgif-dev \
    libwebp-dev \
    libpng12-dev \
    libtiff5-dev \
    libjpeg-dev \
    libopenjpeg-dev \
    wget unzip

RUN apt-get install -y \
    libboost-dev \
    libboost-filesystem-dev \
    libboost-regex-dev \
    libboost-system-dev \
    libboost-thread-dev \
    libboost-python-dev

RUN echo "/usr/local/lib64/" >/etc/ld.so.conf.d/lib64.conf
RUN echo "/usr/local/lib/" >/etc/ld.so.conf.d/lib.conf

ENV LD_LIBRARY_PATH /usr/local/lib/:/usr/local/lib64/
ENV OIIO_VERSION Release-1.5.17
ENV ILMBASE_VERSION 2.2.0
ENV OPENEXR_VERSION 2.2.0
ENV GLM_VERSION 0.9.6.3

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

# Fetch and Install glm, spdlog, and rapidjson

RUN cd /root && \
    wget https://github.com/g-truc/glm/archive/${GLM_VERSION}.tar.gz && \
    tar xvfz ${GLM_VERSION}.tar.gz && \
    mv glm-${GLM_VERSION}/glm/ /usr/local/include/glm/

RUN cd /root && \
    wget https://github.com/gabime/spdlog/archive/08b6b0.zip && \
    unzip 08b6b0.zip && \
    mv spdlog-*/include/spdlog/ /usr/local/include/spdlog/

RUN cd /root && \
    wget https://github.com/miloyip/rapidjson/archive/v1.0.2.tar.gz && \
    tar xvfz v1.0.2.tar.gz && \
    mv rapidjson-*/include/rapidjson/ /usr/local/include/rapidjson/
