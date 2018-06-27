# Accelerate Model of Haskell Foreign Accelerate Interface

## Outline

## Basic operations

This post will base on CUDA, OpenCL, OpenMP, and OpenACC to define the model. 

The operations should include

* Allocate target device memory
* Release  target device memory
* Copy data between hsot and target device.
* Call the function by name.

For an algorithm, we can name the four implements for four framework: `alg_cuda`, `alg_cl`, `alg_mp`, and `alg_acc`.
The input and output types of these four functions should be the target pointer.

## Basic data

For any of CUDA, OpenCL, OpenMP, and OpenACC, there should be two kind of data:
    * Framework global context
    * Custom global context

## Definition

The interface should be:
```Haskell
class FAI i where
    allocate :: Size -> IO (Ptr a)
    release  :: Ptr a -> IO ()
    copy     :: Direction -> Ptr a -> Ptr a -> Size -> IO ()
    call     :: String -> IO (FunType a)
    setContext :: Context -> IO ()
    getContext :: IO Context
```