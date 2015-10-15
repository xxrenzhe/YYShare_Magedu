#!/bin/bash
# Function : config gitlab
# Author : Jacob.Yu
# CTime : 2015.10.15

# update gitlab data directory
sudo vi /var/opt/gitlab/gitlab-shell/config.yml # repos_path: "/data/git-data/repositories"
sudo vi /var/opt/gitlab/gitlab-rails/etc/gitlab.yml
#satellites:
#     path: /data/git-data/gitlab-satellites
#     ...
#gitlab_shell:
#     path: /opt/gitlab/embedded/service/gitlab-shell/
#     repos_path: /data/git-data/repositories

# ensure data directory exists
mkdir  -pv /data/git-data/gitlab-satellites
mkdir -pv /data/git-data/repositories
sudo chown -R git.git /data/git-data/

# restart gitlab service
sudo gitlab-ctl restart
