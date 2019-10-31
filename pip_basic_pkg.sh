sudo -v
# sudo apt-get install -y python-psutil
sudo -H pip install psutil
sudo -H pip install -U setuptools
sudo -H pip install pathlib
sudo -H pip install requests[security]  # SSL connection
sudo -H pip install tldr  # replace man
sudo -H pip install tmuxp
sudo -H pip install percol
sudo -H pip install ujson  # ultrafast json
sudo -H pip install --upgrade httpie  # CLI HTTP client for curl

# fix PIL, or comment out PIL inside requirements.txt, or use pillow instead
# sudo pip install PIL --allow-external PIL --allow-unverified PIL;
