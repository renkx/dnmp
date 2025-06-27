# webapp 生成的 基础镜像
FROM registry.cn-beijing.aliyuncs.com/kdd/php:php8-1.6

    # 设置composer 的 cache home
ENV COMPOSER_HOME=/tmp/composer

# todo 设置扩展数据
ADD ./renkxservices/extra  /home/www-data/extra

    # 安装composer
RUN curl -o /usr/bin/composer https://mirrors.aliyun.com/composer/composer.phar \
    && chmod +x /usr/bin/composer \
    # 安装必要的软件
    && apk --no-cache add zsh git openssh vim \
    # oh-my-zsh 安装
    && git clone https://gitee.com/renkx/ohmyzsh.git /home/www-data/.oh-my-zsh \
    && mv /home/www-data/extra/zshrc /home/www-data/.zshrc \
    && chown -R www-data:www-data /home/www-data \
    && mkdir ${COMPOSER_HOME} && chown -R www-data:www-data ${COMPOSER_HOME} \
    && rm -rf /var/cache/apk/* /home/www-data/extra \
    # todo 最后需要删除zsh操作记录
    && rm -f /home/www-data/.zsh_history.new