FROM library/centos:7

RUN yum update -y; yum clean all
RUN yum install -y epel-release
RUN yum install -y \
		ansible \
		curl \
		docker \
		git \
		make \
		net-tools \
		openssh-server \
		passwd \
		python \
		python-devel \
		python-virtualenv \
		python-pip \
		gcc \
		krb5-devel \
		krb5-libs \
		krb5-workstation \
		vim \
		wget && \
	yum clean all

RUN pip install https://github.com/diyan/pywinrm/archive/master.zip#egg=pywinrm
RUN pip install kerberos

RUN ln -sf /usr/share/zoneinfo/Europe/Prague /etc/localtime

COPY files/id_rsa /root/.ssh/id_rsa
COPY files/id_rsa.pub /root/.ssh/id_rsa.pub
COPY files/id_rsa.pub /root/.ssh/authorized_keys

COPY files/vars.sh /etc/profile.d/vars.sh
COPY files/setup.sh /root/setup.sh

RUN chmod 0700 /root/.ssh; chmod 0600 /root/.ssh/*
RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
