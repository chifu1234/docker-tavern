FROM python:3-slim-buster

# Labels
LABEL maintainer="oliverbaehler@hotmail.com,kk@sudo-i.net"

## Environment Variables
ENV DEBUG false
ENV LOG_TO_FILE ""
ENV TAVERN_VERSION=1.11.1
ENV TEST_DIRECTORY=/tavern/.tests/

## Copy Entrypoint
COPY ./entrypoint.sh /


## Create Tavern User

RUN groupadd -r tavern && useradd -m -g tavern tavern \
  && mkdir /tavern \
  && chown -R tavern:tavern /tavern \
  && chmod +x /entrypoint.sh && chown tavern: /entrypoint.sh

COPY ./tests /tavern/.tests

## Install Tavern
USER tavern
RUN pip install --user tavern==${TAVERN_VERSION}
ENV PATH="~/.local/bin:${PATH}"

ENTRYPOINT ["/entrypoint.sh"]
