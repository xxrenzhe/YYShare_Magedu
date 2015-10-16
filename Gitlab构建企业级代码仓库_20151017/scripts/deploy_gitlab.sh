#!/bin/bash
# Function : deploy gitlab
# Author : Jacob.Yu
# CTime : 2015.10.15

# Install and configure the necessary dependencies
sudo yum -y install curl openssh-server postfix cronie
#sudo service postfix start
#sudo chkconfig postfix on
#sudo lokkit -s http -s ssh

# Add the GitLab package server and install the package
#curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
#sudo yum -y install gitlab-ce

# another way to install gitlab
# download url: https://packages.gitlab.com/gitlab/gitlab-ce?filter=rpms
sudo rpm -ivh ../rpms/gitlab-ce-8.0.5-ce.0.el6.x86_64.rpm

# config external_url
sudo vi /etc/gitlab/gitlab.rb # external_url 'http://123.59.68.177'

# Configure and start GitLab
sudo gitlab-ctl reconfigure
