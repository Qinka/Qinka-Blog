# Preface

In this blog, the board you need is Digilient's Nexys-3. And we will talk about the installing of software, which we will use, later.

## Nexys 3

Nexys 3 is ready-to-use FPGA board based on Xilinx's Spartan-6 LX16 FPGA.

  ![Nexys 3 (1) ((C) Digilient)](/img/fpga/nexys-3-1.jpg)

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

  ![Nexys 3 (2) ((C) Digilient)](/img/fpga/nexys-3-2.jpg)

  ![Nexys 3 (3) ((C) Digilient)](/img/fpga/nexys-3-3.jpg)

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

* Chinese: [Download Page](http://china.xilinx.com/support/download/index.html/content/xilinx/zh/downloadNav/design-tools.html)

* English: [Download Page](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/design-tools.html)

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

Make sure that the synthesis tools is **XST**, the simulator is the **ISim**, and the Preferred **Language** is **Verilog**
(if you want to use VHDL, should it).

Then click the **Next** and review the **Project Summary**. 
Click the **Finish** to create this project finally.

## Draw The Circuit

Choose **Project -> New Source** to add a new source file to this project.
In the **New Source Wizard**, the **Select Source Type** should be selected as **Schematic**. (Don't forget to full the **File Name**.)
Then click the **Next** and **Finish** to create this file finally.

Select the file you had create.
Choose the tab **Symbols** left on the ISE's Windows.
Then choose the **Logic** in the **Categonies**.
Drag and drop the AND gate, OR gate, XOR gate etc to design area.

For half-adder, we need an XOR gate and an AND gate.
And line them up according to the circuit.
For the full-adder, we need two AND gates, two XOR gates, and an OR gate. Then line them up according to the circuit.

When we have one full-adder, we need to copy and paste it. For a 4-bit adder, we need one half-add, and three full-add.

The each adder's carry output should be lined with the next level's carry input.

The final circuit has 8 input pins, named A1 ~ A4 and B1 ~ B4.
it has 5 output pins, named S1 ~ S4, and S.

The final circuit is:

  ![Adder](/img/fpga/adder-dc.jpg)

## Setting The Pins

In the **Design** tab, at the left of windows, double click the **User Constrants -> I/O Pin Planning (PlanAhead) - Pre-Synthesis**
 to configurate I/O pins.

The *PlanAhead* will start. At the bottom panel -- **I/O Ports**,
you need to configrate the in and out pin for our adder.
According to the *Reference Manual* of the **Nexys 3(TM) FPGA Board**,
there are 8 slide switches and 8 LEDs on the borad. The following is about the relation between the peripherals and sites of FPGA.
The port of fpga:

  ![I/O Ports](/img/fpga/io-ports.jpg)

Peripheral | Site
---|---
SW0 | T10
SW1 | T9
SW2 | V9
SW3 | M8
SW4 | N8
SW5 | U8
SW6 | V8
SW7 | T5
LD0 | U16
LD1 | V16
LD2 | U15
LD3 | V15
LD4 | M11
LD5 | N11
LD6 | R11
LD7 | T11
 
We need to set up these relations at the bottom of the PlanAhead. We need to set **I/O Std** up, too.
The following table is for the settings:

Pin/Port Name | Direction | Site | I/O Std
---|---|---|---
A1 | IN | T10 | LVCMOS33
A2 | IN | T9 | LVCMOS33
A3 | IN | V9 | LVCMOS33
A4 | IN | M8 | LVCMOS33
B1 | IN | N8 | LVCMOS33
B2 | IN | U8 | LVCMOS33
B3 | IN | V8 | LVCMOS33
B4 | IN | T5 | LVCMOS33
C | OUT | V15 | LVCMOS33
S1 | OUT | T11 | LVCMOS33
S2 | OUT | R11 | LVCMOS33
S3 | OUT | N11 | LVCMOS33
S4 | OUT | M11 | LVCMOS33

Or you can just using the following codes:

```ucf
NET "A1" LOC = T10;
NET "A2" LOC = T9;
NET "A3" LOC = V9;
NET "A4" LOC = M8;
NET "B1" LOC = N8;
NET "B2" LOC = U8;
NET "B3" LOC = V8;
NET "B4" LOC = T5;

NET "A1" IOSTANDARD = LVCMOS33;
NET "A2" IOSTANDARD = LVCMOS33;
NET "A4" IOSTANDARD = LVCMOS33;
NET "A3" IOSTANDARD = LVCMOS33;
NET "B1" IOSTANDARD = LVCMOS33;
NET "B2" IOSTANDARD = LVCMOS33;
NET "B4" IOSTANDARD = LVCMOS33;
NET "C1" IOSTANDARD = LVCMOS33;
NET "C2" IOSTANDARD = LVCMOS33;
NET "B3" IOSTANDARD = LVCMOS33;
NET "C3" IOSTANDARD = LVCMOS33;
NET "C4" IOSTANDARD = LVCMOS33;

NET "C"  LOC = V15;
NET "S1" LOC = T11;
NET "S2" LOC = R11;
NET "S3" LOC = N11;
NET "S4" LOC = M11;
```


## Creating, Checking, etc

The things need to do are about checking, creating, and so on.

### Check Half-Adder, Full-Adder, And 4-bit Adder

Select the circuit file(.sch) of hald adder, in the **Design** panel.
Double click the **Create Schematic Symbol** and **Check Design Rules**, in the **Design Utilities**, in order.

And do the same things to full-adder, and 4-bit adder.

### Synthesize and Implement

Double click the **Synthesize - XST** in the **Design** panel.
Then double click the **Implement Design**.

## Generate And Program

Double click the **Generate Programming File**, and double click the **Configure Target Device**, in the **Design** panel.

Then **ISE iMPACT** will be fired up.
Double click the **Boundary Scan** in the left panel.
And add device via pass **Ctrl + I**, or right click and click **Initialize Chain**.

The add the configuration file to device, via the "guide" of right click on the device and click **Assign New Configuration File**. Then choose your configuration file.

The right click device and choose **Program**.

## Play And Having Fun

After the configuration file programmed to device, our 4-bit will be right. The left 4 switch is a big-end input binary number, so right ones is. And the left 5 LEDs is the small-end output binary number.

Having fun!

  ![Example](/img/fpga/show.jpg)