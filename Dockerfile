FROM nousresearch/hermes-agent:latest

USER root

ENV HERMES_HOME=/opt/data

COPY config.yaml /opt/hermes/cli-config.yaml.example
COPY SOUL.md /opt/hermes/docker/SOUL.md

CMD ["gateway", "run"]
