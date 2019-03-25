# Dockerfile: centos7-dev-for-cpp

FROM centos:7.4.1708


RUN yum -y install epel-release \
        && yum -y upgrade \
        && yum -y cmake3 make \
        && yum  groupinstall -y 'Development Tools' \
        && yum install -y  tar \
            gzip \
            gcc \
            gdb \
            vim \
            wget \
            curl \
            which \
            less \
            screen \
            net-tools \
            python-pip \
            git \
            openssl \
        &&  yum install -y snappy snappy-devel zlib zlib-devel bzip2 bzip2-devel lz4-devel libasan
        # Clean out the Yum cache
        && yum -y clean all \
        && rm -rf /var/cache/yum
