# gallery-dl Docker Container Image

Command-line program to download image galleries and collections from several image hosting sites.

[https://github.com/mikf/gallery-dl](https://github.com/mikf/gallery-dl)

## Usage

The usage of this container image is pretty straightforward. It's basically just gallery-dl as a container image.

You need to mount `/data/gallery-dl` if you want to access the data on the host system.

```bash
docker run -v $PWD/data:/data/gallery-dl ghcr.io/skaronator/gallery-dl https://gfycat.com/admirablefearfulkangaroo-rick-astley
```

### Config file

You can also mount a gallery-dl config file in the container.

```bash
docker run -v $PWD/config.json:/gallery-dl/config.json:ro ghcr.io/skaronator/gallery-dl
```

Check the [official documentation to see](https://github.com/mikf/gallery-dl/#locations) at which locations a configuration file is expected.

```bash
docker run -v $PWD/config.json:/config.json:ro ghcr.io/skaronator/gallery-dl --config /config.json https://gfycat.com/admirablefearfulkangaroo-rick-astley
```

You can also define your own location with the [command options](https://github.com/mikf/gallery-dl/blob/master/docs/options.md#configuration-options).
