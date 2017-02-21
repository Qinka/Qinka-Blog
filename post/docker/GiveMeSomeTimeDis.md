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