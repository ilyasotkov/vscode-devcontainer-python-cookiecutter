# Base
FROM python:{{cookiecutter.python_version}}-slim-buster AS base
WORKDIR /workspace
ENV PYTHONPATH /workspace/src
COPY pip.conf /etc/
COPY requirements.txt .
RUN pip install -r requirements.txt

# Production image
FROM base AS production
COPY . .
ENTRYPOINT ["python", "./{{cookiecutter.python_package_name}}/main.py"]

# Test base
FROM base AS testbase
COPY requirements-test.txt .
RUN pip install -r requirements-test.txt

# Test image
FROM testbase AS test
COPY . .
ENTRYPOINT ["pytest", "./{{cookiecutter.python_package_name}}/test"]

# VS Code Dev Container image
FROM testbase AS devcontainer
RUN apt-get -qq update \
        && apt-get -qq install --no-install-recommends --no-install-suggests -y \
        bash \
        curl \
        jq \
        ca-certificates \
        zip \
        build-essential \
        git \
        gnupg \
        openssh-client

RUN curl -L -o shfmt \
        https://github.com/mvdan/sh/releases/download/v3.1.2/shfmt_v3.1.2_linux_amd64 \
        && chmod 0700 shfmt \
        && mv shfmt /usr/bin

COPY requirements-devcontainer.txt .
RUN pip install -r requirements-devcontainer.txt
