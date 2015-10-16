#!/bin/bash
# Function : config smtp server to send email
# Author : Jacob.Yu
# CTime : 2015.10.15

sudo bash -c "cat <<- EOF >> /etc/gitlab/gitlab.rb

	gitlab_rails['gitlab_email_from'] = \"gitlab@example.com\" # 发件人的邮箱地址必须和认证的用户名保持一致
	gitlab_rails['gitlab_email_display_name'] = \"gitlab@example.com\"
	gitlab_rails['gitlab_email_reply_to'] = \"noreply@example.com\"

	gitlab_rails['smtp_enable'] = true
	gitlab_rails['smtp_address'] = \"smtp.exmail.qq.com\"
	gitlab_rails['smtp_port'] = 465
	gitlab_rails['smtp_user_name'] = \"gitlab@example.com\"
	gitlab_rails['smtp_password'] = \"xxxx\"
	gitlab_rails['smtp_domain'] = \"exmail.qq.com\"
	gitlab_rails['smtp_authentication'] = \"login\"     # 465端口对应login登录方式，gmail的587端口对应plain登录方式
	gitlab_rails['smtp_enable_starttls_auto'] = true
	gitlab_rails['smtp_tls'] = true                   # 官方文档中缺失的参数，默认是false
	gitlab_rails['smtp_openssl_verify_mode'] = \"none\"
	user['git_user_email'] = \"gitlab@example.com\"

EOF"

sudo gitlab-ctl reconfigure # 使配置生效
sudo gitlab-ctl restart 
