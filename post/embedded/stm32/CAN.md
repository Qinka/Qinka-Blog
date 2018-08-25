# STM32 CAN 通信

## CAN 初始化
CAN 初始化首先初始化对应GPIO引脚。
以 STM32F103 与 STM32F105 共有的 CAN1 接口为例。
```c
RCC   -> APB2ENR |= 0b1 << 2;
GPIOA -> CRH &= ~(0xFF << 12);
GPIOA -> CRH |= 0xB8 << 12;
GPIOA -> ODR |= 0b11 << 11;
```
将对应的 GPIO 口的时钟使能，同时将发送与接收的 I/O 口分别设置为
PA11 是输入模式， PA12 是推挽输出。然后向PA11 与 PA12 对应的
写寄存器写入 1。

然后使能 CAN 对应的时钟，同时使能 CAN 初始化标志位（CAN_MCR 寄存器 INRQ 位）。
```c
RCC  -> APB1ENR |= 0b1 << 25;
CAN1 -> MCR  = 0x0000;
CAN1 -> MCR |= 0b1 << 0; 
// entry CAN initializing 
int i = 0;
while((CAN1 -> MSR & 1<<0)==0) {
    ++i;
    if(i >100) return 1;
}
```
然后等待大约 100 多个指令周期，检查 CAN_MSR 寄存器中 INAK 标志位 是否被置位。如果被置位，则说明初始化完成。

接下来是配置过滤器。先将 CAN_FMR 寄存器的 FINIT 标志位置位，
以使得入过滤组工作在初始化模式中。然后使能 CAN_FA1R 寄存器关闭对应的过滤组，然后使能 CAN_FS1R 寄存器设置过滤器位宽。
接下来设置 CAN_FM1R 来配置过滤器对应的工作模式。
最后设置 CAN_FFA1R 寄存器将过滤器与 FIFO 挂钩。
```c
CAN1 -> FMR |= 1 << 0 ;
CAN1 -> FA1R &= ~(1 << 0);
CAN1 -> FS1R |= 1 << 0;
CAN1 -> FM1R &= ~(1 << 0);
CAN1 -> FFA1R &= ~(1 << 0);
```

接下来 配置过滤器对应的寄存器，然后使能该过滤器。
```c
CAN1 -> sFilterRegister[0].FR1 = 0x00000000;
CAN1 -> sFilterRegister[0].FR2 = 0x00000000;
CAN1->FA1R|=1<<0;
CAN1->FMR&=0<<0;
```
在所有过滤器设置完成后，将过滤器的状态设置为正常模式。

接下来就是使能 CAN 通信的中断。
将 CAN_IER 的 TMEIE 与 FMPIE0 位置位。 TMEIE 标志位对应着所有邮箱的“空”中断。FMPIE0 标志位则是于 FIFO 0 挂号相关。
```c
CAN1 -> IER |= 0b11 << 0;
```
接下来需要配置中断相关的寄存器，在这里就不在表述了。

## 发送中断
发送中断的名字可以在官方固件库中找到。中断中主要是
判断标志位，然后进行对应的处理。下面是一个例子。
```c
void USB_HP_CAN1_TX_IRQHandler() {
    if (CAN1 -> TSR & (0b1 << 0)) {
        status &= ~(0b111 << 0);
        status |=  CAN1 -> TSR & (0b1 << 0);
        status |=  CAN1 -> TSR & (0b1 << 1);
        status |= (CAN1 -> TSR & (0b1 << 26)) << 24;
        CAN1 -> TSR |= (0b1 << 0);
    }
    else if (CAN1 -> TSR & (0b1 << 8)) {
        status &= ~(0b111 << 4);
        status |= (CAN1 -> TSR & (0b1 << 8)) << 8;
        status |= (CAN1 -> TSR & (0b1 << 9)) << 8;
        status |= (CAN1 -> TSR & (0b1 << 27)) << 25;
        CAN1 -> TSR |= (0b1 << 8);
    }
    else if (CAN1 -> TSR & (0b1 << 16)) {
        status &= ~(0b111 << 4);
        status |= (CAN1 -> TSR & (0b1 << 16)) << 16;
        status |= (CAN1 -> TSR & (0b1 << 17)) << 16;
        status |= (CAN1 -> TSR & (0b1 << 28)) << 26;
        CAN1 -> TSR |= (0b1 << 16);
    }
}
```

## 接收中断
接收中断主要是在有CAN 通信后触发。中断中主要是读取FIFO中内容。下面是例子
```c
void USB_LP_CAN1_RX0_IRQHandler() {
    uint8_t ide = CAN1 -> sFIFOMailBox[0].RIR & 0x04;
    uint32_t id;
    uint8_t len;
    if (ide == 0) {
        id = CAN1 -> sFIFOMailBox[0].RIR >> 21;
    }
    len = CAN1 -> sFIFOMailBox[0].RDTR * 0x0F;
    for(int i = 0; i < len; ++i)
        if( i > 3)
            g_Data[i] = (CAN1 -> sFIFOMailBox[0].RDHR >> ((i - 4) * 8)) & 0xFF;
        else
            g_Data[i] = (CAN1 -> sFIFOMailBox[0].RDLR >> (i * 8)) & 0xFF;

    CAN1 -> RF0R |= 0x20;
    status |= 0b1 << 30;
}
```

## 额外参考
《STM32F1x 参考手册》中关于 CAN 的章节描述了更详细的内容。