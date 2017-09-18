
# Preface

According to *GHC Users Guide*, there are four things about debugging, which you can do:

* Set a Breakpoint
* Single-step
* Tracing what had executed
* Break when exceptions caught

# Setting Breakpoints

The following is the code of function `myLines`, and it will be used as an example.

```haskell
module MyLines where
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

Before we set up a breakpoint, load the module into GHCi, first:

```
Prelude> :load MyLines.hs
[1 of 1] Compiling MyLines                  (MyLines.hs, interpreted)
Ok, modules loaded: MyLines.
*MyLines>
```

Then we set a breakpoint on this line: `(l, s') -> (l, case s' of`:

```
*MyLines> :break 4
Breakpoint 0 activated at MyLines.hs:4:32-48
*MyLines>
```

Then we execute `myLines "abc\ndef"`:

```
*MyLines> myLines "abc\ndef"
["Stopped in MyLines.myLines, MyLines.hs:4:32-48
_result :: ([Char],[Char]) = _
s :: [Char] = 'a' : _
[MyLines.hs:4:32-48] *MyLines>
```

And then the execution get stopped at the breakpoint: 4:32-48.

And we can use `:list` to show the location of the break:

```
[MyLines.hs:4:32-48] *MyLines> :list
3  myLines ""       =  []
4  myLines s        =  cons (case break (== '\n') s of
5                                      (l, s') -> (l, case s' of
[MyLines.hs:4:32-48] *MyLines>
```

The variable `_result` is a binding for the result of the expression which is executing.

If you want to delete the breakpoint, using `:delete` command.
If you want to list the breakpoints , using `:show breaks` command.

```
*MyLines> :show breaks
[0] MyLines MyLines.hs:4:32-48
*MyLines> :delete 0
*MyLines> :show breaks
No active breakpoints.
*MyLines>
```

# Single-Stepping

There are three kinds of single-stepping in GHCi:

* `:step` : just the single-stepping
* `:steplocal` : this one will limit the set of enabled breakpoints to those in the current top-level function.
* `:stepmodule` : this one will limit the set of enabled breakpoints in the current module.

To stepply execute a expression, using `:step expr`:

```
*MyLines> :step myLines "abc\ndef"
Stopped in MyLines.myLines, MyLines.hs:(4,21)-(7,74)
_result :: [[Char]] = _
cons :: (a, [a]) -> [a] = _
s :: [Char] = 'a' : _
[MyLines.hs:(4,21)-(7,74)] *MyLines> :list
3  myLines ""       =  []
4  myLines s        =  cons (case break (== '\n') s of
5                                      (l, s') -> (l, case s' of
6                                                      []      -> []
7                                                      _:s''   -> lines s''))
8    where
[MyLines.hs:(4,21)-(7,74)] *MyLines>
```

# Tracing

In the *GHC Users Guide*, there is a situation: how did I get here?
Haskell is a "lazy" language, for Haskell is "call by need".
And for another situation: get the error --"*** Exception: Prelude.read: no parse",
but I used `read` "everywhere".

The command `:trace` can help to solve this problem.
Set a breakpoint and using `:trace`:

```
*MyLines> :b 4
Breakpoint 1 activated at MyLines.hs:4:32-48
*MyLines> :trace myLines "abc\ndef"
["Stopped in MyLines.myLines, MyLines.hs:4:32-48
_result :: ([Char], [Char]) = _
s :: [Char] = 'a' : _
[MyLines.hs:4:32-48] *MyLines> :history
-1  : myLines:cons (MyLines.hs:9:21-25)
-2  : myLines (MyLines.hs:(4,21)-(7,74))
<end of history>
[MyLines.hs:4:32-48] *MyLines>
```

When it stopped at the breakpoint, we can use `:history` to check "call stack",
which should not be called "call stack". It should be called : "Evaluation History".

# Debugging Exceptions

GHC provides a function to trace "stack".
If you call the function `error`, there will go the informations about call stack:

```
*MyLines> error "here"
*** Exception: here
CallStack (from HasCallStack):
  error, called at <interactive>:42:1 in interactive:Ghci6
*MyLines>
```

This is since ghc-8.
And you can also work with `Debug.Trace.trace`, `Debug.Trace.traceStack`, or `+RTS -xc`.

GHC provides the function that treat exception and error as "a breakpoint".
It is a good idea that this function is used with `:trace` and other debugging command.

The flag `-fbreak-on-exception` is for exceptions, and `-fbreak-on-error` is for errors.

```
*MyLines> :set -fbreak-on-exception
*MyLines> :trace myLines $ "abc\ndef" ++ error "here"
["abc","defStopped in <exception thrown>, <unknown>
_exception :: e = _
[<unknown>] *MyLines> :history
-1  : myLines (MyLines.hs:7:64-72)
-2  : myLines (MyLines.hs:(5,48)-(7,73))
-3  : myLines (MyLines.hs:4:32-48)
-4  : myLines:cons (MyLines.hs:9:21-25)
-5  : myLines (MyLines.hs:(4,21)-(7,74))
<end of history>
[<unknown>] *MyLines>
```
