FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
nginx openssh-server iputils-ping net-tools nano python3 sudo sshpass \
&& rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/run/sshd && ssh-keygen -A
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo 'Port 22' >> /etc/ssh/sshd_config
RUN echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
EXPOSE 80 22
RUN echo "root:password" | chpasswd
CMD ["/usr/sbin/sshd", "-D"]
