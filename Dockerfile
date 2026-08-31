FROM nousresearch/hermes-agent:latest

USER root

ENV HERMES_HOME=/opt/data
ENV TZ=Asia/Jakarta

RUN mkdir -p \
    /opt/data/memories \
    /opt/data/cron \
    /opt/bootstrap \
    && chown -R hermes:hermes /opt/data /opt/bootstrap

COPY --chown=hermes:hermes config.yaml /opt/data/config.yaml
COPY --chown=hermes:hermes SOUL.md /opt/data/SOUL.md

COPY --chown=hermes:hermes USER.md \
    /opt/data/memories/USER.md

COPY --chown=hermes:hermes MEMORY.md \
    /opt/data/memories/MEMORY.md

# Alias agar USER.md dan MEMORY.md juga dapat ditemukan dari root /opt/data
RUN ln -sf /opt/data/memories/USER.md /opt/data/USER.md \
    && ln -sf /opt/data/memories/MEMORY.md /opt/data/MEMORY.md \
    && chown -h hermes:hermes /opt/data/USER.md /opt/data/MEMORY.md

# Daily briefing cron bootstrap
COPY --chown=hermes:hermes cron/daily_news_prompt.txt \
    /opt/bootstrap/daily_news_prompt.txt

COPY --chown=hermes:hermes start.sh \
    /opt/bootstrap/start.sh

RUN chmod +x /opt/bootstrap/start.sh

CMD ["bash", "/opt/bootstrap/start.sh"]
