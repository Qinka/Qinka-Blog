
# Conventions

This blog's examples is running on the macOS 10.12 with GHC-8.0.2.
In the different environments, the **CONDITIONs** of the crash might be different, except **BUGs**.

# 1. Heap Exhausted (1)

There is an example for crash your GHCi, via "Heap Exhausted".
We fire up the GHCi with command: `ghci +RTS -M40m`.
Then we calculate the sum of `[1..10^6]`, with the following codes:

```
> import Prelude as P
P > import Data.List as L
P L> :set +s
P L> L.foldl' (+) 0 [1..10^6]
500000500000
(0.10 secs, 88,080,384 bytes)
P L> let xs = [1..10^6] :: [Int]
(0.00 secs, 64,112 bytes)
P L> L.foldl' (+) 0 [1..10^6] :: Int
500000500000
(0.10 secs, 96,078,704 bytes)
P L> L.foldl' (+) 0( [1..10^6] :: [Int])
500000500000
(0.03 secs, 96,074,544 bytes)
P L> L.foldl' (+) 0 xs
<interactive>: Heap exhausted;
<interactive>: Current maximum heap size is 41943040 bytes (40 MB).
<interactive>: Use `+RTS -M<size>' to increase it.
```

Because of the binding `xs`, the `xs` will be a shared value, and GC will not recycle it. Then the space leak, and crash.

# 2. Impossible Happened (1) **[BUG]**

Fire up your GHCi, and do the following do.

```
Prelude> :set -fbreak-on-exception
Prelude> import Control.Exception
Prelude Control.Exception> :trace read "a" :: Int
Stopped in <exception thrown>, <unknown>
_exception :: e = _
[<unknown>] Prelude Control.Exception> _exception

<interactive>:4:1: error:
    • No instance for (Show e) arising from a use of ‘print’
      Cannot resolve unknown runtime type ‘e’
      Use :print or :force to determine these types
      Relevant bindings include it :: e (bound at <interactive>:4:1)
      These potential instances exist:
        instance Show Ordering -- Defined in ‘GHC.Show’
        instance Show Integer -- Defined in ‘GHC.Show’
        instance Show a => Show (Maybe a) -- Defined in ‘GHC.Show’
        ...plus 22 others
        ...plus 11 instances involving out-of-scope types
        (use -fprint-potential-instances to see them all)
    • In a stmt of an interactive GHCi command: print it
[<unknown>] Prelude Control.Exception> _exception :: SomeException

<interactive>:5:1: error:<interactive>: panic! (the 'impossible' happened)
  (GHC version 8.0.2 for x86_64-apple-darwin):
	No skolem info: e_ESget[rt]

Please report this as a GHC bug:  http://www.haskell.org/ghc/reportabug

[<unknown>] Prelude Control.Exception>
```

When trying to evaluate `_exception`, the GHCi crash for an *"no skolem info"*. But you still can do the same things using `:force`:

```
[<unknown>] Prelude Control.Exception> :force _exception
_exception = SomeException
               (ErrorCallWithLocation "Prelude.read: no parse" [])
[<unknown>] Prelude Control.Exception>
```