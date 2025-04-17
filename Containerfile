#Packages required:
# ninja 1.11+
# cmake 3.29+
# clang 19+
# CentOS Stream 9 only has up to ninja 1.10 and CMake 3.28.
# CentOS Stream 10 has what we need.

FROM quay.io/centos/centos:stream10

RUN dnf update -y && \
    dnf config-manager --set-enabled crb && \
    dnf install -y clang-19.1.7 clang-tools-extra-19.1.7 ninja-build-1.11.1 cmake-3.30.5

#Copy to source code into the container at build time.
COPY ./* /src
WORKDIR /src

CMD cmake -G Ninja . &&\
    cmake -B .