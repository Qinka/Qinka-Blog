# 构建交叉工具(TODO)

嵌入式系统的实验课基本快开始了，然后需要构建开发版的交叉编译工具。其实没有什么复杂的，如果是在 Linux 下构建的话。但是还是想再 macOS 上与 
Windows 上去构建工具链。然后就是说，macOS 上相对较为麻烦，但是 Windows 下 得益于 Windows Subsystem for Linux，能相对简单的构建交叉编译工具链。

## CROSSTOOLS-NG

构建编译工具链所依赖的是一个叫做 `crosstools-ng` 的东西，对于 macOS 来说， Homebrew 上有构建好的 crosstools-ng，使用 Homebrew 安装上就好。
Windows 上使用 WSL 的话，在 Ubuntu on Windows 中 使用官方的 apt 源即可下载并安装 crosstools-ng。

## 安装

安装 crosstools-ng 的方法很简单，除非有需求，否则不需要自己编译。暂不明确，原生的 Windows 上是否有现成的 crosstools-ng 但是用 WSL 就好。

对于 Ubuntu on Windows 上，安装的方法就是使用 apt(1) 安装就好了。

```bash
$ sudo apt update
$ sudo apt install crosstools-ng ncurses-dev
```

安装完之后就可以尝试运行 `ct-ng` 命令，如果成功运行则说明安装基本完成。

对于 macOS 上的安装，我们使用 Homebrew 安装就好了，同时安装 ncures 与 gettext 等相关工具。如果编译环境的网络不好，可能需要额外地下载，
所需要的源代码。使用 brew(1) 安装：

```bash
$ brew install ncurses gettext
$ brew install crosstools-ng
```

与 WSL 也一样，运行 `ct-ng` 测试是否可以使用。

然后就可以看

##

