FROM debian:stretch

RUN apt-get update -y && \
	apt-get install -y \
		build-essential \
		ca-certificates \
		curl \
		dos2unix \
		git \
		htop \
		iftop \
		locales \
		mc \
		net-tools \
		passwd \
		python \
		python-dev \
		python-virtualenv \
		python-pip \
		python3 \
		python3-dev \
		python3-virtualenv \
		python3-pip \
		ssh \
		tig \
		tmux \
		vim \
		wget && \
	rm -rf /var/lib/apt/lists/*

RUN pip install ansible

RUN ln -sf /usr/share/zoneinfo/Europe/Prague /etc/localtime
RUN echo "en_US.UTF-8 UTF-8" > /etc/locales.gen && locale-gen
COPY files/id_rsa /root/.ssh/id_rsa
COPY files/id_rsa.pub /root/.ssh/id_rsa.pub
COPY files/id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 0700 /root/.ssh && chmod 0600 /root/.ssh/*
RUN mkdir /run/sshd

COPY files/vars.sh /etc/profile.d/vars.sh
COPY files/setup.sh /root/setup.sh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
