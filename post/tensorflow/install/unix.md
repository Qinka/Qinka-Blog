Install Haskell's TensorFlow Binding on *nix(macOS/Linux)
===


# Install CUDA SDK (for Linux)

If you want to use TensorFlow with GPU, you need to install Nvidia's CUDA SDK.
And you also need to have a GPU supporting CUDA, whose CUDA compute capability is not lower than 3.0.

The following is the list of what you might need to install when using GPU:

* CUDA(R) Toolkit 8.0 ([for details](http://docs.nvidia.com/cuda/cuda-installation-guide-linux/#axzz4VZnqTJ2A))
* NVIDIA drivers (associated with CUDA Toolkit 8.0)
* cuDNN v5.1 or higher ([for details](https://developer.nvidia.com/cudnn))
* (optional) libcupti-dev


# Install Dependences

For both of macOS and Linux, there are some dependences needed, and the following list are what are they:

* protobuf-compile
  
  If you don't know how to install this library, my suggest is using the package manager tool on your computer to search this
  package. The known package name on each system(package manager)
  
  * (for macOS's homebrew) `protobuf`
  * (for Ubuntu's apt) `protobuf-compiler`
  * (for Windows' msys2(64bit) `mingw-w64-x86_64-protobuf`

* snappy (for macOS)
  
  (Sorry for that I do not know why this package is needed.) Install by `brew install snappy`
  
# Install `libtensorflow`

