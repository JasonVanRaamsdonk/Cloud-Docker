# Docker - lab 11

## EC2 instances

- Create three EC2 instance called *Manager*, *worker-1*, *worker-2*

- ensure all contain the following **Security Group**

![sg](https://github.com/JasonVanRaamsdonk/Cloud-Docker/blob/master/images/security_group.png)

- Initialize the *Manager* instance as the manager node:

> sudo docker swarm init

![swarm_init](https://github.com/JasonVanRaamsdonk/Cloud-Docker/blob/master/images/swarm_init.jpg)

- Access the *worker* instances and join them to the *manager* node:

> sudo docker swarm join --token SWMTKN-1-1lzztf0ayroum6iandqlvpim2624g0t5tyhdl4ivkaxhcc6yoh-byfpz35n4cfejbewqvjr15m85 172.31.93.51:2377

![join](https://github.com/JasonVanRaamsdonk/Cloud-Docker/blob/master/images/swarm_join.jpg)

- verify all workers have joined

> sudo docker node ls

- creating 5 docker images, which will run across the 3 nodes:

> sudo docker service create --replicas 5 -p 80:80 --name web nginx

- view replicas

> sudo docker ps web

- view **nginx** running in browser

![nginx](https://github.com/JasonVanRaamsdonk/Cloud-Docker/blob/master/images/nginx.png)

## Next

- clone the repo with the necessary Docker file into the manager instance:

> git clone https://github.com/JasonVanRaamsdonk/lab5-init-repo

- inside the cloned directory build and run the docker image

> docker build -t lab5-demon .

- remove docker image

> docker service rm web

- run new image

> docker run –d –p 80:5000 –-name webserver1 lab5-demon

- open *webserver* in browser using the *public IP*

![upload_file](https://github.com/JasonVanRaamsdonk/Cloud-Docker/blob/master/images/uploaddile.png)

- upload an image and check if its there:

> sudo docker exec -it 63f32028b236 /bin/bash

- stop and remove webserver

> docker stop webserver

> docker rm webserver

## PART 4: RUN DOCKER IMAGE AS A SERVICE

- create a service based on lab5-demon image with 10 replicas

> sudo docker service create --replicas 3 -p 80:5000 --name webservice1 baselm/lab5-image

- Now let us add some visualisation feature to the swarm. Run the following command

>docker service create \
  --name=viz \
  --publish=8080:8080/tcp \
  --constraint=node.role==manager \
  --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  dockersamples/visualizer

![visualise_1](https://github.com/JasonVanRaamsdonk/Cloud-Docker/blob/master/images/vertical_small.png)

## Task 1: Vertical Scaling using Docker Swarm

- scale web service:

> sudo docker service scale webservice1=10

![visualise_2](images/vertical_large.png)

## Task 2: Horizontal Scaling

- Create an AMI (**Docker AMI**) using the previous *Manager* instance state

- Launch three new instances using the **Docker AMI**

- Demote 2 of the instance from manager to worker nodes:

> docker leave swarm --force

- generate the *join* token from the manager node, then use token to add workers:

> docker swarm join-token worker

- to join as manager:

> docker swarm join-token manager

- Visit the visualisation service at port 8080 to see all nodes and containers in the swarm.

![visualise_3](images/horizontal_large.png)

### Docker Swarm Monitoring

- From the manager node *ssh* access. Pull the following github repository

> git clone https://github.com/baselm/lab-extra.git

- Update the *Docker-SG* with the following rules:
  - TCP: 9323, source: 0.0.0.0/0
  - TCP: 9090, source: 0.0.0.0/0
  - TCP: 3000, source: 0.0.0.0/0
  - TCP: 9093, source: 0.0.0.0/0
  - TCP: 9094, source: 0.0.0.0/0

- *cd* into the the newly cloned directory and run the folling command:

> ADMIN_USER=admin
ADMIN_PASSWORD=admin
SLACK_URL=https://hooks.slack.com/services/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
SLACK_CHANNEL=devops-alerts
SLACK_USER=alertmanager
docker stack deploy -c docker-compose.yml mon

- join the DT228 Slack channel @:

> https://dt228cloudcomputing.slack.com/

- Access The **Grafana** Dashboard on port *3000* and sign in using:
  - username: **admin**
  - password: **admin**

![grafana_login](images/grafana_login.png)

![grafana_dash](images/grafana.png)

- Perform the following command to perform a stress test on the docker swarm:

> docker run --rm -it progrium/stress --cpu 2 --io 1 --vm 2 --vm-bytes 128M --timeout 200s

- Access the Alert Dashboard on Port *9093*:

![alert_dash](images/alert_service.png)

- From the manager, to verify that all services are fully converged run the following command:

> docker service ls

![converge](images/converge.png)

- Updated state of visualizer

![updated_vis](images/visual_after_running.png)