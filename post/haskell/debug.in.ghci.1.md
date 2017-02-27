
# Preface

According to *GHC Users Guide for 8.0.1*, there are four things about debugging, which you can do:

* Set a Breakpoint
* Single-step
* Tracing what had executed
* Break when exceptions catched

# Setting Breakpoint

The following is the code of function `myLines`, and it will be used as an example.

```haskell
myLines         :: String -> [String]
myLines ""       =  []
myLines s        =  cons (case break (== '\n') s of
                                    (l, s') -> (l, case s' of
                                                    []      -> []
                                                    _:s''   -> lines s''))
  where
    cons ~(h, t) =  h : t
-- from base-4.9.1.0
```

Befor we set up a breakpoint, load the module into GHCi, firstly.

```
Preface> :load MyLines.hs
[1 of 1] Compiling MyLines                  (MyLines.hs, interpreted)
Ok, modules loaded: MyLines.
*MyLines>
```