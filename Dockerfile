FROM nousresearch/hermes-agent:latest

# Hermes s6 container harus start sebagai root
USER root

# Lokasi utama data Hermes
ENV HERMES_HOME=/opt/data
ENV TZ=Asia/Jakarta

# =========================================================
# CREATE HERMES DIRECTORIES
# =========================================================

RUN mkdir -p \
    /opt/data/memories \
    /opt/data/cron \
    /opt/data/sessions \
    /opt/data/logs \
    /opt/data/skills \
    /opt/bootstrap

# =========================================================
# CONFIGURATION
# =========================================================

COPY config.yaml /opt/data/config.yaml

# =========================================================
# SOUL / AGENT IDENTITY
# =========================================================

COPY SOUL.md /opt/data/SOUL.md

# =========================================================
# USER PROFILE + LONG TERM MEMORY
# =========================================================

COPY USER.md /opt/data/memories/USER.md
COPY MEMORY.md /opt/data/memories/MEMORY.md

# Alias agar agent juga menemukan file dari root /opt/data
RUN ln -sf /opt/data/memories/USER.md /opt/data/USER.md \
    && ln -sf /opt/data/memories/MEMORY.md /opt/data/MEMORY.md

# =========================================================
# CRON BOOTSTRAP
# =========================================================

COPY cron/daily_news_prompt.txt /opt/bootstrap/daily_news_prompt.txt
COPY start.sh /opt/bootstrap/start.sh

RUN chmod +x /opt/bootstrap/start.sh

# =========================================================
# FILE OWNERSHIP
# =========================================================

RUN chown -R hermes:hermes /opt/data \
    && chown -R hermes:hermes /opt/bootstrap \
    && chown -h hermes:hermes /opt/data/USER.md \
    && chown -h hermes:hermes /opt/data/MEMORY.md

# PENTING:
# Jangan tambahkan USER hermes di sini.
# s6-overlay membutuhkan container start sebagai root.

# =========================================================
# START ASPRI MRK
# =========================================================

CMD ["bash", "/opt/bootstrap/start.sh"]
