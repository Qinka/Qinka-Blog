# Install STM32 Development Environment

## On Microsoft's Windows

So the first thing is installing the softwares.
On MS-Windows, there we need:

  1. MDK
  1. CH340 driver
  1. JLink driver (if you brought it)
  1. Serial port program
  1. Programmer


## On Linux & MS-Windows (Advanced)

On windows, we can use the Keil's MDK, however, when we use the Linux,
there is not any available Keil's MDK for Linux.
And sometimes, if you won want to use the MDK for it's license,
the setting up an environment is also a good idea.

The steps for setting up the environment includes:

  1. Build yourself a cross-tool-chain
  1. Setting up the debugging tools
  1. Setting up your editor or IDE

### Build Yourself A Cross-computing Tool Chain

We use the [crosstool-ng](https://crosstool-ng.github.io)
to build the compiler which we can build the program for stm32f103 on Linux or MS-Windows.
In the crosstool-ng-1.23, there is a template for arm-unknown-eabi.

  > *arm* means CPU is ARM architecture.  
  > unknown means it is not for a special platform.  
  > *eabi* means it not based on the any OS.

First, you need to get the crosstool-ng.
You can visit [official documents](https://crosstool-ng.github.io/docs/install/)
to get the introduction for installing crosstool-ng.

Second, after you installed crosstool-ng,
you need to create a new folder:

```bash
$ mkdir stm32
```

Then you need to enter the folder and config crosstool-ng with `arm-unknown-eabi` template,
and if you want to say all the template, you need
to run `ct-ng list-samples`.

```bash
$ cd stm32
$ ct-ng arm-unknown-eabi
```

(Option)then you can config the configure, when you know what you had done:

```bash
$ ct-ng menuconfig
```

Final, you can build the tool by

```bash
$ ct-ng build
```

Then you need to drink a cup of drink, and wait.

### Build Yourself A Cross-computing Tool-chain for Another Platform

If you want to build a tool-chain for MS-Windows on Linux,
the following subsection is about it.

In this subsection, I aim at the:

  > **BUILD** = x86\_64\_linux  
  > **HOST** = x86_64_w64_mingw32  
  > **TARGET** = arm

Those means you can build a compilerm, on Linux, which will compile the codes to arm-binary on MS-Windows.

The fisrt step is using the `x86_64_w64-mingw32`template to a cross-compiler, whose target is MS-Windows.

The next step is using `arm-unknown-eabi` to build the compiler.
However, there are the differences between the this subsection's and the previous subsection's.
You need to run `ct-ng menuconfig`.

In the `Toolchain options`, there is a option, named
`Toolchain type`. You need to change its type to Canadian.
Then there will be another option set, named `Host system`, and its `Tuple` need to change.
That should be the prefix of name of your cross-compiler to MS-Windows,
for example `x86_64-w64-mingw32`.

### "Install" Tool-chain

When the building completed, you can find the tool-chain
in the `~/x-tools`, if its path not changed.

For normal tool-chain, the name is the `arm-unknown-eabi`.
If your compiler's host is another platform,
such as `x86_64-w64-mingw32`,
the tool-chain will be in the folder, named `HOST-HostPlatform`,
such as `HOST-x86_64-w64-mingw32`.

When you find the tool-chain, you need to add the path of tools to `PATH` environment variable.

### Setting Up the J-TAG Debugger

When you need to use the JTAG or something like that to
debug or program your board.
You need to setting up them.

(in my country) The retainer of the board will offer the tools to customers, however they only have the one run on MS-Windows.