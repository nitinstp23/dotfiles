#!/bin/sh

# Ruby-on-Rails setup for Ubuntu-14.04

RED='\033[0;31m'
NC='\033[0m' # No Color

echo "${RED} Refreshing packages ${NC}"
dpkg -l > default_packages
# Add Mongodb to default_packages source list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update
sudo apt-get upgrade -y
echo

echo "${RED} Installing aptitude... ${NC}"
sudo apt-get install -y aptitude
echo

echo "${RED} Updating aptitude... ${NC}"
sudo aptitude update
echo

echo "${RED} Installing dev tools... ${NC}"
sudo aptitude install -y build-essential git-core curl openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion ruby-dev libpq-dev libcurl4-openssl-dev libapr1-dev libaprutil1-dev
echo

echo "${RED} Installing Apache... ${NC}"
sudo aptitude install -y apache2 apache2-prefork-dev
echo

echo "${RED} Installing PostgreSql... ${NC}"
sudo aptitude install -y postgresql-client postgresql
echo

echo "${RED} Installing rvm, ruby & rails (Stable versions) ${NC}"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --rails
/bin/bash --login
echo

echo "${RED} Setting RVM to use ruby-2.2.0 as default ${NC}"
rvm use ruby-2.2.0 --default
echo

echo "${RED} Installing OpenJDK-7 ${NC}"
sudo aptitude install -y openjdk-7-jdk
echo

echo "${RED} Installing Mongodb ${NC}"
sudo apt-get install -y mongodb-org
echo

echo "${RED} Installing Oh-My-Zsh ${NC}"
sudo rm -rf ~/.oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh
echo

echo "${RED} Installation finished!!! ${NC}"
echo "${RED} Consider restarting your machine. ${NC}"
