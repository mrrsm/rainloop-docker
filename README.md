![License Badge](https://img.shields.io/badge/license-MIT-green)

# Rainloop Docker

## Description
Installs the lastest rainloop community package and it's dependancies in a docker container and provides a docker-compose file to make it easy to run.

## Table of Contents 

* [Installation/Running](#installation/running)
  * [Docker Compose](#docker%20compose)
  * [Docker](#docker)
* [License](#license)

## Installation/Running

### Docker compose
1) Clone Repo
2) Run

    `docker-compose up -d`

### Docker
1) Clone Repo
2) Run

    `docker build -t rainloop .`
3) Run the following making sure to change the full path of the data dir to the data dir in this folder (or wherever you want to store your persistant data)

    `docker run -p 8000:80 -v /full/path/to/data:/var/www/rainloop/data rainloop`

## License

This project is covered under the MIT license.  See the [LICENSE](LICENSE) file.