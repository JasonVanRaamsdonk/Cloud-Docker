# Docker

## Create EC2 instance

- Create an EC2 instance
- Use **Ubuntu Server 18.04 LTS** as AMI type.
- Security:
  - Enable _SSH_ access at port _22_, all IPs
  - Enable _HTTP_ access at port _80_, all IPs
  - Enable _custom TCP Rule_ at port _5000_ all IPs

### Sign into instance

> ssh -i C:\Users\jason\Downloads\downloads_inner\permission keys\dockerkey.pem ubuntu@3.95.30.233

