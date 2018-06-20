# 前言 [Preface]

Ddopsnd 是一个用于将 IP 更新于 DNS 的工具组。该工具组由一个处理文本的后端与获取并更新 IP 的前端组成。

Ddopsnd is a tool set to update IP to DNS. The set include a parsing backend and a getting & updating frontend.

前端的任务有三个，分别是获取数据，将数据交由后端处理，与最后的更新。
而后端则负责将前端传入需要解析的文本信息处理并得到结构返回。

The task frontend going to do are that get the data, that post the data to backend to transform, and that update the final informations to the DNS.

由于前端处于的环境可能会是类似于路由器这样的环境，为了减少移植问题与简化问题，则将处理信息的解析任务分割为后端并独立。

Because the environment where frontend might be embedded, the backend is independent to simplify and reduce the problems in the transplant.

## 所需的 [What You Need]

使用 Ddopsnd 所需的是一个交由 Dnsdop 解析的域名，一些空间，与一个有效的 Ddopsnd 后端。 如果你不知道如何让 Dnsdop 解析你的域名，你可以参考[这里](https://support.dnspod.cn/Kb/guide/)，在“功能介绍及使用教程／各个注册商修改域名DNS地址的方法” 中可以找到将 DNS 解析服务设置到 DNSPod。*而有效的 Ddopsnd 暂时还不知道哪里可以。。*

The things you need when going to use Ddopsnd include: a domain, which is using DNSPod's name server, some spaces in the disk, and a available Ddopsnd's backend. Look [here](https://www.dnspod.com/support/index/fid/5), to find out how to use DNSPod when your domain registered in other registrar. *And so long, there isn't any available Ddopsnd in this world.*

# 设置前端 [Configure Frontend]

前端中每一个记录都需要单独设定一个配置文件，每个配置文件中需要有如下内容：

Frontend's config is needed for echo record, and the following are included:

* 登陆代码 [login token] （*）

* 格式 [format]（**）

* 语言 [language]

* 域名 [domain]（*）

* 子域名 [sub-domain]  (\*) (***)

* 记录线路 [record line]

* Ddopsnd 后端服务地址 [Ddopsnd's backend address] （*）

对于（\*）是必填  
For (*) means necessary.

对于（\*\*）格式必须是 JSON，直接忽略不填即可。  
For (**), the format must be JSON, ignore it is a good idea.

对于（\*\*\*）每一个记录必须提前创建好，Ddopsnd 不负责创建。  
For (***), each record must be created befor Ddopsnd updating.

## 登陆代码 [Login Token]

登陆代码 DNSPod 的 API 中指出的登陆用于身份验证，由 ID,Token 组成，生成方法详见[这里](https://support.dnspod.cn/Kb/showarticle/tsid/227/)。

The login token of DNSPod's API 
