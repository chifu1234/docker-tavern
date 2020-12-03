FROM python:3-slim-buster

## Labels
LABEL maintainer="oliverbaehler@hotmail.com, kk@sudo-i.net"

## Environment Variables
ENV DEBUG false
ENV LOG_TO_FILE ""
ENV TAVERN_VERSION "1.11.1"
ENV TEST_DIRECTORY "/tavern/"
ENV PATH "~/.local/bin:${PATH}"

## Copy Entrypoint
COPY ./entrypoint.sh /

## Create Tavern User
RUN groupadd -r tavern && useradd -s /bin/false -m -g tavern tavern \
  && mkdir -p ${TEST_DIRECTORY} \
  && chown -R tavern:tavern ${TEST_DIRECTORY} \
  && chmod +x /entrypoint.sh && chown tavern: /entrypoint.sh

## Install Tavern
USER tavern
RUN pip install --user tavern==${TAVERN_VERSION}

## Working Directory
WORKDIR "${TEST_DIRECTORY}"

## EntryPoint
ENTRYPOINT ["/entrypoint.sh"]
