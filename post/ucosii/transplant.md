# Transplant uC/OS II to STM32F103ZET6 with GNU Toolchains

It is easy to use uC/OS II STM32F103ZET6, since there is official transplantation.
However, the official one is not aimed to GNU toolchains.
So I will share you some things important when transplanting.

## Get Source Codes

You can easily Google or just using Bing to search on the Internet to visit uC/OS official [web site](https://www.micrium.com).
In the [download center](https://www.micrium.com/downloadcenter/), you can download the newest codes of uC/OS at the left side.
Moreover, you can get the transplanted one from right side.

For STMicroelectronics' STM32F103ZE, you can download the one directly.
If the one you downloaded is not newest, you can download a newer codes and use ported codes in old version.

## Setting up

> This section is suit to those who have used the GNU toolchains to build files.

With official transplantation, it is setting up the uC/OS II.
You need to replace `PendSV_Handler` and `SysTick_Handler` with `OS_CPU_PendSVHandler` and `OS_CPU_SysTickHandler`, which are handlers of PendSV and SysTick in uC/OS, in the interrupt vector.

You could "register" those two handlers in `startup.s`, which is used to start up written in ASM. If your project "register" in a C file, you might need to read *The Definitive Guide to the ARM Cortex-M3*.

## main.c

Another important thing is initializing the system's clock before initializing uC/OS.
In the `os_cpu_c.c`, there is function, named `OS_CPU_SysTickInit`, can initialize the system clock.

The right order for initializing system is

  1. Hardware initialization
  1. System tick initialization: call `OS_CPU_SysTickInit()`
  1. uC/OS initialization: call `OSInit()`
  1. Create tasks
  1. Start uC/OS II: call `OSStart()`