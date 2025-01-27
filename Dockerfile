<<<<<<< HEAD
q# Building the main container
=======

# syntax=docker/dockerfile:1.3
>>>>>>> 5b6db7e7426f1aa7255a89d4caa561e2a2ee17a4
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive \
    PIP_CACHE_DIR=/.cache \
    DJANGO_SETTINGS_MODULE=core.settings.label_studio \
    LABEL_STUDIO_BASE_DATA_DIR=/label-studio/data \
    SETUPTOOLS_USE_DISTUTILS=stdlib \
    DEBUG=true

WORKDIR /label-studio

# install packages
RUN set -eux; \
    apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
    build-essential postgresql-client libmysqlclient-dev mysql-client python3.8 python3-pip python3.8-dev \
    uwsgi git libxml2-dev libxslt-dev zlib1g-dev

# Copy and install middleware dependencies
COPY deploy/requirements-mw.txt /label-studio
RUN --mount=type=cache,target=$PIP_CACHE_DIR \
    pip3 install -r requirements-mw.txt

# Copy and install requirements.txt first for caching
COPY deploy/requirements.txt /label-studio
<<<<<<< HEAD

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt && pip install uwsgi

ENV DJANGO_SETTINGS_MODULE=core.settings.label_studio
ENV LABEL_STUDIO_BASE_DATA_DIR=/label-studio/data
ENV DEBUG=true
ENV LABEL_STUDIO_DISABLE_SIGNUP_WITHOUT_LINK=true
=======
RUN --mount=type=cache,target=$PIP_CACHE_DIR \
    pip3 install -r requirements.txt

>>>>>>> 5b6db7e7426f1aa7255a89d4caa561e2a2ee17a4
COPY . /label-studio
RUN --mount=type=cache,target=$PIP_CACHE_DIR \
    pip3 install -e .

EXPOSE 8080
RUN ./deploy/prebuild_wo_frontend.sh

ENTRYPOINT ["./deploy/docker-entrypoint.sh"]
CMD ["label-studio"]
