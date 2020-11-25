FROM python:3-slim-buster

# Labels
LABEL maintainer="oliverbaehler@hotmail.com,kk@sudo-i.net"

## Environment Variables
ENV DEBUG false
ENV LOG_TO_FILE ""
ENV TAVERN_VERSION=1.11.1

## Copy Entrypoint
COPY ./entrypoint.sh /

## Create Tavern User

RUN groupadd -r tavern && useradd -m -g tavern tavern \
  && mkdir /tavern \
  && chown -R tavern:tavern /tavern


## Install Tavern
USER tavern
RUN pip install --user tavern==${TAVERN_VERSION}

ENTRYPOINT ["/entrypoint.sh"]
