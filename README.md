# Docker

## General Information

- *Docker is a software container platform. Developers use Docker to ship the software quickly and to eliminate interoperability problem of software dependencies. A container is used to package software in a format that can run isolated on a shared operating system.*

## EC2 instance

- Create an EC2 instance
- Use **Ubuntu Server 18.04 LTS** as AMI type.
- Security:
  - Enable _SSH_ access at port _22_, all IPs
  - Enable _HTTP_ access at port _80_, all IPs
  - Enable _custom TCP Rule_ at port _5000_ all IPs

- Sign into instance

> ssh -i C:\Users\jason\Downloads\downloads_inner\permission_keys\dockerkey.pem ubuntu@3.95.30.233

- install Docker

> curl -fsSL get.docker.com|sh

- run docker as super user

> sudo usermod -aG docker ubuntu

- reboot instance

> sudo reboot