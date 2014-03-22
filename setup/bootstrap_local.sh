#!/usr/bin/env bash

curl -L https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm requirements
rvm install 2.0.0
gem install --no-rdoc --no-ri cucumber capybara rspec selenium-webdriver headless
