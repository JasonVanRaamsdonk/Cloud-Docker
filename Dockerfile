FROM ubuntu:latest

RUN apt-get update

RUN apt-get install -y python3 python3-pip 
RUN pip3 install --upgrade pip

ADD /myapp /myapp

RUN pip3 install -r myapp/requirements.txt

EXPOSE 5000

WORKDIR /myapp

CMD python3 app.py
