# minecraft

##### Build and run container
```shell
docker-compose up --build -d
```
##### Login to container
```shell
docker-compose run iac sh
```

##### Delete container
```shell
docker-compose down -v
```

```shell
gcloud auth configure-docker
```

```shell
gcloud auth login --cred-file=$GOOGLE_APPLICATION_CREDENTIALS
```
