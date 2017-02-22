# 准备

Give Me Some Time 是 flask 的应用，是一个请假系统。
。。。

## Flask

制作 Flask 的 Docker 镜像，需要：

* Python 的基础镜像

* App

* Enterpoint

# Dockerfile 的编写

镜像基于 官方 Python 的 3.x 的最新镜像。

```Dockerfile
FROM python:latest
```

然后我们……

```Dockerfile
MAINTAINER Qinka <qinka@live.com>
```

然后我们将程序复制进去

```Dockerfile
RUN mkdir -p /app
WORKDIR /app
COPY . /app/
```

然后是安装所需的与 MySQL 有关的东西

```Dockerfile
RUN apt update && apt install -y python-mysqldb
```

然后是安装依赖

```Dockerfile
RUN pip3 install -r /app/REQUIREMENTS
```

然后设置

```Dockerfile
EXPOSE 8080
ENTRYPOINT ["/app/entrypoint.sh"]
```

最后构建镜像。

# Enterpoint

Enterpoint 是镜像的入口程序，用于控制进入。镜像需要控制与数据库有关的内容。

entrypoint 内容：

```bash
#!/bin/bash

function  config
{
  echo "import os"
  echo "SECRET_KEY = 'thisGGisRRa12secret'"
  echo "STATIC_PATH = os.path.join(os.path.dirname(__file__), \"./static\")"
  echo "TEMPLATE_PATH = os.path.join(os.path.dirname(__file__), \"./templates\")"
  echo "DB_USER      = '"$1"'"
  echo "DB_HOST      = '"$2"'"
  echo "DB_PWD       = '"$3"'"
  echo "DB_PORT      =  "$4
  echo "DB_NAME      = '"$5"'"
  echo "ADMIN_NAME   = '"$6"'"
  echo "ADMIN_PASSWD = '"$7"'"
}

echo Config
## output config.py
config $1 $2 $3 $4 $5 $6 $7 > /app/config.py


echo Launching ......
python3 /app/main.py
```

参数依次是：数据库的用户名、数据库的地址、数据库的密码、数据库的端口、数据库的管理员的名称与密码。

如果启动一个新的容器可以使用如下的命令：

```shell
docker run -it -d -P givemesometime:test-2 user db 12345qwert 8888 gmst  admin admin
```

# 数据库

Give Me Some Time 使用 MySQL 的数据库。使用 `init.sql` 初始化这个数据库。

【NOTE】 **Give Me Some Time 在没有正确配置数据库的情况下，依然可以正常启动，但它并不是惰性计算。**

# Docker Compose

将一个 givemesometime 与 mysql 组合并提供服务，最好的方式是使用 Stack，
将其组合。

```yaml
# The example for docker compose

# for Give Me Some Time
gmst-core:
  ## load the image
  image: givemesometime:latest
  ## port to expose
  ports:
    - "8080:8080"
  ## to restart
  restart: always
  ## link to
  links:
    - gmst-db
  ## settings
  environment:
    ### root password
    - "MYSQL_ROOT_PASSWORD=root"
    ### setting database
    - "MYSQL_DATABASE=gmst"
    ### user name
    - "MYSQL_USER=user"
    ### user's password
    - "MYSQL_PASSWORD=password"
  ## the command to start
  command: $MYSQL_USER gmst-db $MYSQL_PASSWORD 3306 gmst admin admin
gmst-db:
  ## load the image
  image: mysql:latest
  ## to volumes where saved the datas
  volumes:
    - "/your/own/data:/var/lib/mysql"
  ## the port to expose
  ports:
    - "3306:3306"
  ## to restart
  restart: always
  ## settings
  environment:
    ### root password
    - "MYSQL_ROOT_PASSWORD=root"
    ### setting database
    - "MYSQL_DATABASE=gmst"
    ### user name
    - "MYSQL_USER=user"
    ### user's password
    - "MYSQL_PASSWORD=password"

```

【NOTE】 **需要注意的是，在创建之后请及时初始化数据库。**