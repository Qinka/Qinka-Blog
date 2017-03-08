# Preface

In this blog, the board you need is Digilient's Nexys-3. And we will talk about the installing of software, which we will use, later.

## Nexys 3

Nexys 3 is ready-to-use FPGA board based on Xilinx's Spartan-6 LX16 FPGA.

![Nexys 3 (1) ((C) Digilient)](/img/fgpa/nexys-3-1.jpg)

According to the manual, the features of this borad include:
* Xilinx Spartan-6 LX16 FPGA in a 324-pin BGA package
* 16Mbyte Cellular RAM (x16)
* 16Mbytes SPI (quad mode) PCM non-volatile memory
* 16Mbytes parallel PCM non-volatile memory
* 10/100 Ethernet PHY
* On-board USB2 port for programming & data xfer
* USB-UART and USB-HID port (for mouse/keyboard)
* 8-bit VGA port
* 100MHz CMOS oscillator
* 72 I/Os routed to expansion connectors
* GPIO includes 8 LEDs, 5 buttons,8 slide switches and 4-digit seven-segment display
* USB2 programming cable included

This is the peripheral device of the Nexys 3:  
  ![Nexys 3 (2) ((C) Digilient)](/img/fgpa/nexys-3-2.png)  
  ![Nexys 3 (3) ((C) Digilient)](/img/fpga/nexys-3-3.png)

## ISE Design Suite

ISE(R) Design Suite is a set of software for design, powered by Xilinx.
ISE supports Spartan(R)-6, Virtex(R)-6, and CoolRunner(TM) devices, 
as well as their preivous generation families.

ISE Design Suite has three editions:
  * ISE Design Suite: Emmbedded Edition
  * ISE Design Suite: System Ediition
  * ISE Design Suite: WebPACK Edition (FREE)

The more details can be found on the Xiline's official web site.

# Install ISE Design Suite

## Sign up

Before you download the ISE Design Suite, you need sign up a account of Xilinx,
and fill in your informations. Because you need fill in the **U.S. Government Export Approval**, when you download the ISE software or getting the license for ISE.

***NOTE**: Read the direction above the page carefully*

**Where to sign up**
* [Here](https://china.xilinx.com/registration/create-account.html) is for Chinese.
* [Here](https://www.xilinx.com/registration/create-account.html) is for English.
* [Here](https://japan.xilinx.com/registration/create-account.html) is for Japanese.

## Download

***NOTE**: As of October 2013, ISE has moved into the sustaining phase of its product life cycle, and there are no more planned ISE releases.*

Visit the download page of the ISE, and choose *Full Installer for Windows* or *Full Installer for Linux*.
And download it.

***NOTE**: You might need fill up **U.S. Government Export Approval***

* [Chinese] [Download Page](http://china.xilinx.com/support/download/index.html/content/xilinx/zh/downloadNav/design-tools.html)

* [English] [Download Page](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/design-tools.html)

## Install

To install this design suite, there need more than 20GByte spaces in your computer.
And just follow the install guide is well.

## License

If you want to use these software, you need the license. To get the license,
the first step is openning the *Xilinx License Configuration Mananger*.
Select the *Acuqire a License*, and choose *Start Now!*, *Start 30 Day Evaluatoin*, or *Get Free vivado/ISE WebPack License*. Then click **Next**.

The second step is click the **Connect Now** button. The **U.S. Government Export Approva** will be opened again, and fill it. After click the **Next**, you can download the license.

***NOTE**: When you access these pages in China, the network might not well*

# Getting Started -- 4-bit Adder

## Digital Circuit Pre-knowledge -- "Half Adder"

The half adder adds two single binary digits A and B. It has two outputs sum and carry. The former is usually marked as S, and the latter is C.

The expression of the hald adder is:

```
S = A xor B
C = A and B
```

And it's digital circuit is:

  ![Half Adder Digital Circuit](/img/fpga/half-adder-dc.jpg)

## Digital Circuit Pre-knowledge -- "Full Adder"

The full adder adds three single binary digits A, B, and Cin. 
A and B is the normal input, and the Cin is a bit carried in from the previous less-significant stage. It has two outputs sum(S) and carry(Cout).

The expression of the full adder is:

```
S    = A xor B xor Cin
Cout = (A and B) or (C and (A xor B))
```

And it's digital circuit is:

  ![Full Adder Digital Circuit](/img/fpga/full-adder-dc.jpg)


## New Project

The first step to build yourself a 4-bit adder is creating a new project on the ISE.

For Xilinx ISE Design Suite 14.7, you should need fire up the software.
It's at most lying in the **Xilinx ISE Design Suite -> ISE Design Tools** in your start menu. If you used Windows 10, it might lying in **Xilinx ISE Design Suite**.
Choose **Project Navigator**

Then press the **New Project** tab or select **File -> New Project** to create a new project.

## Configuration -- New Project Wizard

After you open the **New Project Wizard**, you need to change the **Name** and the **Location** to whatever you like.

Then click the **Next** and select *Nexys 3 Board* in the field **Evaluation Development Borad**. If your ISE do not have the option **Nexys 3 Board**, you can use **General Purpose**. The extra things to do are setting **Family** to **Spartan6**, setting **Device** to **XC6SLX16**, setting **Package** to **CSG324**, and setting **Speed** to **-3**.

Make sure that the synthesis tools is **XST**, the simulator is the **ISim**, and the Preferred **Language** is **Verilog**.

Then click the **Next** and review the **Project Summary**. 
Click the **Finish** to create this project finally.

## Draw The Circuit

Choose **Project -> New Source** to add a new source file to this project.
In the **New Source Wizard**, the **Select Source Type** should be selected as **Schematic**. (Don't forget to full the **File Name**.)
Then click the **Next** and **Finish** to create this file finally.

Select the file you had create.
Choose the tab **Symbols** left on the ISE's Windows.
Then choose the **Logic** in the **Categonies**.
Drop the AND gate, OR gate, XOR gate etc to design area.

For half-adder, we need an XOR gate and an AND gate.
And line them according to the circuit.
For the full-adder, we need 
