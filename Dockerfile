FROM python:3.12.1-slim-bookworm

COPY requirements.txt requirements.txt

RUN python3 -m pip install -U -r requirements.txt && rm requirements.txt && gallery-dl --version

# Install ffmpeg for optional post steps
# Install envsubst for injecting secrets from env variables into your config file
RUN apt-get update && apt-get install --no-install-recommends --yes ffmpeg gettext-base && rm -rf /var/lib/apt/lists/*

WORKDIR /data

ENTRYPOINT [ "gallery-dl" ]
