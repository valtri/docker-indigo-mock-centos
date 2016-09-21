# Info

Builder container for CentOS 7 platform to build packages for [INDIGO-DataCloud project](http://www.indigo-datacloud.eu/).

Container requires:

1. privileged mode: required by mock
3. *DOCKER_OPTS="-s devicemapper"* or RHEL-like host system: there is the issue [#6980](https://github.com/docker/docker/issues/6980) with AUFS

There is used for setup:

* puppet module [CESNET *jenkins\_node*](https://forge.puppet.com/cesnet/jenkins_node)
* INDIGO-DataCloud [build scripts](https://github.com/indigo-dc/jenkins-scripts)
* INDIGO-DataCloud [repository](http://repo.indigo-datacloud.eu/#two) version 1

# Launch

Update image:

    docker pull valtri/docker-indigo-mock-centos

Launch (from build directory):

    docker run -td --privileged=true --name indigo_centos --volume `pwd`:/docker:rw valtri/docker-indigo-mock-centos

Example build (replace *${PACKAGE}.src.rpm*):

    docker exec indigo_centos chown jenkins:jenkins /docker
    docker exec -u jenkins indigo_centos /var/lib/jenkins/scripts/pkg-build-mock -d /docker -p epel-7-x86_64 ./${PACKAGE}.src.rpm

# Tags

* **latest**: CentOS 7
