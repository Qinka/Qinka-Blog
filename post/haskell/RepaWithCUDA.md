# Repa Foreign Array On CUDA(GPU)

This post is using Repa to wrap GPU device array.
There are Haskell code and CUDA C/C++ code supported.

## Wrap ForeignPtr

For CUDA C/C++, we need to wrap CUDA's `cudaMalloc()` and `cudaFree()`.
The Haskell's type `ForeignPtr a` includes a pointer `Ptr a` and a `type FinalizerPtr a = FunPtr (Ptr a -> IO ())` to release memory.

So firstly, we need a function `gpuMalloc :: CSize -> IO (Ptr a)` to get the memory. Usually, we should write this function
with C/C++.

``` c++
extern "C"
void* gpuMalloc(size_t size) {
  void* ptr = NULL;
  cudaError_t stat = cudaMalloc(&ptr,size);
  if (stat != cudaSuccess)
    ptr = NULL;
  return ptr;
}
```

Then we binding it in haskell with the following codes:

``` haskell
foregin import ccall "gpuMalloc" __gpuMalloc :: CSize -> IO (Ptr a)
```

At the same time, we need a function to release it, and it binding kind should be `Ptr a -> IO ()`.
So the C/C++ code should be:

``` c++
extern "C"
void gpuFree(void* ptr) {
  cudaFree(ptr);
}
```

Meanwhile, the Haskell binding should be:

``` haskell
foregin import ccall "gpuFree" __gpuFree :: Ptr a -> IO()
```

However, if you checkout the documents on Hackage for `ForeignPtr`, you will find out that
to create a `ForeignPtr` you need a pointer and a pointer of release function.
So our Haskell function `gpuFree` can not be used, and we need to define another one:

``` haskell
foregin import ccall "&gpuFree" pGpuFree :: FunPtr (Ptr a -> IO ())
```

Then we can write functions to allocate a foregin pointer `ForeignPtr a`.
First one is to allocate by size.

``` haskell
gpuAllocByte :: Int -> IO (ForeignPtr a)
gpuAllocByte  = (>>= newForeignPtr pGpuFree) . __gpuMalloc . fromIntegral
```

Then we can also write a function to allocate for a specific type.

``` haskell
gpuAlloc :: Storable a => IO (ForeignPtr a)
gpuAlloc = doAlloc undefined
  where doAlloc :: a -> IO (ForeignPtr a)
        doAlloc dummy = gpuAllocByte (sizeOf dummy)
```

Here I redefined a function named `doAlloc`, because we need the size of kind `a` can be computed by `sizeOf :: a -> Int`
However we need an `a` computed it.
Usually there are two methods.
The first one is:
``` haskell
doAction = do
  ptr <- alloc
  a <- peek ptr
  return $ sizeOf a
```

And second one is :
```haskell
doAction = do
  ptr <- alloc
  return $ doA' undefined ptr 
  where doA' :: a -> Ptr a-> Int
        doA' dummy _ = sizeOf dummy
```

However, when you using `peek` you need to be careful, your memory allocated on GPU can not be "peeked".
There are no different between pointer on CPU and pointer o GPU.
So when you try to access CPU memory via GPU pointer, your program might broke down.
So you should `undefined` one, and by the way, function `sizeOf` do not cause any evalution of it input `a`.

Then we can write a function to allocate memory of array.
```haskell
gpuMallocArray :: Int -> IO (ForeignPtr a)
gpuMallocArray size = doAlloc undefined
  where doAlloc :: a -> IO (ForeignPtr a)
        doAlloc dummy = gpuAllocByte (sizeOf dummy * size)
```

## Wrap Array with Repa

So with `ForeignPtr`, we can not wrap the Repa's `Array`.

We use "foregin array" to wrap it, because we can create it by providing pointer and its shape.
We need two things: an alt pointer function to transform, and using pointer to do computing.

### Alt pointer

We need write a type-class to transform between `Array U sh e`, the unboxed array, and `Array F sh e`, the foregin array on GPU.
And that type-class is called `AltPointer`.
An example of alt pointer type-class is defined at following codes with type family.

``` haskell
class AltPointer f where
  type Alt f
  altPointer :: (Storable e,Source f e, Load D sh e, Target (Alt f) e)
             => Array f sh e -> IO (Array (Alt f) sh e)  
```

For instance of this type class, there are two functions are important. First one is to copy memory between host(CPU) and device(GPU).
The second one is transform "U" and "F", and for this function, we can use `copyS` or ``copyP`.

So the following codes are example.

```haskell
instance AltPointer U where
  type Alt U = F
  altPointer arr = do
    let sh = extent arr
        len = size sh
        fpArr = toForeignPtr $ copyS arr
    fpNew <- gpuMallocArray len
    withForeignPtr fpArr $ \pArr ->
      withForeignPtr fpNew $ \pNew ->
      gpuMemcpy pNew pArr len HostToDevice
    return $ fromForeignPtr sh fpNew

instance AltPointer F where
  type Alt F = U
  altPointer arr = do
    let sh = extent arr
        len = size sh
        fpArr = toForeignPtr arr
    fpNew <- mallocForeignPtrArray len
    withForeignPtr fpArr $ \pArr ->
      withForeignPtr fpNew $ \pNew ->
      gpuMemcpy pNew pArr len DeviceToHost
    return $ copyS $ fromForeignPtr sh fpNew
```

where the function `gpuMemcpy` is used to transform between host and device, and it is a wrap of `cudaMemcpy`.

### Using it

For example, we write a kernel to compute the absoulte value of a vector.

The following function is an example:

``` c++
__global__
void abs_k(float *in, float *out, size_t size) {
  int index  = blockIdx.x * blockDim.x + threadIdx.x;
  int stride = blockDim.x * gridDim.x;

  for (int i = index; i < size; i += stride)
    out[i] = absf(in[i]);
}
```

You can directly call this kernel function, with "extern 'C'" notation.
However, you need to wrap another CUDA APIs in Haskell.
You can also wrap this function with C++.

For example, if the wrap of haskell of kernal is

```haskell
foregin import ccall "abs_k_wrap" __abs :: Ptr Float -> Ptr Float -> CSize -> IO ()
```
The final function can be:

```haskell
abs :: Array F sh Float -> IO (Array F sh Float)
abs arr = do
  let sh    = extent arr
      len   = size sh
      fpArr = toForeignPtr arr
  fpOut <- gpuMallocArray len
  withForeignPtr fpArr \pArr -> 
    withForeignPtr fpOut \pOut -> 
    __abs pArr pOut len
  return $ fromForeignPtr sh pOut
```

Then we can use it, and following codes are example:

```haskell
let arr = fromListUnboxed (Z :. 16) [(-15)..0]
out <- abs $ altPointer arr
print $ altPointer out

```
