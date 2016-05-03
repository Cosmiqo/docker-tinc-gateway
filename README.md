# Running a tinc gateway in a Docker container

Setup based on https://www.digitalocean.com/community/tutorials/how-to-install-tinc-and-set-up-a-basic-vpn-on-ubuntu-14-04

## Setting up a new VPN

1. Build the Docker image
```
docker build -t tinc-gateway .
```

2. Generate the public/private key pair for the gateway node
```
docker run -v `pwd`/tinc:/etc/tinc tinc-gateway -K4096
```

## Running the gateway node

To run the gateway node directly on the host machine, execute
```
docker run -v `pwd`/tinc:/etc/tinc tinc-gateway
```

## Configuring a node to contact the gateway

Copy tinc/hosts/gateway to the hosts folder on node

