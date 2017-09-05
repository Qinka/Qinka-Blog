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
	
	* `STM32F10x_StdPeriph_Lib_V3.5.0/Project/STM32F10x_StdPeriph_Template/TrueSTUDIO/*/*.ld` Support for linker. [1]
	
	* `STM32F10X_StdPeriph_Lib_V3.5.0/Libraries/STM32F10x_StdPeriph_Driver/*` Support for all kind of peripheral. [2]
	
	> [1]: You should select one of these `*.ld` file according to their comment in  the file.
	
	> [2]: I will talk about the details for these files soon in this post.
	
	> [3]: There is a bug in the core_cm3.c, and I will talk about that bug soon in this post.
	
	> [4]: You need to select one if these start-up file according to your chip.
	
### Mini-set of Source

You can copy the files:

	* `core_cm3.c`
	
	* `core_cm3.h`
	
	* `stm32f10x.h`
	
	* `system_stm32f10x.c`
	
	* `system_stm32f10x.h`
	
	* `startup_stm32f10x_xx.s` [1]
	
	* `stm32_flash.ld` [1]
	
	> [1]: You need to select one according your chip and their comments.
	
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



	
