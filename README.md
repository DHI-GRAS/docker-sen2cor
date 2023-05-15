# Sen2Cor-Docker

A dockerized version of Sen2Cor 2.8.0.

## Usage

Simply run
```bash
$ docker build https://github.com/DHI-GRAS/docker-sen2cor.git -t sen2cor
$ docker run sen2cor --help
```
which executes `L2A_Process` from Sen2Cor.
