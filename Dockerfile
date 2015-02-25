# This is a comment
FROM dockerpinguin/c7-systemd:V2
MAINTAINER Bart van Pelt <bart.vanpelt@gmail.com>


ADD etc/yum.repos.d/logstash-1.4.repo /etc/yum.repos.d/

# logstash
RUN useradd jls && \
    yum install -y logstash

ADD etc/logstash/conf.d /etc/logstash/conf.d

RUN sed -e 's/rlimit-nproc=/#rlimit-nproc=/' /etc/avahi/avahi-daemon.conf > /etc/avahi/avahi-daemon.conf

RUN systemctl enable logstash.service


