# webapp 生成的 基础镜像
FROM registry.cn-beijing.aliyuncs.com/kdd/php:php8-1.0

# Install composer and change it's cache home
RUN curl -o /usr/bin/composer https://mirrors.aliyun.com/composer/composer.phar \
    && chmod +x /usr/bin/composer
ENV COMPOSER_HOME=/tmp/composer

# todo 设置扩展数据
ADD ./renkxservices/extra  /home/www-data/extra

# todo 安装 zsh 和 git 等
RUN apk --no-cache add zsh git openssh vim busybox-suid

################### todo 安装 supercronic
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.1.12/supercronic-linux-amd64 \
    SUPERCRONIC=supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=048b95b48b708983effb2e5c935a1ef8483d9e3e

RUN curl -fsSLO "$SUPERCRONIC_URL" \
 && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
 && chmod +x "$SUPERCRONIC" \
 && mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
 && ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic
################### todo 安装 supercronic

RUN git clone https://gitee.com/renkx/ohmyzsh.git /home/www-data/.oh-my-zsh

RUN mv /home/www-data/extra/zshrc /home/www-data/.zshrc \
	&& rm -rf /var/cache/apk/* /home/www-data/extra \
    # todo 最后需要删除zsh操作记录
    && rm -f /home/www-data/.zsh_history.new

# todo 工作目录
WORKDIR /www/wwwroot

CMD ["supercronic", "/etc/crontabs/www-data"]