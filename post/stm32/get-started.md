STM32F103 Get Started
===

This post is about the first step to get started on developing STM32F103, as a example,
and it is based on another post -- [another post for environment](/b/stm32/env/setup).
The codes about blink the led will be an example.

So let's begin.

## Basic Part of STM32f103

The first thing to do is getting the official "STM32 Standard Peripheral Libraries" from [here](http://www.st.com/content/st_com/en/products/embedded-software/mcus-embedded-software/stm32-embedded-software/stm32-standard-peripheral-libraries/stsw-stm32054.html) *login required*.

Then we need to find out the important files, and they are listed at the following list.

* `STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/CMSIS/CM3/CoreSupport/*` Support for Cortex-M3 [3]

* `STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/CMSIS/CM3/DeviceSupport/*.c\h` Support for chip

* `STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/CMSIS/CM3/DeviceSupport/startup/gcc_ride7/*.s` Support for start up(with arm-gcc) [4]

* `STM32F10x_StdPeriph_Lib_V3.5.0/Project/STM32F10x_StdPeriph_Template/TrueSTUDIO/*/*.ld` Support for linker. \[1\]
	
* `STM32F10X_StdPeriph_Lib_V3.5.0/Libraries/STM32F10x_StdPeriph_Driver/*` Support for all kind of peripheral. \[2\]
	
> \[1\]: You should select one of these `*.ld` file according to their comment in  the file.
	
> \[2\]: I will talk about the details for these files soon in this post.
	
> \[3\]: There is a bug in the core_cm3.c, and I will talk about that bug soon in this post.
	
> \[4\]: You need to select one if these start-up file according to your chip.
	
### Mini-set of Source

You can copy the files:

* `core_cm3.c`
	
* `core_cm3.h`
	
* `stm32f10x.h`

* `system_stm32f10x.c`

* `system_stm32f10x.h`

* `startup_stm32f10x_xx.s` \[1\]

* `stm32_flash.ld` \[1\]

> \[1\]: You need to select one according your chip and their comments.
	
For `[1]` you should select one of start-up file and one of linker file.
For start-up files, the `xx` means the size of your flash and SRAM.
You can find the relationship between the size and `xx` on the Internet,
and that does work for linker file too.

Then you can write a "empty" main file and compile them.

### Bug in `core_m3.c` (for V3.5.0)

When you compiling these files, you might get errors:

```
...: Error: registers may not be the same -- `strexb r3,r2,[r3]`
...: Error: registers may not be the same -- `strexh r3,r2,[r3]`
```

You should fix them by change `... "=r" (result) ...`( in line 736, and 753) to
`... =&r (result) ...`.

### Compiling for STM32F103

In this subsection, let talk about the compiling.

First there is a simplest "main.c" source.

```c
#include "stm32f10x.h"

int main(void)
{
	return 0;
}

int _exit(void)
{
	return 0;
}

```

I add `_exit(void)` beacuse I might get an error for can not find the symbol `_exit()` from linker.

Assuming arm-gcc named `arm-unknown-eabi-gcc`, the following codes will be an example for compile.

```bash
$ arm-unknown-eabi-gcc -c -mcpu=cortex-m3 -mthumb main.c -D STM32F10X_HD
```

`-mcpu=cortex-m3` will tell the gcc the target's cpu architecture is cortex-m3.

	> The STM32F1, and somethings same with it, are cortex-m3, and for example, the STM32F4 are cortex-m4.
	
`-mthumb` will tell the program should run under the thumb mode.
The `STM32F10X_HD` are defined in the `stm32f10x.h`. The `HD` has the same means with `xx` in the name of start-up files.

Then you need to compile all `*.c` files, and then link them by

```bash
$ arm-unknown-eabi-gcc -mcpu=cortex-m3 -mthumb -o out.elf core_cm3.o main.o startup_stm32f10x_hd.o system_stm32f10x.o -T stm32_flash.ld
```

`-T xx.ld` will tell the compiler use the file `xx.ld` as the script for linker.
Then you will get a ELF-format program.

Sometimes, we need some files, whose extension is `hex` or `bin`, we need do:

```bash
$ arm-unknown-eabi-objcopy -O ihex   out.elf out.hex
$ arm-unknown-eabi-objcopy -O binary out.elf out.bin
```

## Example for STM32F103

In this section, I will show you an example about blink the led.
And this example will be based on the former example.

### Add Codes

There are two parts of codes needed.
The first part is for initializing GPIO, and the second part is for turn on/off the led.

Before we write these codes, we need to configure the STM32F1's peripherals.
For compiling, we need to define another macro named `USE_STDPERIPH_DRIVER`,
and for codes, we need to add a config file named `stm32f10x_conf.h`.
The `stm32f10x_conf.h` will include the peripherals' header files. The following is an template.

```c
/**
  ******************************************************************************
  * @file    Project/STM32F10x_StdPeriph_Template/stm32f10x_conf.h 
  * @author  MCD Application Team
  * @version V3.5.0
  * @date    08-April-2011
  * @brief   Library configuration file.
  ******************************************************************************
  * @attention
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM32F10x_CONF_H
#define __STM32F10x_CONF_H

/* Includes ------------------------------------------------------------------*/
/* Uncomment/Comment the line below to enable/disable peripheral header file inclusion */
//#include "stm32f10x_adc.h"
//#include "stm32f10x_bkp.h"
//#include "stm32f10x_can.h"
//#include "stm32f10x_cec.h"
//#include "stm32f10x_crc.h"
//#include "stm32f10x_dac.h"
//#include "stm32f10x_dbgmcu.h"
//#include "stm32f10x_dma.h"
//#include "stm32f10x_exti.h"
//#include "stm32f10x_flash.h"
//#include "stm32f10x_fsmc.h"
#include "stm32f10x_gpio.h"
//#include "stm32f10x_i2c.h"
//#include "stm32f10x_iwdg.h"
//#include "stm32f10x_pwr.h"
#include "stm32f10x_rcc.h"
//#include "stm32f10x_rtc.h"
//#include "stm32f10x_sdio.h"
//#include "stm32f10x_spi.h"
//#include "stm32f10x_tim.h"
//#include "stm32f10x_usart.h"
//#include "stm32f10x_wwdg.h"
//#include "misc.h" /* High level functions for NVIC and SysTick (add-on to CMSIS functions) */

/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
/* Uncomment the line below to expanse the "assert_param" macro in the 
   Standard Peripheral Library drivers code */
/* #define USE_FULL_ASSERT    1 */

/* Exported macro ------------------------------------------------------------*/
#ifdef  USE_FULL_ASSERT

/**
  * @brief  The assert_param macro is used for function's parameters check.
  * @param  expr: If expr is false, it calls assert_failed function which reports 
  *         the name of the source file and the source line number of the call 
  *         that failed. If expr is true, it returns no value.
  * @retval None
  */
  #define assert_param(expr) ((expr) ? (void)0 : assert_failed((uint8_t *)__FILE__, __LINE__))
/* Exported functions ------------------------------------------------------- */
  void assert_failed(uint8_t* file, uint32_t line);
#else
  #define assert_param(expr) ((void)0)
#endif /* USE_FULL_ASSERT */

#endif /* __STM32F10x_CONF_H */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/

```

	> So the `stm32f10x_gpio.c` and `stm32f10x_rcc.c` also need to be compiled.
	
Then we need to add the codes for initialization:

```c
void GPIO_Config(void)
{
  GPIO_InitTypeDef GPIO_InitStructure;
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB|RCC_APB2Periph_GPIOF, ENABLE);
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOB,&GPIO_InitStructure);
}
```

We will launch the peripherals' clock, and use the GPIOB pin.
Then we will set the pin's mode as general push-pull output,
and we will set the pin's speed to 50MHz.
Finally, initialize it.

Next step is write a loop to turn on the led and then turn it off.
Firstly, we need a delay function, by using empty loop.

```c
void Delay(__IO uint32_t nCount)
{
  for(; nCount > 0; --nCount);
}
```

Secondly, we need add the codes to main function to control the led and time.

```c
int main(void)
{
  const u32 delay = 0xFFFFF;
  while(1){
    GPIOB -> ODR = 0xFFFE;
    Delay(delay);
    GPIOB -> ODR = 0xFFFF;
    Delay(delay);
  }  
  return 0;
}
```

### Compiling

The final step is compiling and transform.

## Program to Board

Then we need to download the program to the board.

The first step is link the board and computer with J-TAG debugger, such as J-Link, and ST-Link.

The second step is launch the openocd's daemon process.

```bash
$ openocd -f interface/file -f target/file
```

The third step is using `telent` to connect the localhost's port 4444.

```bash
telnet localhost 4444
```

The fourth step is hand up the cpu.

```
> halt
```

The fifth step is write the progrma to flash.

```
> flash write_image erase /path/to/hex/file
```

The `erase` will tell the program to erase before write.

The final step is "reset".
We can put the reset button or
just:

```
> reset
```

The led will turn on, and then turn off.
