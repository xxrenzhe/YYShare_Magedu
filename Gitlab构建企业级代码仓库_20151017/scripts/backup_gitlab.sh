#!/bin/bash
# Function : backup gitlab data and config periodcally
# Author : Jacob.Yu
# CTime : 2015.10.15

# backup data 
sudo bash -c "cat <<- EOF >> /etc/gitlab/gitlab.rb

	gitlab_rails['backup_path'] = \"/data/git_backups\"
	gitlab_rails['backup_keep_time'] = 604800
EOF"

mkdir /data/git_backups >> /dev/null 2>&1

sudo bash -c "echo '0 2 * * * /usr/bin/gitlab-rake gitlab:backup:create' >> /var/spool/cron/root"
sudo bash -c "cat <<- "EOF" >> /var/spool/cron/root
	30 2 * * * /bin/bash -c 'umask 0077; tar -cf /data/git_backups/\\\$(date \"+etc-gitlab-%s.tar\") -C / etc/gitlab var/opt/gitlab/gitlab-shell/config.yml var/opt/gitlab/gitlab-rails/etc/gitlab.yml'
EOF"

# restore data
## 将备份数据拷贝至新服务器的备份目录下，如/data/git_backups
#sudo cp 1393513186_gitlab_backup.tar /data/git_backups
## 停止服务
#sudo gitlab-ctl stop unicorn
#sudo gitlab-ctl stop sidekiq
## 恢复数据
#sudo gitlab-rake gitlab:backup:restore BACKUP=1393513186
## 重启服务
#sudo gitlab-ctl start
## 创建satellites
#sudo gitlab-rake gitlab:satellites:create
## 检查GitLab
#sudo gitlab-rake gitlab:check SANITIZE=true
