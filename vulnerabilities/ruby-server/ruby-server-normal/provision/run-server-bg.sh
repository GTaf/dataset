sudo cp /vagrant/provision/server.sh /home/vagrant 
sudo cp -r /vagrant/provision/public /home/vagrant

sudo camflow --track-file /home/vagrant/server.sh propagate

sudo /home/vagrant/server.sh >/dev/null 2&>1 &