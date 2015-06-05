from centos:centos6
MAINTAINER Ryan Bauman <ryanbauman@gmail.com>

COPY redhawk.repo /etc/yum.repos.d/

#add EPEL repo
RUN yum update -y && \
    yum install -y http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm && \
    yum install -y omniORB-servers \
                   omniEvents-server \
                   supervisor && yum clean all

COPY supervisord.conf /etc/

#configure omniEvents
RUN mkdir -p /var/log/omniEvents
RUN chown omniORB /var/log/omniEvents
RUN echo "InitRef = EventService=corbaloc::127.0.0.1:11169/omniEvents" >> /etc/omniORB.cfg

#expose ports for omniNames and omniEvents
EXPOSE 2809
EXPOSE 11169

CMD ["/usr/bin/supervisord", "-n"]
