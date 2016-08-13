FROM centos:7
MAINTAINER Vaclav Sykora <vaclav.sykora@gmail.com>

# install set of necessary tools
RUN set -x \
        && yum -y update \
        && yum -y install sudo nano vim wget telnet man yum-utils net-tools bind-utils psmisc \
        && yum clean all

ENV PS1 "\[\e[1;33m\][centos] [\u@\h \w]$ \[\e[0m\]"
