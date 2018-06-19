Note 3 -- PWM and Input Catching
===

## Outline

In this post, I will talk about pulse-width modulation, PWM for short, and input catching.
PWM can provide the frequency-special, duty-ratio-special signal.
In the following post, the example for PWM is using PWM to control the LED's luminance.
For input catching, we can get and measure a signal's length.
In the example for input catching, I will show the codes about receiving NEC code from IR remote control.

## Steps for using PWM

We control the signal via controlling the timer and its counter, and the example is about control LED's luminance.
The first two, or say three steps are configure the port's clock and function of IO ports/pins:

* Enable TIMx and (AF)IO port's clock via `APBxENR` registers

```c
// TIM2
RCC -> APB1ENR |= 0b1 << 1;
// GPIOB
RCC -> APB2ENR |= 0b1 << 3;
// AFIO
RCC -> APB2ENR |= 0b1 << 0;
```

* Configure the IO ports as AFIO ports(and if needed, you need to remap the  IO ports via `TIMx_REMAP` bits in AFIO_MAP register)

```c
// configure IO ports
GPIOB -> CRL &= ~(0xF << 20);
GPIOB -> CRL |= 0xF << 20; // for AF-ouput open-drain & max speed 50MHz
// remap IO ports
AFIO -> MAPR &= ~(0b11 << 10);
AFIO -> MAPR |= (0b10 << 10); // mode: 10, timer: TIM3

```

The general way of how PWM works is that in the timer, there are two registers named `ARR` and `CCRx`.
The register `ARR` controls when timer will overflow, or say reload. And for register `CCRx`, the output will be high level when the value of counter is bigger than `CCRx`.
For example, if the frequency of clock(counter) is 1MHz and `ARR` is 1000, the timer will timeout every 1ms.
If `CCRx` is 250, in first quarter period the output will be lower level, and in remaining three quarters period the output will be high.


```c
// ARR
TIM3 -> ARR = 899; // 899 + 1 = 900 => 72MHz / 900 = 80Hz
TIM3 -> pSC = 0;
TIM3 -> CCMR1 &= ~
```


