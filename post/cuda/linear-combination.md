# Linear Combination with CUDA

## Outline

I got this idea from Hongyi Lee's Linear Algebra course video(2015 NTU).
In the video, Lee combined two images by using linear combination.
So this post will show you the codes using CUDA to do the linear combination.
And more there are also some testing on different platforms with different compilers
and different CUDA SDKs.

## Linear Combination

If you ask what is linear combination, the answer will be
> Given two vectors(it can also be matrix, tensor, and however they can be transformed to vector.)
and two coefficients, we multiply each vector by each coefficient,
and add two products that is linear combination.

So the operation to do linear combination will be:

```
foreach i in range(vector):
  c[i] = coe1 * a[i] + coe2 * b[i]
```

## C Implement

The following code is my C implement of linear combination,
and it can also be found at my repo on
[GitHub](https://github.com/Qinka/random-cuda/blob/585f4c91f05a93d03e8f43bbfdf364028e98d027/learn-cuda/source/linear-combination.cc).

```c
int linearCombination(float coe1, uint8_t* m1, float coe2, uint8_t* m2, int size, uint8_t* m3) {
  for (int i = 0; i < size; i++) {
    float tmp = coe1 * m1[i] + coe2 * m2[i];
    m3[i] = (uint8_t)(fmaxf(fminf(tmp,255),0));
  }
  return 0;
}
```

It's so easy that I think everyone can understand it unless you
can not understand C language.

## CUDA Implement

The code can be found on [GitHub](https://github.com/Qinka/random-cuda/blob/585f4c91f05a93d03e8f43bbfdf364028e98d027/learn-cuda/source/linear-combination.cu)
too.
And the following sub-section is the details.

Firstly, we need to implement a kernel of
linear combination.

```CUDA
__global__
void linearCombinationKernel(float coe1, uint8_t* m1, float coe2, uint8_t* m2, int size, uint8_t* m3) {
  int idxX = blockIdx.x * blockDim.x + threadIdx.x;
  int stdX = blockDim.x * gridDim.x;
  for(int i = idxX; i < size; i += stdX) {
    float tmp = coe1 * m1[i] + coe2 * m2[i];
    m3[i] = (uint8_t)(fmaxf(fminf(tmp,255),0));
  }
}
```

This kernel just do what C version do, but there are still some differences.

Firstly, for the for-statement, the beginning and stride of index are different.
In C version of linear combination, the beginning of index is 0, and stride is 1. In CUDA version, there are many core to do the computing, so that for each core, the beginning of index is specific, and stride is computed by number of cores.

Secondly, the C version of codes run on your CPU, but CUDA version of codes will run on your CUDA-supported GPU.
The former one without any optimize will just run on one core of CPU,
but the latter one will try to use as much as the core it can
get on your GPU. This means that there will be more than one element in vector to be computed at once.
Furthermore, the functions such as `fmin` and `fmax` in C version is different
from the ones in CUDA version.

Thirdly, there are also something different on declaration of function.
The CUDA version's function is named `linearCombinationKernel`,
and that means there will also be a wrap function.
The `__global__` declaration will tell the compiler of CUDA that this function will be run on device GPU and can be called from host CPU.

So there is also a wrap of CUDA version to call the program.

```C
int linearCombination(float coe1, uint8_t* m1, float coe2, uint8_t* m2, int _size, uint8_t* m3) {
  uint8_t* dm1 = 0;
  uint8_t* dm2 = 0;
  uint8_t* dm3 = 0;
  cudaError_t rtCode;
  int blocksize;
  int threadsPerBlock;
  size_t size = _size * sizeof(uint8_t);
  int bsX = 0;

  // select codes
  /*rtCode = cudaSetDevice(0);
  if (rtCode != cudaSuccess) {
    fprintf(stderr, "cudaSetDevice failed!  Do you have a CUDA-capable GPU installed?");
    goto Error;
    }*/

  // get prop
  cudaDeviceProp prop;
  rtCode = cudaGetDeviceProperties(&prop,0);
  if (rtCode != cudaSuccess) {
    fprintf(stderr, "Fail to get the device infos");
    goto Error;
  }

  // malloc
  rtCode = cudaMalloc((void**)&dm1, size);
  if (rtCode != cudaSuccess) {
    fprintf(stderr, "cudaMalloc failed!(m1)");
    goto Error;
  }
  rtCode = cudaMalloc((void**)&dm2,size);
  if (rtCode != cudaSuccess) {
    fprintf(stderr, "cudaMalloc failed!(m2)");
    goto Error;
  }
  rtCode = cudaMalloc((void**)&dm3, size);
  if (rtCode != cudaSuccess) {
    fprintf(stderr, "cudaMalloc failed!(m3)");
    goto Error;
  }

  // copy
  rtCode = cudaMemcpy(dm1, m1, size, cudaMemcpyHostToDevice);
  if (rtCode != cudaSuccess) {
    fprintf(stderr, "cudaMemcpy failed!(m1)");
    goto Error;
  }
  rtCode = cudaMemcpy(dm2, m2, size, cudaMemcpyHostToDevice);
  if (rtCode != cudaSuccess) {
    fprintf(stderr, "cudaMemcpy failed!(m2)");
    goto Error;
  }

  // run

  bsX = (int)(_size + prop.maxThreadsPerBlock - 1) / prop.maxThreadsPerBlock;
  blocksize = min(prop.maxGridSize[0],bsX);
  threadsPerBlock = min(prop.maxThreadsPerBlock,_size);
  fprintf(stderr,"size: %d, %d\n",blocksize,threadsPerBlock);
  linearCombinKernel<<<dim3(blocksize),dim3(threadsPerBlock)>>>(coe1,dm1,coe2,dm2,_size,dm3);

  // check error
  rtCode = cudaGetLastError();
  if (rtCode != cudaSuccess) {
    fprintf(stderr, "addKernel launch failed: %s\n", cudaGetErrorString(rtCode));
    goto Error;
  }

  // synchronize
  rtCode = cudaDeviceSynchronize();
  if (rtCode != cudaSuccess) {
    fprintf(stderr, "cudaDeviceSynchronize returned error code %d after launching addKernel!\n", rtCode);
    goto Error;
  }

  // copy
  rtCode = cudaMemcpy(m3, dm3, size, cudaMemcpyDeviceToHost);
  if (rtCode != cudaSuccess) {
    fprintf(stderr, "cudaMemcpy failed!(m3),%d",rtCode);
    goto Error;
  }

Error:
    cudaFree(dm1);
    cudaFree(dm2);
    cudaFree(dm3);
    return rtCode;
}
```

There are four things will be done when to running the codes.
The first thing is to get the device's information, and we will set up
some parameters according to that.
The second thing is to allocate memory in the device.
The third one is to call the function.
And the last thing todo to release memory.

### 