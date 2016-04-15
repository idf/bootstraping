#!/bin/bash
# grant nonroot access to docker to avoid `sudo docker ...`

sudo -v
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart
newgrp docker
