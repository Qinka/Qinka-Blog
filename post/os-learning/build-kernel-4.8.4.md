# Linux 4.8.4 内核编译并安装到 Ubuntu 16.04 上

这个编译 Linux 4.8.4 内核，不见意见容易的事。首先用的是 Ubuntu 16.04。

## 准备

在编译内核之前，先要安装一些工具。我们在编译的时候需要这些工具。

```
sudo apt install git fakeroot build-essential ncurses-dev libssl-dev bc kernel-package
```

需要安装  fakeroot(1)（这是一个模拟权限用的，打包 deb 是用到的），其他的都是编译内核所必不可少的

然后是取下载 linux-4.8.4 内核的源代码。去[官网](www.kernel.org)下载即可。

然后解压 源文件。

## 编译内核

首先先打扫一下屋子，毛主席说的好，打扫好屋子在请客。

```
cd linux-4.8.4
cp /boot/config-$(uname -r) .config
make menuconfig
make-kpkg clean
```

进入 linux 内核源码的目录后，现将系统中的配置文件复制出来，然后通过 menuconfig 配置一下。
在执行一下清理工作就可以编译了

使用 fakeroot(1) 编译，走后会得到 一个deb 的安装包，执行编译

```
fakeroot make-kpkg --initrd  kernel_image kernel_headers
```

编译通常会花费很长的时间，耐心等待一下。

## 安装

安装的话，在目录 `~`下会多出两个 debian包，用 dpkg(1) 安装他们

```
sudo dpkg -i linux-headers-4.8.1-SOME.NAME_amd64.deb
sudo dpkg -i linux-image-4.8.4-SOME.NAME_amd64.deb
```

其中 `SOME.NAME` 是指定的一个“子名称”。安装完之后，就可以重启了。

## 完！

完事，开次开机后使用如下命令（之一）查看内核版本是否正确

```
uname -a
uname -r
uname -mrs
```

通过如下命令查看是否由模块炸了

```
dmesg | egrep -i --color 'error|critical|failed'
```

## ALSO SEE 与 参考

1. 参考： [How to Compile and Install Linux Kernel v4.5 Source On a Debian / Ubuntu Linux](http://www.cyberciti.biz/faq/debian-ubuntu-building-installing-a-custom-linux-kernel/)
2. [Linux 内核官方网站](www.kernel.org)
3. [MAN PAGE] make-kpkg(1), fakeroot(1)
