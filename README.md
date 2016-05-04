# Running a tinc gateway in a Docker container

Setup based on https://www.digitalocean.com/community/tutorials/how-to-install-tinc-and-set-up-a-basic-vpn-on-ubuntu-14-04

This node is meant to be accessible from a public IP and be the first node that
other nodes on the VPN connects to.

No special capabilties or privileges are needed on the host as no interface is
created by tinc. This is achieved by setting `DeviceType = dummy` in
`tinc.conf`.

## Configuring the gateway

1. Edit tinc/hosts/gateway to add in the public IP/DNS for the gateway


1. Build the Docker image
  ```
  docker build -t tinc-gateway .
  ```

1. Generate 4096 bits RSA public/private key pair for the gateway node. The private key
   will be written as tinc/rsa_key.priv and the public key will be appended to
   tinc/hosts/gateway.

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
