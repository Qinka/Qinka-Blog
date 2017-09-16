Learning Notes for GPIO and Interrupt from GPIO
===

So in this post I will talk about the GPIO and the interrupt from GPIO for STM32F103ZET6(also STM32).

My board is STM32F103ZET6, and some peripherals. I write these codes on macOS with home-compiled cross-compiler(arm-gcc) and CMake.
You can find the codes from my GitHub [repo](https://github.com/Qinka/stm32f103zet6demo).
This post refers to STM32F1's *[Reference Manual](http://www.st.com/resource/en/reference_manual/cd00171190.pdf)*.

## GPIO Intro

This note will focus on operating GPIO with reigsters.
You can quickly jump to the *Reference Manual*'s section 9, and have a look to know some details about it.

Subject to the datasheet, where show the characteristics of hardwares, each General Purpose IO Ports, GPIO for short,
can be individually configured into the following modes:

* Input floating

* Input pull-up

* Input pull-down

* Analog

* Output open-drain

* Alternate function push-pull

* Alternate function open-drain

For GPIO, there are 3 important registers:

* Configuration registers (GPIOx_CR[L|H]) `GPIOx -> CR[L|H]`

* Ports input data register (GPIOx_IDR) `GPIOx -> IDR`

* Ports output data register (GPIOx_ODR) `GPIOx -> ODR`

### Light on LED

#### Enable Clock

The first step to light on led is enabling the port's clock.

Suppose we will use GPIOx's pin i.
We need look up the figure on Page 112(section 7.3.7), *reference manual*, and find the bit which control the port's clock.
Then set it to 1. For example:

```c
RCC -> APB2ENR |= 0b1 << 3; // for GPIOB
```

#### Configure I/O Modes

The next thing to do is configuring the I/O mode.

Firstly, we need to decide which mode do we need, and look up the Table 20, at the page 160(section 9.1), *Reference Manual*.
For each set of GPIO ports, such as GPIOA, and GPIOB, the register `GPIOx_CRL` controls the port 0 ~ 7
, while the register `GPIOx_CRH` controls the port 8 ~ 15.
For each port, there are two bits for CNF and two for MODE.
We need to set upo these bit to control the port.
For example:

``` c
GPIOB -> CRL &= ~(0xF << 0);
GPIOB -> CRL |= 0b0011 << 0;
```

The first line clean the GPIOB's port 0's config.
Then the second line configure that post's I/O mode and
Speed.The details of the means of bits can be find in Table 20, at the page 160(section 9.1), *Reference Manual*.


If the port should be "input pull-up" mode, the MODE(speed) should be set as `00`, and CNF should be `10`.
Then you need to set up PxODR register for pull-down.

```c
GPIOC -> ODR |= 0b1 << 13
```

The example set an output port(GPIOC 13) to "pull-up" by setting the bit for port 13 in GPIOC_ODR register.

#### Read / Write

For a input GPIO port, you can only read from the register, while you can read and write from a output port's register.

Because the input ports' ODR register are used as the bits to control whether it is "pull-down" or "pull-up", I mainly talk about IDR for input ports, and the ODR for output ports.

For writting, you can just set one or some of bits to `0` or `1`.

```c
GPIOA -> ODR |= 0b11 << 2;
GPIOB -> ODR &= ~ (0b1 << 3);
```

The first line set the GPIOA 2 and GPIOA 3 to `1`,
while the second line set the GPIOB 3 to `0`.

For reading, you can jus read the register direct, or just mast them.

```c
GPIOA -> ODR & (0xb << 4)
GPIOB -> ODR
```

When the first line used in the if-else statements,
that judge whether a port is `1` or `0`.
The second line can get all the ports' "state".

For input ports' reading, it is same with output ports.


## Interrupt for Input Ports

## Full Example