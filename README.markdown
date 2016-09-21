# Info

Builder container for CentOS 7 platform to build packages for [INDIGO-DataCloud project](http://www.indigo-datacloud.eu/).

Container requires privileged mode as it uses mock.

For setup is used a puppet module [CESNET *jenkins\_node*](https://forge.puppet.com/cesnet/jenkins_node) and INDIGO-DataCloud repository version 1 is preconfigured.

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
