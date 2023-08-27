FROM python:3.11.5-slim-bookworm

COPY requirements.txt requirements.txt

RUN python3 -m pip install -U -r requirements.txt && rm requirements.txt && gallery-dl --version

WORKDIR /data

ENTRYPOINT [ "gallery-dl" ]
