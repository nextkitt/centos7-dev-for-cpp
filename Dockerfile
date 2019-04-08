# Dockerfile: centos7-dev-for-cpp

FROM centos:7.4.1708


COPY CentOS7-Base-163.repo /etc/yum.repos.d/CentOS7-Base-163.repo
#COPY cmake-3.8.0-Linux-x86_64.tar.gz /tmp/

RUN mkdir /tmp/tmp && cd /tmp/tmp \
        # yum -y install epel-release \
        && mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup \
        # && curl https://mirrors.163.com/.help/CentOS7-Base-163.repo -o /etc/yum.repos.d/CentOS7-Base-163.repo \
        && yum -y upgrade \
        && yum  groupinstall -y 'Development Tools' \
        && yum install -y man-pages man-db man \
        && yum install -y  tar \
            gzip \
            git \
            gdb \
            vim \
            wget \
            curl \
            which \
            less \
            screen \
            net-tools \
            python \
            python-devel \
            python-pip \
            openssl \
            libtool \
            lua lua-devel luajit  luajit-devel \
        && yum install -y snappy snappy-devel zlib zlib-devel bzip2 bzip2-devel lz4-devel libasan \
        # Install cmake
        && curl https://cmake.org/files/v3.8/cmake-3.8.0-Linux-x86_64.tar.gz  -o cmake-3.8.0-Linux-x86_64.tar.gz \
        && tar zxf /tmp/cmake-3.8.0-Linux-x86_64.tar.gz \
        && mv cmake-3.8.0-Linux-x86_64 /usr/local/ \
        && ln -s /usr/local/cmake-3.8.0-Linux-x86_64/bin/cmake /usr/local/bin/cmake \
        # Clean out the Yum cache
        && yum -y clean all \
        && rm -rf /var/cache/yum \
        && rm -rf /tmp/tmp /tmp/CentOS7-Base-163.repo /tmp/cmake-3.8.0-Linux-x86_64.tar.gz
