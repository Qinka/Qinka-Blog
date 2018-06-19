Note 2 -- Timer & Interrupt
===

## Outline

I will talk about the timer in STM32F10x, and the interrupt.
The following example and post will show you the basic way to use the timer, and initialize the NVIC.

## Configure Timer 

The basic way of configuring  timer includes the following steps:

1. Enable the timer's clock

1. Setting up the timer's `ARR` register and `PSC` register (for auto-reloading and pre-scale coefficient).

1. Enable the interrupt for updating for timer (this means the counter overflow)

1. Enable the timer

1. Configure the NVIC for timer

For some of details you need look up the official *[Reference Manual](http://www.st.com/resource/en/reference_manual/cd00171190.pdf)*.

### Enable the timer's clock

This step is easy, because the only one thing need to do is setting up the timer's clock's register.
The registers `APBxENR` control the peripheral's clock.

The following codes is an example for enabling `TIM3`'s clock.

```c
RCC -> APB1ENR |= 0b1 << 1;
```

### Setting `ARR` and `PSC` registers

The next step is setting up the `ARR` and `PSC` registers.
The `ARR`, or say `TIMx_ARR` is TIMx's auot-reload register.
Its value will be loaded into the real auto-reload register when the timer time-up.
In other words, this register hold the prescaler value.

The `PSC`, or say `TIMx_PSC` is the prescaler value for timer's clock.
The counter clock frequency `CK_CNT` will be equal to `f_CK_PSC / (PSC + 1)`.

For example , if the value of `TIM3_PSC` is 7199, and the value of `TIM2_ARR` is 4999,
the counter will tick every 100us(`(PSC + 1) / 72MHz`), and every 500ms(`(4999 + 1) * 100us`), the timer will overflow.

```c
TIM3 -> ARR = 4999;
TIM3 -> PSC = 7199;
```

### Enable the interrupt

The `DIER`, or say `TIMx_DIER` is the "DMA/Interrupt enable register" for TIMx.
The bit 0(`UIE`) controls the updating for timer.
When that bit set to 1, the "update interrupt" is enabled. There will be an interrupt raised, when timer(counter) overflow.

For example, the following codes will enable TIM4's "update interrupt".

```c
TIM4 -> DIER |= 0b1 << 0;
```

### Enable timer

Then we need to enable the timer.
For example , the following codes will enable the TIM4.

```c
TIM4 -> CR1 |= 0b1 << 0;
```


### Configure NVIC for timer 

The NVIC is short of "nested vectored interrupt controller". The more information can be found in *[Reference Manual](http://www.st.com/resource/en/reference_manual/cd00171190.pdf)*.

The easiest way to configure interrupt is using the STM32's official firmware library. 
The following codes is an example.

```c
NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
NVIC_InitTypeDef NVIC_InitStructure;
NVIC_InitStructure.NVIC_IRQChannel = TIM2_IRQn;
NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 3;
NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1;
NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
NVIC_Init(&NVIC_InitStructure);
```

