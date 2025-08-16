FROM python:3.13.7-slim-bookworm

COPY requirements.txt requirements.txt

RUN python3 -m pip install --no-cache-dir -U -r requirements.txt && rm requirements.txt && gallery-dl --version

# Install ffmpeg for optional post steps
RUN apt-get update && apt-get install --no-install-recommends --yes ffmpeg && rm -rf /var/lib/apt/lists/*

# Patch new features
RUN apt-get update && apt-get install --no-install-recommends --yes patch && rm -rf /var/lib/apt/lists/*
COPY patches /patches

RUN PYTHON_SITE_PACKAGES_DIR=$(python3 -c 'import site; print(site.getsitepackages()[0])') && \
    for patch in /patches/*.patch; do \
        patch -p1 -d "$PYTHON_SITE_PACKAGES_DIR" < "$patch"; \
    done

WORKDIR /data

ENTRYPOINT [ "gallery-dl" ]
