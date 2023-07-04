FROM nginx:latest
RUN apt update && apt install  openssh-server sudo -y

RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup sshuser
RUN mkdir -p /home/sshuser/.ssh
COPY docker.pub /home/sshuser/.ssh/authorized_keys
RUN chown sshuser:sshgroup /home/sshuser/.ssh/authorized_keys && chmod 600 /home/sshuser/.ssh/authorized_keys
RUN sudo passwd -d sshuser
RUN usermod -aG sudo sshuser
RUN sudo apt install -y build-essential checkinstall \ 
     libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev 
RUN sudo apt-get install software-properties-common -y
RUN sudo apt-get update -y 
RUN sudo add-apt-repository ppa:deadsnakes/ppa -y 
RUN sudo apt install python3 -y
RUN service ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]