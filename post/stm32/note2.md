Not2 -- Timer & Interrupt
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

### Enable the timer's clock

This step is easy, because the only one thing need to do is setting up the timer's clock's register.
The registers `APBxENR` control the peripheral's clock. The details can be found at the *[Reference Manual](http://www.st.com/resource/en/reference_manual/cd00171190.pdf)*.

For example 
