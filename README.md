# jenkins-docker-test
```
docker run \
  -p 8080:8080 \
  -e SEEDJOB_GIT=https://github.com/funfin/jenkins-jobs-dsl-test.git \
  -v /var/lib/docker/:/var/lib/docker:rw \
  -v /sys:/sys:ro \
  -v /var/run:/var/run:rw \
  funfin/jenkins-docker-test
  
  ```
