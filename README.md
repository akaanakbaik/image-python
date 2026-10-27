# Python Docker Images

Multi-architecture Python Docker images for Pterodactyl and other containerized applications.

## Supported versions

| Python | GHCR tag |
|---|---|
| 3.15 | `python_3.15` |
| 3.14 | `python_3.14` |
| 3.13 | `python_3.13` |
| 3.12 | `python_3.12` |
| 3.11 | `python_3.11` |

Registry: `ghcr.io/akaanakbaik/image-python`

Platforms: `linux/amd64`, `linux/arm64`.

Includes pip, Bash, Git, curl, compiler toolchain, and tini.

## Pterodactyl

Example image:

`ghcr.io/akaanakbaik/image-python:python_3.14`

Example STARTUP:

`python main.py`

The image runs as UID/GID 1000 in `/home/container`.

## Notes

Python packages can be installed using pip. The availability of a Docker tag does not guarantee that a Python release is stable or supported. Check Python release status before production use.
