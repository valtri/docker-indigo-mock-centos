FROM centos:7
MAINTAINER František Dvořák <valtri@civ.zcu.cz>

RUN yum install -y wget \
&& yum clean all

RUN wget -q -l2 -r -nd --accept epel-release\*.rpm ftp://mirror.switch.ch/mirror/epel/7/x86_64/e \
&& rpm -ivh epel-release-*.rpm \
&& yum clean all

RUN yum install -y puppet java-1.8.0-openjdk-headless \
&& yum clean all

#RUN puppet resource service puppet ensure=stopped enable=false
RUN puppet module install cesnet/jenkins_node

COPY site.pp /root

RUN puppet apply /root/site.pp \
&& yum clean all

COPY ./docker-entry.sh /
ENTRYPOINT ["/docker-entry.sh"]
CMD ["tail",  "-f", "/dev/null"]
