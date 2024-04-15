ARG GCLOUD_CLI_VERSION=470.0.0-slim

FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:${GCLOUD_CLI_VERSION}

LABEL org.opencontainers.image.description="Minecraft IaC container image"

ARG TERRAFORM_VERSION=1.8.0
ARG ANSIBLE_VERSION=9.4.0
ENV OS="linux"
ENV ARCH="amd64"

# Install terraform
RUN apt update \
    && apt install -y git-core wget hcloud-cli unzip

# Download the required version of Terraform from the official website
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && terraform version

# Install Ansible
ENV ANSIBLE_VERSION=$ANSIBLE_VERSION
RUN apt-get update \
    && apt-get install -y gcc python3 \
    && apt-get install -y python3-pip \
    && apt-get clean all \
    && pip3 install --upgrade --break-system-packages pip \
    && pip3 install --break-system-packages "ansible==${ANSIBLE_VERSION}" \
    && ansible --version
