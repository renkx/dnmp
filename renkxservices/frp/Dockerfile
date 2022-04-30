FROM alpine:3

ARG FRP_VERSION
ARG TZ

RUN apk --no-cache add wget bash \
    # 安装并设置时区
    && apk --no-cache add tzdata \
    && cp "/usr/share/zoneinfo/$TZ" /etc/localtime \
    && echo "$TZ" > /etc/timezone \
    # 安装frp
    && wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz -O /tmp/frp.tar.gz \
    && chmod +x /tmp/frp.tar.gz  \
    && tar -xzf /tmp/frp.tar.gz  \
    && rm -rf /tmp/frp.tar.gz \
    && mv frp_${FRP_VERSION}_linux_amd64 /frp  \
    && chown -R root:root /frp  \
    && chmod -R 755 /frp

WORKDIR /frp