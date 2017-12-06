FROM openshift/base-centos7

RUN set -xe; \
    yum install -y epel-release; \
    yum install -y redis-3.2.10 nc bind-utils; \
    yum clean all;

ADD redis-sentinel.conf /etc/redis-sentinel.conf
ADD redis.conf /etc/redis.conf
ADD redis-slave.conf /etc/redis-slave.conf
COPY run.sh /run.sh
ENTRYPOINT [ "bash", "-c" ]
RUN set -xe ;\
    fix-permissions /var/lib/redis; \
    fix-permissions /etc;

USER 1001

CMD [ "/run.sh" ]


