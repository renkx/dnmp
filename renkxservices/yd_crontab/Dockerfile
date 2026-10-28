# webapp 生成的 基础镜像
FROM pikaqiu-01-docker.pkg.coding.net/kdd-ec2/kdd/php:php-debian-8-2.x

# todo 设置扩展数据
ADD ./renkxservices/extra  /home/www-data/extra

# todo 安装 supercronic
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.2.28/supercronic-linux-amd64 \
    SUPERCRONIC=supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=fe1a81a8a5809deebebbd7a209a3b97e542e2bcd \
    # 设置composer 的 cache home
    COMPOSER_HOME=/tmp/composer \
    # 显式将默认 HOME 环境变量指向 /home/www-data
    HOME=/home/www-data

# 安装 composer
RUN curl -sS https://getcomposer.org/download/2.10.3/composer.phar -o /usr/bin/composer \
    && chmod +x /usr/bin/composer

# todo 安装 supercronic
RUN curl -fsSLO "$SUPERCRONIC_URL" \
    && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c \
    && chmod +x "$SUPERCRONIC" \
    && mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
    && ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic \
    # 安装必要的软件（Debian 系统使用 apt-get 更新并安装 zsh、git、openssh-client、vim、passwd/suid 等）
    && export option="--no-install-recommends -y" \
    && apt-get $option update \
    && apt-get $option install zsh git openssh-client vim passwd \
    # 修改系统中 www-data 用户的默认家目录为 /home/www-data，并保持 shell 为 /bin/zsh 或 /bin/sh
    && usermod -d /home/www-data -s /bin/zsh www-data \
    # oh-my-zsh 安装
    && git clone https://gitee.com/renkx/ohmyzsh.git /home/www-data/.oh-my-zsh \
    && mv /home/www-data/extra/zshrc /home/www-data/.zshrc \
    && chown -R www-data:www-data /home/www-data \
    && mkdir ${COMPOSER_HOME} && chown -R www-data:www-data ${COMPOSER_HOME} \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /home/www-data/extra \
    # todo 最后需要删除zsh操作记录
    && rm -f /home/www-data/.zsh_history.new

# todo 工作目录
WORKDIR /www/wwwroot