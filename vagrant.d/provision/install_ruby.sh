#!/bin/bash

if [ "$OS" == "Ubuntu" ]; then
	sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
	
	#sudo apt-get -y install ruby-dev
fi

echo "installing RUBY"
#gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://rvm.io/mpapis.asc | sudo gpg --import -
curl -sSL https://rvm.io/pkuczynski.asc | sudo gpg --import -

curl -sSL https://get.rvm.io | bash -s stable --ruby
#source ~/.rvm/scripts/rvm

# Use this version
#rvm use 2.1.5
