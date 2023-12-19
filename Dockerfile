FROM python:3.12.1-slim-bookworm

COPY requirements.txt requirements.txt

RUN python3 -m pip install -U -r requirements.txt && rm requirements.txt && gallery-dl --version

# Install envsubst for injecting secrets from env variables into your config file
RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*

WORKDIR /data

ENTRYPOINT [ "gallery-dl" ]
