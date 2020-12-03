# Docker Tavern

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Build Status](https://drone.buttahtoast.ch/api/badges/buttahtoast/docker-tavern/status.svg)](https://drone.buttahtoast.ch/buttahtoast/docker-tavern)

Tavern is an advanced pytest based API testing framework for HTTP, MQTT or other protocols. This Repository implements a Docker Image containg tavern.

Vist Tavern's website to learn more:

  * [https://tavern.readthedocs.io/en/latest/](https://tavern.readthedocs.io/en/latest/)

## Running tavern

Simply map your tavern suites into the tavern container:

```
$ docker run -v ./tavern-tests:/tavern -it buttahtoast/docker-tavern:latest
```

Supported Tags: https://hub.docker.com/repository/docker/buttahtoast/docker-tavern/tags

### Configuration

The configuration for this tavern Docker image is made via Environment variables and is kept as simple as possible.

|**Environment Variable**|**Description**|**Default**|
|:-----------------------|:--------------|:----------|
| `TEST_DIRECTORY` | Directory which holds all the tavern test suites. which should executed. Make sure the tavern user has access to the directory and all it's files. | `/tavern/` |
| `DEBUG` | Enables logging on DEBUG level | `false` |
| `LOG_TO_FILE` | Log to a specific file instead of logging to stdout. Value holds the file which will be logged to. | - |

## Contributing

We'd love to have you contribute! Please refer to our [contribution guidelines](CONTRIBUTING.md) for details.

**By making a contribution to this project, you agree to and comply with the
[Developer's Certificate of Origin](https://developercertificate.org/).**
