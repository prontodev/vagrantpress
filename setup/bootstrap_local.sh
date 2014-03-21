#!/usr/bin/env bash

curl -L https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm requirements
rvm install 2.0.0
gem install --no-rdoc --no-ri cucumber capybara rspec selenium-webdriver headless

su vagrant <<'EOF'
echo 'export WORKON_HOME=$HOME/.virtualenvs' >> /home/vagrant/.bash_profile
echo 'export PIP_VIRTUALENV_BASE=$WORKON_HOME' >> /home/vagrant/.bash_profile
echo 'source /usr/local/bin/virtualenvwrapper.sh' >> /home/vagrant/.bash_profile
source /usr/local/bin/virtualenvwrapper.sh
source /home/vagrant/.bash_profile
mkvirtualenv pronto-vagrantpress-env
workon pronto-vagrantpress-env
pip install -r /vagrant/requirements/local.txt
EOF
echo "Pronto VagrantPress environment is set up"

su vagrant <<'EOF'
mkdir /home/vagrant/log/
EOF
cp /vagrant/setup/local/pronto-dashboard.nginx /etc/nginx/sites-enabled/.
rm /etc/nginx/sites-enabled/default
cp /vagrant/setup/local/upstart-pronto-dashboard.conf /etc/init/.
service nginx restart
service upstart-pronto-dashboard start
