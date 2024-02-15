# EmailEngine-Docker
## Description

This project provides a base Docker image and configuration for installing EmailEngine as an ECS resource.

## Prerequisites
* Docker (see [here](https://docs.docker.com/desktop/) for instructions)
* Redis (Optional, see below, but install using the instructions [here](https://redis.io/docs/install/install-redis/) if needed

## Setup
### Redis
* Email Engine requires Redis in order to work. 
* The default configuration listed in the Docker instructions above points to a Redis installation that lives alongside the Email Engine application on the virtual disk. 
* However, it is probably desirable that a non-volatile instance be used in case of disaster, 
* Therefore, the `services.emailengine.environment.EENGINE_REDIS` setting in the `docker-compose.yaml` will need to reflect the following:
  * Redis server; 
  * Redis port; and,
  * Any required authentication details. 
### Port connections
All the following are unnamed (order dependant) children of `services.emailengine.ports`:
* API / Web: Defaults to `3000:3000`
* SMTP: Defaults to `2525:2525`
* IMAP Proxy: Defaults to `9993:9993`

## Local Execution
Before committing any changes to the configurations to Git they be tested locally by doing the following:
* Navigate to the base directory of this project and enter the following:
```commandline
docker-compose up -d
```
* After a minute or so after both the `redis-1` and `emailengine-1` processes spin up, connect to `http://localhost:3000` to verify connectivity.
* To exit, enter the following:
```commandline
docker-compose down
```

## References
* [Email Engine Docker Setup](https://emailengine.app/docker)
* [Email Engine](https://emailengine.app)
* [Redis](https://redis.io/)
