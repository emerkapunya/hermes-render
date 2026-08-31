FROM nousresearch/hermes-agent:latest

USER root

# =========================================================
# ASPRI MRK ENVIRONMENT
# =========================================================

ENV HERMES_HOME=/opt/data
ENV TZ=Asia/Jakarta

# =========================================================
# DIRECTORY STRUCTURE
# =========================================================

RUN mkdir -p \
    /opt/data/memories \
    /opt/data/cron \
    /opt/data/cron/output \
    /opt/data/sessions \
    /opt/data/logs \
    /opt/data/skills \
    /opt/bootstrap

# =========================================================
# HERMES CONFIG
# =========================================================

COPY config.yaml /opt/data/config.yaml

# =========================================================
# SOUL
# Hermes membaca SOUL.md dari HERMES_HOME/SOUL.md
# =========================================================

COPY SOUL.md /opt/data/SOUL.md

# =========================================================
# USER + MEMORY
# Hermes membaca keduanya dari HERMES_HOME/memories/
# =========================================================

COPY USER.md /opt/data/memories/USER.md
COPY MEMORY.md /opt/data/memories/MEMORY.md

# Alias agar file juga mudah ditemukan dari /opt/data
RUN ln -sf /opt/data/memories/USER.md /opt/data/USER.md \
    && ln -sf /opt/data/memories/MEMORY.md /opt/data/MEMORY.md

# =========================================================
# CRON BOOTSTRAP
# =========================================================

COPY cron/daily_news_prompt.txt /opt/bootstrap/daily_news_prompt.txt
COPY start.sh /opt/bootstrap/start.sh

RUN chmod +x /opt/bootstrap/start.sh

# =========================================================
# PERMISSIONS
# =========================================================

RUN chown -R hermes:hermes /opt/data \
    && chown -R hermes:hermes /opt/bootstrap \
    && chown -h hermes:hermes /opt/data/USER.md \
    && chown -h hermes:hermes /opt/data/MEMORY.md

# Jangan gunakan USER hermes di akhir.
# Image Hermes memakai s6 dan perlu start sebagai root.

# =========================================================
# START ASPRI MRK
# =========================================================

CMD ["bash", "/opt/bootstrap/start.sh"]
