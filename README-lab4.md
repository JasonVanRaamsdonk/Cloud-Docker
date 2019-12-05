# Docker - lab 4

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

- clone the repo with the docker file inside

> git clone https://github.com/JasonVanRaamsdonk/Cloud-Docker

- within the directory build a docker image

> docker build -t mywebapp .

- view all images

> docker images

![docker_images](https://github.com/JasonVanRaamsdonk/Cloud-Docker/blob/master/images/docker_images.jpg)

- run the web app

> docker run -p 80:5000 -d mywebapp

- check if running

> docker ps

![docker_running](https://github.com/JasonVanRaamsdonk/Cloud-Docker/blob/master/images/docker_running_image.jpg)

- stop running the container

> docker stop < container-id >

### Pull and run a ready made instance

- create a new EC2 instance and log in

> ssh -i C:\Users\jason\Downloads\downloads_inner\permission_keys\dockerkey.pem ubuntu@54.237.208.217

- install docker once again
- pull ready-made instance, then run application

> docker pull baselm/mywebapp

> docker run -p 80:5000 -d baselm/mywebapp

- open the public dns from the EC2 instance to view the web page

![flask](https://github.com/JasonVanRaamsdonk/Cloud-Docker/blob/master/images/browser_running.jpg)

- create custom Docker file, along with an *index.html* & *contact.html* page.

- Create a **Flask** application to open these files via *app.route()*

- build docker container and test the Flask application

![flask_app](https://github.com/JasonVanRaamsdonk/Cloud-Docker/blob/master/images/Screenshot%20(69).png)

