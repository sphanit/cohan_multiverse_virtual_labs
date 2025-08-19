# CoHAN2.0 with Multiverse Docker
This repository provides online implementation of [CoHAN2.0](https://github.com/LAAS-HRI/CoHAN2.0) using MuJoCo Simulator from [Multiverse Framework](https://github.com/Multiverse-Framework).

You can use this framework in two ways: on the cloud or locally.

## Run CoHAN-Multiverse Docker on the Cloud using BinderHub

- [Link to the BinderHub](https://binder.intel4coro.de/v2/gh/sphanit/cohan_multiverse_virtual_labs/HEAD)

## Run CoHAN-Multiverse Docker locally

### Prerequisites

Ensure that you have [Docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository) installed.

Verify your versions of `docker` and `docker compose` by running:

```bash
$ docker -v
Docker version 28.3.2, build 578ccf6
$ docker compose version
Docker Compose version v2.38.2
```

### 1. Set up Docker

Run the following commands to clone the repository and configure Docker:

```bash
git clone https://github.com/sphanit/cohan_multiverse_virtual_labs.git && cd cohan_multiverse_virtual_labs

docker compose pull
```
Alternatively, you can do some changes to the docker image and build (takes a longer time), instead of pulling the existing image
```
docker compose build
```

### 2. Start the Docker Compose service

To start the service, run the following command:

```bash
docker compose up
```

Once the service is running, open your browser and navigate to [http://127.0.0.1:8888/lab](http://127.0.0.1:8888/lab).

From there, you can either click on "Desktop" to access the virtual machine.
