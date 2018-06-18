Snapshot for Reimagined Pancake
===

This post is a snapshot for [Reimagined Pancake](https://github.com/Qinka/reimagined-pancake).
I will talk about this repo in the following topic:
	* What it is?
	* Setting up
	* Introduce
  
The details for reimagined-pancake will be talked in the other posts.

## What It Is ?

The reimagined-pancake is named by the GitHub. When I having not ideas, the GitHub suggested this name.
This repo includes some small example for machine learning. Some more-small example for the NAO robot.

This repo includes these:
	* decision tree
	* k-nearest neighbor
	* support vector machine
	* neural network
	* linear regression
	* mnist -- convolution neural network
	* NAO robot control
	
The decision tree, k-nearest neighbor, support vecotr machine, neural network are used to classify a human face.
I use the NAO robot to get a person's age, gender, and smell, so that we can use the classification algorithms to
"judge" whether a face is positive or negative.

The linear regression is used to trace a red boll's track, and when the parameters of the trace learned,
the robot will move it's arms to "fit" the parameters.

The MNIST with CNN can recognize the hand-written numeral.

## Setting Up

I do not want to write another post to tell you how to set up these codes, so the following text will be the guide for "setting up".

For all these codes, we need the environment to run Haskell code, the environment for tensorflow,  the environment for cuda(8.0), and the environment for NAO robot.

### Setting Up Haskell Environment

The first thing to do is setting up a Haskell environment. We need a Glasgow Haskell Compiler system, and haskell-stack.
The stack can be replaced by cabal, but I still suggest that stack is the best choose.

#### Stack

The first step is install stack. The [official documents](https://docs.haskellstack.org/en/stable/README/) has the guide for install stack.
In a word, if your OS is unix-like, you can run it with
```bash
curl -sSL https://get.haskellstack.org/ | sh
```
or
```bash
wget -qO- https://get.haskellstack.org/ | sh
```
If you using MS-Windows, you can download [official Windows 64-bit installer](https://www.stackage.org/stack/windows-x86_64-installer).

#### GHC

The repo "reimagined-pancake" still use the GHC-8.0.2 with stackage's nightly-2017-07-25.
When you installed stack, you can simply run
```bash
stack setup --install-ghc 8.0.2
```
or download ghc by yourself.

#### Other

There are still other ways for you to setting up the environments.
You can visit the [official download](https://www.haskell.org/downloads) site to get the information about installing and setting up the environment.

### Cuda

This environment is optional. If you want to use the GPU to accelerate, you need to install nvidia's Cuda SDK and has a nvidia's GPU.
You can visit the [official documents](http://docs.nvidia.com/cuda/index.html#installation-guides) for cuda to get the guide about installation.
And you can also visit [CUDA Toolkit Download](https://developer.nvidia.com/cuda-downloads) to download the Cuda.
And both for tensorflow and Haskell's `accelerate` package, the Cuda-8.0 is needed.

For tensorflow, the cuDNN is needed too. You should visit [official documents](https://developer.nvidia.com/cudnn) for more details.
The available version of cuDNN is 5.1(for CUDA 8.0).

If your GPU's CUDA Compute Capability is lower then 3.0, it can not be used by tensorflow, and you should visit [official documents](https://developer.nvidia.com/cuda-gpus)
for details.

### Tensorflow

Because this repo's program are written by Haskell, so we need to install tensorflow's C library and then install Haskell's bindings.

If you want to install it from the binary, you can visit [official documents](https://www.tensorflow.org/install/install_c) for details.
You need to download the tensorflow-1.0 and install it to your computer.
If you want to install it from sources, you might need to visit [official documents](https://www.tensorflow.org/install/install_sources) and
searching engine.

### NAO Robot

(TODO) You can visit official documents for details.

## Introduce

(TODO)
