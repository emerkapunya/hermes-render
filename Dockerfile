FROM nousresearch/hermes-agent:latest

USER root

ENV HERMES_HOME=/opt/data

RUN mkdir -p /opt/data/memories \
    && chown -R hermes:hermes /opt/data

COPY --chown=hermes:hermes config.yaml /opt/data/config.yaml
COPY --chown=hermes:hermes SOUL.md /opt/data/SOUL.md
COPY --chown=hermes:hermes USER.md /opt/data/memories/USER.md
COPY --chown=hermes:hermes MEMORY.md /opt/data/memories/MEMORY.md

USER hermes

CMD ["gateway", "run"]
