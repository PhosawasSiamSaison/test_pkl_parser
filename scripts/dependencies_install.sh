#!/bin/bash
export PATH=/home/ubuntu/.rvm/gems/ruby-3.3.4/bin:/home/ubuntu/.rvm/gems/ruby-3.3.4@global/bin:/home/ubuntu/.rvm/rubies/ruby-3.3.4/bin:/home/ubuntu/bin:/home/ubuntu/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/ubuntu/.rvm/bin:/home/ubuntu/.rvm/bin
# sudo kill -9 $(cat /var/www/test_pkl_parser/tmp/pids/server.pid)
cd /var/www/test_pkl_parser/
#sudo apt-get install ruby2.3-dev libffi-dev -y
# gem install nokogiri — — use-system-libraries
# bundle config build.nokogiri — use-system-libraries
gem install bundler:3.3.4 — user-install
bundle install
# sudo kill -9 $(lsof -i :3000 -t)
# rails s -d
