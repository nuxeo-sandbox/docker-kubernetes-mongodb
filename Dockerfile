FROM openshift/base-centos7

RUN set -xe; \
    yum install -y epel-release; \
    yum install -y redis-4.0.6 nc bind-utils; \
    yum clean all;

ADD redis-sentinel.conf /etc/redis-sentinel.conf
ADD redis.conf /etc/redis.conf
ADD redis-slave.conf /etc/redis-slave.conf
COPY run.sh /run.sh

CMD [ "/run.sh" ]

ENTRYPOINT [ "bash", "-c" ]
