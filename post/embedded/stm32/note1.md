Note 1 -- GPIO Operations
===


## Rough Way of Operating GPIO

The rough way of operating GPIO includes the following steps:

1. Enable GPIO's clock

1. Configure GPIO port's work mode.

1. Operate registers to control or "read" GPIO port's state

The following subsection will talk about the details.
However you need *[Reference Manual](http://www.st.com/resource/en/reference_manual/cd00171190.pdf)*.


### Enable GPIO's clock

The first thing to do is enable the GPIO's clock.
You need set up the register `APBxENR` to enable the clock.
The `APB2ENR` control the GPIOs' clocks. The details can be found the in section 7.3.7/8, in *Reference Manual*.
In a word, you need set the bit which control the clock to 1 to enable the clock of GPIO.

For example, when the GPIOA's clock need to be enabled, the following codes will be one:

```c
RCC -> APB2ENR |= 0b1 << 2;
```

### Configure GPIO's work mode.

The following list show the work modes for GPIO. The work mode you can find in the table 20, section 9.1, in *Reference Manual*.

* General purpose output
  
  * Push-pull
  
  * Open-drain
  
* Alternate Function output
  
  * Push-pull
  
  * Open-drain

* Input

	* Analog
	
	* Input floating
	
	* Input pull-down
	
	* Input pull-up
	
The registers `GPIOx_CRL` and `GPIOx_CRH` control the work mode of GPIO ports.
The former controls the port 0 to port 7, and the latter controls the port 8 to port 15.
The bits `CNF0`, `CNF1`, `MODE0`, and `MODE1` in the registers control the one of ports.

The following example will set the PA1 port as the push-pull mode and set PB2 port as input mode(pull-up).

```c
// PA2
RCC -> APB2ENR |= 0b1 << 2;
GPIOA -> CRL &= ~(0xF << 4);
GPIOA -> CRL |= ~(0b0011 << 4);
// PB3
RCC -> APB2ENR |= 0b1 << 3;
GPIOB -> CRL &= ~(0xF << 8);
GPIOB -> CRL |= ~(0b1000 << 8);
GPIOB -> ODR |= 0b1 << 3;
```

> The pull-down or pull-up are controled by ODR register in input mode. If the bit is set 1, the port will be set to pull-up mode.
> When it is set 0, the port will be set to pull-down mode.


### Read & Write

When the port configured as output mode, by writing the register `GPIOx_ODR` the output of port can be controled.
In input-pull mode, the register `GPIOx_ODR` control whether port is pull-up or pull-down.

When the port configured as input mode, by reading the register `GPIOx_IDR` the input state can be gotten.

For example:

```c
// PA2
RCC -> APB2ENR |= 0b1 << 2;
GPIOA -> CRL &= ~(0xF << 4);
GPIOA -> CRL |= ~(0b0011 << 4);
GPIOA -> ODR |= 0b1 << 1;
// PB3
RCC -> APB2ENR |= 0b1 << 3;
GPIOB -> CRL &= ~(0xF << 8);
GPIOB -> CRL |= ~(0b1000 << 8);
GPIOB -> ODR |= 0b1 << 3;
if(GPIOB -> IDR | (0b1 << 3))
 // ...
```


## Example Light on LED on PB5

```c
RCC -> APB2ENR |= 0b1 << 3;
GPIOB -> CRL &= ~(0xF << 20);
GPIOB -> CRL |= ~(0b0011 << 20);
GPIOB -> ODR |= 0b1 << 5;
```

