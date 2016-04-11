FROM alpine:3.3

RUN apk add --update bash openssh python \
    && rm -rf /var/cache/apk/*

COPY run.sh /root/run.sh
COPY sshd_config /etc/ssh/sshd_config

RUN chmod u+x /root/run.sh \
    && mkdir /root/.ssh
COPY ssh_key.pub /root/.ssh/authorized_keys
RUN chmod -R 555 ~/.ssh

EXPOSE 22

ENTRYPOINT ["/root/run.sh"]

