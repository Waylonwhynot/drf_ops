FROM python:3.6.2-alpine
MAINTAINER
ENV environment prd
RUN mkdir -p /code
COPY . /code/
RUN apk update \
    && apk add --virtual mysqlclient-build gcc python3-dev musl-dev \
    && apk add --no-cache mariadb-dev \
    && apk add --virtual system-build linux-headers libffi-dev \
    && apk add --no-cache jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev \
    && apk add --no-cache bash bash-doc bash-completion \
RUN pip --no-cache-dir install -r /code/requirements.txt -i https://mirrors.aliyun.com/pypi/simple/
RUN apk del mysqlclient-build \
    && apk del system-build