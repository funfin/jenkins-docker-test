# jenkins-docker-test


This project builds image for testing docker agent in jenkins pipeline.

working example - using DooD (Docker-outside-of-Docker):
```
docker run \
  -p 8080:8080 \
  -e SEEDJOB_GIT=https://github.com/funfin/jenkins-jobs-dsl-test.git \
  -v /var/lib/docker/:/var/lib/docker:rw \
  -v /sys:/sys:ro \
  -v /var/run:/var/run:rw \
  funfin/jenkins-docker-test
  
```

not working example - using DinD (Docker-in-Docker)
```
docker run --privileged -d -t -i --name dind docker:18-dind

docker run \
  -p 8080:8080 \
  -e SEEDJOB_GIT=https://github.com/funfin/jenkins-jobs-dsl-test.git \
  -e DOCKER_HOST=tcp://dind:2375 \
  --link dind:dind \
  funfin/jenkins-docker-test

```
