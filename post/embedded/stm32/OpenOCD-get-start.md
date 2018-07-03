# 使用 OpenOCD 调试 STM32F1 系列手册

## 安装

OpenOCD 对于 Windows 可以从 [GNU 工具链的 OpenOCD 页面下载](http://gnutoolchains.com/arm-eabi/openocd/).
对于其他系统可以从 各系统的软件源中获取。Ubuntu、CentOS、macOS、Windows 的 MSYS2 源都有相关软件。

对于 Windows 从上述地址下载的文件来讲，将其解压只任意位置，并将解压配置到 PATH 路径即可。

## 启动与测试

这一部分以正点原子的战舰v3开发板和 ST-Linkv2 调试器为例，讲述烧写内容与内存操作相关的内容。

### 启动

启动需要两个参数 `-f "interface/stlink-v2.cfg"`
和 `-f "target/stm32f1x_stlink.cfg"`
分别指定使用的调试器与芯片种类。

完成的命令大致如下:
```
openocd -f "interface/stlink-v2.cfg" -f "target/stm32f1x_stlink.cfg"
```

启动后并不能直接在当前的终端中使用 OpenOCD 需要在 另一个终端或者 PUTTY 这样的软件中 使用 telnet 方式连接 OpenOCD。 默认的 OpenOCD 的端口是 `4444`。

在 终端中可以执行 `telnet localhost 4444`， 在 PUTTY 中则可以按图所示连接。

![PUTTY 连接 Telnet](/img/embedded/stm32/openocd-putty-telnet.png)

然后就进行命令行可以控制了。

### 烧写至 Flash 中

烧写之前需要将 MCU 挂起:
```
halt
```
然后是写入 Flash 中:
```
flash write_image erase image_file
```

image_file 可以是使用 相对路径，或者是使用相对启动 OpenOCD 的目录的相对路径。


