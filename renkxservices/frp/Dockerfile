FROM alpine:3

RUN apk --no-cache add wget bash && wget -N --no-check-certificate -q -O install_frp.sh "https://raw.githubusercontent.com/rkxs/s/main/install_frp.sh" && chmod +x install_frp.sh && bash install_frp.sh

WORKDIR /