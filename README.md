# YYShare_Magedu
马哥教育YY分享课程资料

使用脚本说明
===========

脚本路径：Gitlab构建企业级代码仓库_20151017/scripts

	* deploy_gitlab.sh: 部署gitlab
	* config_gitlab.sh: 配置gitlab
	* repo_test.sh：    本地同步repo_test代码库
	* config_smtp.sh:   配置第三方邮件服务器
	* backup_gitlab.sh: 数据备份与恢复
	* open_https.sh：   Web访问强制使用HTTPS

How to clone
==========

因为本repo中包括了gitlab安装包(gitlab-ce-8.0.5-ce.0.el6.x86_64.rpm)，文件较大，超出了GitHub的文件上传限制；

故使用了Git-Lfs的方式进行大文件上传，故大家在clone本repo时，也需要在本地安装git-lfs；

git-lfs的安装方式见文档：https://git-lfs.github.com/；

然后执行 git clone即可;

Author
==========

The repo created by Jacob.Yu(jie.yu@wenba100.com) who is one of members of Magedu.Inc(www.magedu.com)! 
