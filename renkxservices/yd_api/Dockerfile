# webapp 生成的 基础镜像
FROM registry.cn-beijing.aliyuncs.com/kdd/php:php8-1.0

# Install composer and change it's cache home
RUN curl -o /usr/bin/composer https://mirrors.aliyun.com/composer/composer.phar \
    && chmod +x /usr/bin/composer
ENV COMPOSER_HOME=/tmp/composer

# todo 设置扩展数据
ADD ./renkxservices/extra  /home/www-data/extra

# todo 安装 zsh和git 等
RUN apk --no-cache add zsh git openssh vim

RUN git clone https://gitee.com/renkx/ohmyzsh.git /home/www-data/.oh-my-zsh

RUN mv /home/www-data/extra/zshrc /home/www-data/.zshrc \
    && chown -R www-data:www-data /home/www-data \
    && mkdir /tmp/composer && chown -R www-data:www-data /tmp/composer \
    && rm -rf /var/cache/apk/* /home/www-data/extra \
    # todo 最后需要删除zsh操作记录
    && rm -f /home/www-data/.zsh_history.new