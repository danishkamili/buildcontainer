FROM jenkins/jnlp-slave:3.27-1-alpine

USER root
RUN apk add docker &&\
    apk add curl &&\
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash

USER jenkins

ENTRYPOINT ["jenkins-slave"]
