# BeageBone Black Getting Start

这一个系类的内容，我们将折腾 BeageBone Black。 这个板子我也懒得介绍了，某宝有卖的，还说啥。

## SD卡启动

玩板子之前，我们需要让板子启动。正常的来说，刷入对应的 Linux 系统就好了，然后远程链接。但是我们则能不作死呢？
所以首先，找一个 microSD 卡，刷入一份 Linux(debian-8.4)。 我猜到了有些人，想知道如何刷入得，对吧。
现在开启，面对新手模式。

首先你要有一份镜像，~~(什么，你连镜像都没？再见)~~，我们假设这个镜像名叫 `bone-debian-8.4-lxqt-4gb-armhf-2016-05-13-4gb.img`
然后将你的 sd 卡插入计算机中。如果你使用的是 unix-like 的操作系统，则使用如下命令找见你的 sd 的设备名称。
~~(别说没有这个命令，我路由器都有)~~

```shell
fdisk -l
```

找到那个名称，我们假设是 `/dev/sde`。然后我们命令 `dd`(1) 将之写入。会有一个漫长的等待。

```shell
dd if=bone-debian-8.4-lxqt-4gb-armhf-2016-05-13-4gb.img of=/dev/sde
```

~~(听说有人不知道这个命令是什么意思？我要炒粉)~~
`if` 的含义是 “input from”，同理 `of` 的含义是“output for”。

然后当 `dd` 写完之后，我们使用 `fdisk -l` 再次看一下这个sd的状态。
```
...
Disk /dev/sde: 7.4 GiB, 7892631552 bytes, 15415296 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x6c6218b4

Device     Boot Start     End Sectors  Size Id Type
/dev/sde1  *     2048 6963199 6961152  3.3G 83 Linux

```
这里，就是说，8G的sd卡，只是用 3.3G左右。 但是可以发挥作死精神，扩容啥的。

然后我们就可以将 sd卡插入到板子上，然后上电。
这里我同时使用了 以太网网线链接

## 上网

简单的来说，把网线连到路由器，交换机啥的，板子就可以获得到 ip 了。
但是，对于某些系统来说，比如我之前用的 debian-8.4 这个版本就可以使用支持型号的无线网卡。
使用 `lsusb` 命令查看一些 Usb 设备，其中如果网卡支持的话，就能找见那个设备。

然后使用 wpa 一类的工具，配置网络，然后就完事。