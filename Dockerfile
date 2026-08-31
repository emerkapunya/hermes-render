FROM nousresearch/hermes-agent:latest

USER root

ENV HERMES_HOME=/opt/data
ENV TZ=Asia/Jakarta

# =========================================================
# DIRECTORIES
# =========================================================

RUN mkdir -p \
    /opt/data/memories \
    /opt/data/cron \
    /opt/data/sessions \
    /opt/data/logs \
    /opt/data/skills/daily-news-briefing \
    /opt/bootstrap

# =========================================================
# CONFIG
# =========================================================

COPY config.yaml /opt/data/config.yaml

# =========================================================
# SOUL
# =========================================================

COPY SOUL.md /opt/data/SOUL.md

# =========================================================
# USER + MEMORY
# =========================================================

COPY USER.md /opt/data/memories/USER.md
COPY MEMORY.md /opt/data/memories/MEMORY.md

RUN ln -sf /opt/data/memories/USER.md /opt/data/USER.md \
    && ln -sf /opt/data/memories/MEMORY.md /opt/data/MEMORY.md

# =========================================================
# SKILLS
# =========================================================

COPY skills/daily-news-briefing/SKILL.md \
    /opt/data/skills/daily-news-briefing/SKILL.md

# =========================================================
# STARTUP
# =========================================================

COPY start.sh /opt/bootstrap/start.sh

RUN chmod +x /opt/bootstrap/start.sh

# =========================================================
# PERMISSIONS
# =========================================================

RUN chown -R hermes:hermes /opt/data \
    && chown -R hermes:hermes /opt/bootstrap \
    && chown -h hermes:hermes /opt/data/USER.md \
    && chown -h hermes:hermes /opt/data/MEMORY.md

# Jangan USER hermes di sini.
# s6 container harus start sebagai root.

CMD ["bash", "/opt/bootstrap/start.sh"]
