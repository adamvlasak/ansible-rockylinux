FROM centos/systemd

RUN yum -y install \
           openssh-server \
           openssh-clients \
           sudo \
           ansible; \
           yum clean all; \
           systemctl enable sshd.service

ADD roles/user/templates/vars.sh /etc/profile.d/vars.sh

RUN echo 'root:docker' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/init"]
