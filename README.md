# Running a tinc gateway in a Docker container

Setup based on https://www.digitalocean.com/community/tutorials/how-to-install-tinc-and-set-up-a-basic-vpn-on-ubuntu-14-04

No special capabilties or privileges are needed on the host as no interface is
created by tinc. This is achieved by setting `DeviceType = dummy` in
`tinc.conf`.

## Configuring the gateway

1. Edit tinc/hosts/gateway to add in the public IP/DNS for the gateway


1. Build the Docker image
  ```
  docker build -t tinc-gateway .
  ```

1. Generate the public/private key pair for the gateway node
  ```
  docker run -v `pwd`/tinc:/etc/tinc tinc-gateway -K4096
  ```

## Running the gateway

To run the gateway node directly on the host machine, execute
```
docker run -v `pwd`/tinc:/etc/tinc tinc-gateway
```

## Adding a node to the vpn

1. Generate public/private key pair for the node

1. Copy the node's host file to tinc/hosts/

1. Copy tinc/hosts/gateway to the hosts folder on node and start the node
