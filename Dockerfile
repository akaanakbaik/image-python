ARG PYTHON_VERSION=3.14
ARG PYTHON_DISTRO=trixie-slim
FROM python:${PYTHON_VERSION}-${PYTHON_DISTRO}

ENV USER=container \
    HOME=/home/container \
    LANG=C.UTF-8 \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash ca-certificates curl git openssh-client \
        build-essential pkg-config unzip zip xz-utils tini \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd --gid 1000 container \
    && useradd --uid 1000 --gid 1000 \
        --home-dir /home/container --create-home \
        --shell /bin/bash container

WORKDIR /home/container
USER container

ENTRYPOINT ["/usr/bin/tini", "--", "/bin/bash", "-c"]
CMD ["exec ${STARTUP:-python --version}"]
