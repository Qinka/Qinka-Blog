# Install STM32 Development Environment

## On Microsoft's Windows

So the first thing is installing the softwares.
On MS-Windows, there we need:

  1. MDK
  1. CH340 driver
  1. JLink driver (if you brought it)
  1. Serial port program
  1. Programmer


## On Linux

On windows, we can use the Keil's MDK, however, when we use the Linux,
there is not any available Keil's MDK for Linux.

So the only way is setting up the environment by myself.
There are three step for write my first program run on the stm32(f103)

  1. Create a cross-compiler from x86_64-linux or x86-64-w64-ming32 to
  arm-xxx-eabi.
  1. Setting up the environment on the Emacs
  1. Write the codes, and compile with the CMAKE.