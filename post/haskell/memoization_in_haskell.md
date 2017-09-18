# Memoization

The memoization is a kind of technique -- trying to save and reuse the results for the evaluated.
In the many areas, memoization is useful. It's looked like to cache.
To be honest, I can not find the differences between them, though there might have some.

# Appetizer -- Fibonacci Sequence

There is classic example for programming : Fibonacci Sequence.
I suppose that you had known what the Fibonacci Sequence is.
So I directly show you a kind of code for this subject:

```haskell
fibA :: Int -> Int
fibA 0 = 0
fibA 1 = 1
fibA n = fibA (n-2) + fibA (n-1) 
```

We try this version with a small input(31), and then try a smaller input(30).

For 30, it use 1.66s to get the result, and for 15, it just spend 1.03s to get the result.

If you thought that is because of lazy evaluation, let's try this:

```haskell
fibB :: Int -> Int
fibB 0 = 0
fibB 1 = 1
fibB n = let a = fibB (n-2)
             b = fibB (n-1)
         in seq a $! seq b $! (a+b)
```

Does it have enough strict?
However, it has too much strict that for the both input(31 and 30), the more time and memory are used.
The former(31) use 4.17s and 906,298,000 bytes(according to ghci's `:set +s` and `fibA 31` just using 557,767,120 bytes). And the latter use 2.52s and 560,165,984 bytes(`fibA 30` just using 344,763,912 bytes).

So just see the following:

```haskell
fibC :: Int -> Int
fibC = (map fib [0..] !!)
  where fib 0 = 0
        fib 1 = 1
        fib n = fibC (n-2) + fibC (n-1)
```

For 31, 30, and 100, the output from GHCi is:

```
(0.00 secs, 146,456 bytes)
```

*The memory used might be a litter larger or smaller than my output for each input.*

That is amazing, isn't it?

# Why That Work?

## Constant Applicative Form (CAF, for short)

Before we talk about how to make your functions memoization, you should know a thing that is called **constant applicative form**.

The compact definition of CAF is:
> A supercombinator that is not a lambda abstraction is a CAF.

### Supercombinators

A supercombinator is either a constant, or combinator which contains only subexpressions are supercombinators.

The followings are the supercombinators:

```Haskell
666
\a b -> a + b
\opt i xs -> opt i <$> xs 
```
But these are not CAFs:

```Haskell
\f g x -> f (\h -> g $ h x)
\f g = h . g . f
```

Any lambda expression of the form:
```Haskell
\x1 x2 ... xn -> exp
```
and `exp` is not a lambda abstraction. It is fine that the lambda
expression can be non-lambda abstraction(like: `(+) 1`) that means n = 0.

But for the both, the free variables in `exp`  are `x1`, `x2`, ... `xn`, and each lambda abstraction in `exp` must be a supercombinator.


### For CAFs

The subvalues are automatically memoized within the value itself.

## Memoize Your Functions

If you want to memorize your function, change your function to CAF in a right way.

We can define a function:
```haskell
func :: Int -> Int
func = (+) 2
```

Then in the GHCi, set up `:set +s`, and try to evaluate `func 100000`
, and try it again. You will find the different.


# Ops: Compiler Optimizations

The automatically compiler optimizations might will help you to fix the mistake you made about memoization. But trust me, some time you need reorder the complex computations by yourself.

More than that, the optimizations made from compiler, are more than memoization. Inline, stream fusion , and others might cause your value or function recalculated.




# Too Much Memeoization

Memoization might make your space leak, so it is important to be careful with it. If you care about the usage of memory, you need to avoid using such thing -- break the such things by yourself.

# More Examples

There are some example that are solved using memoization.

## Matrix Chain Product

This is a problem in the *Introduction to Algorithms*.
It is a problem solved by dynamic programming.

In the book, there are two tables which call **m** and **s**. The following function is the one to get that function and using memoization.

```haskell
rmvMkM :: [Int] -> Array (Int,Int) (Int,Int)
rmvMkM as = arr
  where arr = array ((0,0),(ll,ll)) $
          [ ((i,j),mkM i j ) | i <- [0..ll], j <- [0..ll]]
        mkM i j = if i == j
                  then (0,0)
                  else let i' = min i j
                           j' = max i j
                           ks = [i' .. j'-1]
                       in minimum $ loop i' j' <$> ks
        loop i j k = let q = l + r + _i * _kk * _jj
                         l = fst $ arr ! (i,k)
                         r = fst $ arr ! (k+1,j)
                         _i  = as !! 1
                         _kk = as !! (k+1)
                         _jj = as !! (j+1)
                     in q `seq` (q,k)
        len = length as
        ll  = max 0 $ len - 2
```

And this one is an error example, because it is not the CAF.

```haskell
rmvMkM' :: [Int] -> Int -> Int -> (Int,Int)
rmvMkM' xs = mkM
  where mkM i j = if i == j
                  then (0,0)
                  else let i' = min i j
                           j' = max i j
                           ks = [i' .. j'-1]
                       in minimum $ loop i' j' <$> ks
        loop i j k = let q = l + r +  _i * _kk * _jj
                         l = fst $ rmvMkM' xs i k
                         r = fst $ rmvMkM' xs (k+1) j
                         _i  = xs !! i
                         _kk = xs !! (k + 1)
                         _jj = xs !! (j + 1)
                     in q `seq` (q,k)
```


## Performance

Here, I will compare the performance of the two kind of the function. The right one is the O(n^3), but the error one is O(2^n).
My test computer is an early-2015 MacBook Pro 13-inch with 16Gb memory and 3.1GHz Intel Core i7.

The following is the data of test with right one:

| size | time | Data or Test|
|--------|----------|--------|
|   1 | 0.00 | data |
|  10 | 0.00 | data |
|  20 | 0.01 | data |
|  30 | 0.03 | data |
|  40 | 0.06 | data |
|  50 | 0.11 | data |
|  60 | 0.19 | data |
|  70 | 0.31 | data |
|  80 | 0.46 | data |
|  90 | 0.86 | data |
| 100 | 0.92 | data |
| 120 | 1.62 | data |
| 140 | 2.62 | data |
| 160 | 4.41 | data |
| 200 | 8.33 | test |

The last item of the data is used to verify whether the fitting is right or bad.
Then I use the Matlab to fit these data:

```Matlab
xs = [0 0 0.01 0.03 0.06 0.11 0.19 0.31 0.46 0.86 0.92 1.62 2.62 4.14 8.33];
ys = [1 10 20 30 40 50 60 70 80 90 100 120 140 160 200];
zs = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 0];
```

The `xs` is the times that them cost, and the `ys` is the sizes of the problems.
The `zs` is the weights which will tell the computer that the last data need not be fit.

The following is the data of test with error one:

| size | time | Data or Test|
|--------|----------:|--------|
|  2 | 0.00 | data |
|  4 | 0.00 | data |
| 10 | 0.01 | data |
| 11 | 0.03 | data |
| 12 | 0.07 | data |
| 13 | 0.25 | data |
| 14 | 0.74 | data |
| 15 | 2.27 | data |
| 16 | 6.57 | data |
| 20 | 556.69 | test |

And the Matlab will be:

```Matlab
as = [2 4 10 11 12 13 14 15 16 20];
bs = [0 0 0.01 0.03 0.09 0.25 0.74 2.27 6.57 556.69];
cs = [1 1 1 1 1 1 1 1 1 0];
```

Then I use the Curve Fitting Tool in the Matlab.
The following figures are results.

![](/res/haskell/memoization-in-haskell/r1.png)

![](/res/haskell/memoization-in-haskell/r2.png)

![](/res/haskell/memoization-in-haskell/r3.png)