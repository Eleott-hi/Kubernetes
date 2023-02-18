FROM alpine:latest

RUN apk update&& apk upgrade

RUN apk add g++ cmake make asio-dev git wget python3 zip curl bison bash 
# libopencv-dev python3-opencv



RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/4.x.zip
RUN unzip opencv.zip
RUN mkdir -p build && cd build
RUN cmake  ../opencv-4.x
RUN cmake --build .

COPY . /wndtn

WORKDIR /wndtn

RUN cd /wndtn && cmake . && make

CMD ./app
