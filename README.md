# Oracle Data Science Docker

Download the oracle instant client drivers. Past all the files into the directory `instantclient_18_5`.

```bash
mkdir instantclient_18_5
cp ~/instantclient_18_5/. instantclient_18_5/
```

Create the image. When you're no in the docker directory, use `-f` to give the path to `Dockerfile`

```bash
docker build -t oracle-datascience .
```

Run a container on the created image.
```bash
docker run -d -P --name <container_name> oracle-datascience
```

Enter the created container.

```bash
docker exec -it <container_name> bash
```

As you can see in the Dockerfile, port 22 and port 8080 are being exposed during the image creation. If you would like to see on which ports on your hosts machine the exposed ports are mapped, you can use the following command:

```bash
docker port <container_name> <port>
```

Use the following command to get to local IP address on which the container is running.

```bash
docker inspect -f "{{ .NetworkSettings.IPAddress }}" <container_name>
