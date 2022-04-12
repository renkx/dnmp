# webapp 生成的 基础镜像
FROM registry.cn-beijing.aliyuncs.com/kdd/php:php8-1.0

# todo 设置扩展数据
ADD ./renkxservices/extra  /root/extra

# todo 安装 zsh 和 supervisor 等
RUN apk --no-cache add zsh vim \
    && mv /root/extra/oh-my-zsh /root/.oh-my-zsh \
    && mv /root/extra/zshrc /root/.zshrc \
	&& rm -rf /var/cache/apk/* /root/extra \
    # todo 最后需要删除zsh操作记录
    && rm -f /root/.zsh_history.new

# todo 工作目录
WORKDIR /www

CMD ["/usr/sbin/crond", "-f", "-d", "8"]