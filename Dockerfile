FROM ubuntu:latest

RUN apt update -y && \
    apt install -y build-essential git

RUN mkdir -p /work/crackmes

RUN git clone https://github.com/radare/radare2 /work/radare2 && \
    cd /work/radare2 && \
    ./sys/install.sh

WORKDIR /work/crackmes

CMD ["bash"]
