# webapp 生成的 基础镜像
FROM registry.cn-beijing.aliyuncs.com/kdd/php:php8-1.0

# Install composer and change it's cache home
RUN curl -o /usr/bin/composer https://mirrors.aliyun.com/composer/composer.phar \
    && chmod +x /usr/bin/composer
ENV COMPOSER_HOME=/tmp/composer

# todo 设置扩展数据
ADD ./renkxservices/extra  /root/extra

# todo 安装 zsh 和 supervisor 等
RUN apk --no-cache add zsh git openssh vim supervisor

RUN git clone https://github.com/ohmyzsh/ohmyzsh.git /root/.oh-my-zsh

RUN mv /root/extra/zshrc /root/.zshrc \
	&& rm -rf /var/cache/apk/* /root/extra \
    # todo 最后需要删除zsh操作记录
    && rm -f /root/.zsh_history.new

# todo 设置挂载
VOLUME ["/etc/supervisor/conf.d", "/var/log/supervisor/"]

# todo 工作目录
WORKDIR /etc/supervisor/conf.d

CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisor/supervisord.conf"]