FROM ubuntu:latest
MAINTAINER JasonVanRaamsdonk
RUN apt-get update
RUN apt-get install -y python3 python3-pip
ADD /serving_static /myapp
RUN pip3 install --upgrade pip
RUN apt-get install -y curl
RUN curl -fsSL https://get.docker.com/|sh
RUN pip3 install -r /myapp/requirements.txt
EXPOSE 5000 8080
WORKDIR /myapp
CMD python3 serve.py
