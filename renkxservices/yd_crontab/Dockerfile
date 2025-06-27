# webapp 生成的 基础镜像
FROM registry.cn-beijing.aliyuncs.com/kdd/php:php8-1.6

# todo 设置扩展数据
ADD ./renkxservices/extra  /home/www-data/extra

    # todo 安装 supercronic
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.2.28/supercronic-linux-amd64 \
    SUPERCRONIC=supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=fe1a81a8a5809deebebbd7a209a3b97e542e2bcd \
    # 设置composer 的 cache home
    COMPOSER_HOME=/tmp/composer

    # 安装composer
RUN curl -o /usr/bin/composer https://mirrors.aliyun.com/composer/composer.phar \
    && chmod +x /usr/bin/composer \
    # todo 安装 supercronic
    && curl -fsSLO "$SUPERCRONIC_URL" \
    && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
    && chmod +x "$SUPERCRONIC" \
    && mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
    && ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic \
    # 安装必要的软件
    && apk --no-cache add zsh git openssh vim busybox-suid \
    # oh-my-zsh 安装
    && git clone https://gitee.com/renkx/ohmyzsh.git /home/www-data/.oh-my-zsh \
    && mv /home/www-data/extra/zshrc /home/www-data/.zshrc \
    && chown -R www-data:www-data /home/www-data \
    && mkdir ${COMPOSER_HOME} && chown -R www-data:www-data ${COMPOSER_HOME} \
    && rm -rf /var/cache/apk/* /home/www-data/extra \
    # todo 最后需要删除zsh操作记录
    && rm -f /home/www-data/.zsh_history.new

# todo 工作目录
WORKDIR /www/wwwroot