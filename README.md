# Seafile

## 下载
<a href="https://download.seafile.com/d/6e5297246c/?p=/pro&mode=list" target="_blank">Seafile专业版服务端→</a>


## 准备
Mysql: 
```
apt install mysql-server -y
```
提前建立好用户和数据库：
```mysql
# mysql 8
CREATE USER 'seafile'@'localhost' IDENTIFIED WITH mysql_native_password BY 'yourpassword';
# mysql 8-
CREATE USER 'seafile'@'localhost' IDENTIFIED BY 'yourpassword';

CREATE DATABASE seafile;
CREATE DATABASE seahub;
CREATE DATABASE seafileccnet;

GRANT ALL ON seafile.* to seafile@localhost;
GRANT ALL ON seahub.* to seafile@localhost;
GRANT ALL ON seafileccnet.* to seafile@localhost;
```


## 部署
<a href="https://cloud.seafile.com/published/seafile-manual-cn/deploy_pro/download_and_setup_seafile_professional_server.md" target="_blank">Seafile文档→</a>

在setup中填写提前建立好的用户和数据库信息。


## Reverse Proxy
### Nginx
[Seafile.nginx](https://github.com/cocogoat-moe/server/blob/main/nginx/conf/sites/seafile.nginx)


