#!/bin/bash
# Function : open https login 
# Author : Jacob.Yu
# CTime : 2015.10.15

# create self-signed certificate 
sudo yum -y install openssl
cd /etc/pki/CA
sudo bash -c '(umask 077;openssl genrsa -out private/cakey.pem 2048)'
sudo bash -c 'openssl req -new -x509 -key private/cakey.pem -out cacert.pem -days 3650'
sudo touch index.txt serial crlnumber
sudo bash -c "echo 01 > serial"

sudo mkdir -p /etc/gitlab/ssl
sudo bash -c 'cd /etc/gitlab/ssl'
sudo bash -c '(umask 077;openssl genrsa -out 123.59.68.177.key 1024)'
sudo bash -c 'openssl req -new -key 123.59.68.177.key -out 123.59.68.177.csr'

sudo bash -c 'openssl ca -in 123.59.68.177.csr -out 123.59.68.177.crt -days 365'
sudo chmod 700 /etc/gitlab/ssl

# reconfig external_url
sudo vi /etc/gitlab/gitlab.rb # external_url 'https://123.59.68.177:2443'
sudo bash -c "cat <<- EOF >> /etc/gitlab/gitlab.rb
	
	nginx['redirect_http_to_https'] = true
EOF"

sudo gitlab-ctl reconfigure # 使配置生效
sudo gitlab-ctl restart 
