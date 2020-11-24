FROM python:3-slim-buster

## Labels
LABEL maintainer="oliverbaehler@hotmail.com"

## Environment Variables
ENV DEBUG false
ENV LOG_TO_FILE ""

## Copy Entrypoint
COPY ./entrypoint.sh /

## Install Dependencies
RUN pip install --user tavern tavern \
  && chmod +x /entrypoint.sh \
  && groupadd -r tavern && useradd -r -s /bin/false -g tavern tavern \
  && mkdir /tests \
  && chown -R tavern:tavern /tests



USER root

ENTRYPOINT ["/entrypoint.sh"]
