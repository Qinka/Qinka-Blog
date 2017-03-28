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

For 30, it use 1.66s to get the result, adn for 15, it just spend 1.03s to get the result.

If you thought that is because of lazy evalution, let's try this:

```haskell
fibB :: Int -> Int
fibB 0 = 0
fibB 1 = 1
fibB n = let a = fibB (n-2) 
             b = fibB (n-1)
         in seq a $! seq b $! (a+b)
```

Does it has enough strict?
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

*The memory used might be a litter larger or smaller then my output for each input.*

<<<<<<< HEAD
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
, and try a again. You will find the different.




# Ops: Compiler Optimizations
