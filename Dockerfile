FROM jenkins/jenkins:2.128

USER root

RUN curl -fsSL https://get.docker.com | sh \
 && usermod -aG docker jenkins \
 && apt-get clean

USER jenkins

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY scripts/groovy/* /usr/share/jenkins/ref/init.groovy.d/

WORKDIR $JENKINS_HOME
