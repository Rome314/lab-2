FROM alpine:3.10

RUN apk --update add --no-cache openssh \
  && echo "root:root" | chpasswd \
  && rm -rf /var/cache/apk/*

RUN /usr/bin/ssh-keygen -A

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]