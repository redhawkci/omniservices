from centos:centos6

MAINTAINER Ryan Bauman <ryanbauman@gmail.com>

#add EPEL repo 
RUN yum install -y http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

#add REDHAWK repo and install omni servers
ADD redhawk.repo /etc/yum.repos.d/
RUN yum install -y omniORB-servers omniEvents-server

#configure omniEvents
RUN mkdir -p /var/log/omniEvents
RUN chown omniORB /var/log/omniEvents
RUN echo "InitRef = EventService=corbaloc::127.0.0.1:11169/omniEvents" >> /etc/omniORB.cfg

#install supervisor
RUN yum install -y supervisor
ADD supervisord.conf /etc/

#expose ports for omniNames and omniEvents
EXPOSE 2809
EXPOSE 11169

CMD ["/usr/bin/supervisord", "-n"]
