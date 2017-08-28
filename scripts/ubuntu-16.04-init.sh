#!/bin/bash

# aliyun mirror
sudo cat > /etc/apt/sources.list << EOF

deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse

EOF

sudo apt update

# frequently used tools
sudo apt install tmux htop vim supervisor

# python2 related tools
sudo apt install python-dev python-pip
mkdir ~/.pip
# set pip source
cat > ~/.pip/pip.conf << EOF

[global]
index-url = http://pypi.douban.com/simple

[install]
trusted-host=pypi.douban.com

EOF

sudo pip install --upgrade pip
sudo pip install virtualenv
sudo pip install "ipython<6.0"
sudo pip install jupyter
sudo pip install shadowsocks

# install zsh&oh-my-zsh
sudo apt install zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"



