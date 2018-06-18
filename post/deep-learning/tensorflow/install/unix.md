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


# Install Dependencies

For both of macOS and Linux, there are some dependencies needed, and the following list are what are they:

* protobuf-compile
  
  If you don't know how to install this library, my suggest is using the package manager tool on your computer to search this
  package. The known package name on each system(package manager)
  
  * (for macOS's homebrew) `protobuf`
  * (for Ubuntu's apt) `protobuf-compiler`
  * (for Windows' msys2(64bit) `mingw-w64-x86_64-protobuf`

* snappy (for macOS)
  
  (Sorry for that I do not know why this package is needed.) Install by `brew install snappy`
  
# Install `libtensorflow`

The Haskell's binding of tensorflow is using the `libtensorflow` written by C.
So before we install binding by using `stack install tensorflow`, we need to download the `libtensorflow.so` or `libtensorflow.dylib`.

By reading the official [documents](https://www.tensorflow.org/install/install_c), we can use the following commands to install:
```bash
curl -sSL \
	"https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-${TF_TYPE}-"`uname`"-${PLATFORM}-${VERSION}.tar.gz" |
	sudo tar -C /usr/local -zx
```
where the `TF_TYPE` can be `CPU` or `GPU`, `PLATFORM` can be `i386`, `x86_64`, or something else, and `VERSION` can be one of the release version.

# Install TensorFlow

Now, we can install the tensorflow by `stack install tensorflow`. *Do not tell me you forget to install Haskell's compiler and stack*

# Others

These ways of install binding can also be used on Windows, however, there one thing you need is libtensorflow.
On the official CI, the nightly build of the library or release one are provided, while if you want to use GPU,
you need to compile libtensorflow by yourself.

