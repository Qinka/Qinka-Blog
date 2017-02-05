# Haskell OverloadedLabels Extension

Since GHC 8.0.1, there are a new language extension named "OverloadedLabels", which will enable use of the `#foo` overloaded label syntax.

According to *GHC User Guide 8.0.1*. GHC now supports overloaded labels. This syntax is a form of identifier, and the way about choosing what
is it may depend on both of type and literal text. And for a label named foo, `#foo`, the type is `IsLabel "foo" a => a`. 
And there is a class named `IsLabel`, liking `IsString` and `IsList`.

## Type class: `IsLabel`

If you want to use the "OverloadedString" extension, and "OverloadedList" extension, you need to know how to give the instance.
It's same to "OverloadedLabels". But before that, we need to know how this extension is defined.

```haskell
class IsLabel (x :: Symbol) a where
  fromLabel :: Proxy# x -> a
```

The `Symbol` is defined in `GHC.Types`, and there are no special defaulting rules for IsLabel.

And there is a small example about `IsLabel`.

```haskell
instance IsLabel "id" (Int -> Int) where
  fromLabel _ = id
```

From the codes, it is clearly that there will be a label named "id", written like `#id`, and it is looked like the function `id`.
So you can have a try, and you need these extensions: OverloadedLabels, DataKinds, FlexibleInstances, MultiParamTypeClasse, FlexibleContexts.

If everything worked, you will get an error, which is about ambiguous type. That is because the compiler do not know what kind of type is the `#id`.
So you can try `(#id :: Int -> Int) 1`. That will work, and print 1.

If you had seen the user guide of GHC, you will find out that the example in the guide is more complex than my.
Because of the without functional dependencies, the compiler do not know the type, when using the OverloadedLabels extension.

## The Right Way to Use OverloadedLabels

If you do not want a label to be ambiguous, you need functional dependencies. Unless you want use this extension do want function `def` have done,
the FD is useful.

Firstly, you need these extensions: DataKinds, KindSignatures, MultiParamTypeClass, FunctionalDependencies, FlexibleInstances, OverloadedLabels,
ScopedTypeVariables. And import these modules: GHC.OverloadedLabels, GHC.TypeLits.

Then, you need to defined a data like the following codes:

```haskell
data Label (l :: Symbol) = Get
```

And a class:

```haskell
class Has a l b | a l -> b where
  from :: a -> Label l -> b
```

That means the type a and type l can determine the type b. 
This can make the compiler sure that what the label's type should be.

```haskell
instance Has a l b => IsLabel l (a->b) where
  fromLabel _ x = from x (Get :: Label l)
```

Then when there is an instance of Has(e.g. `instance Has Int "id" Int`), there will be also an instance of IsLabel(e.g. `instance IsLabel "id" (Int -> Int)`).
However, there will not be ambiguous.

```haskell
instance Has Int "id" Int where
  from x _ = x
```

Now, `#id` is what we want. If you still get the error about ambiguity, try:

```haskell
ghci> #id (1::Int)
```

The literal `1` is an ambiguous literal, because of the Double and Int.

## More About Functional Dependencies

If we defined a class named IsLabelFD, with the following codes.

```haskell
class IsLabelFD (x::Symbol) a | x -> a where
  fromLabelFD :: Proxy# x -> a
instance IsLabelFD x a => IsLabel x a where
  fromLabel = fromLabelFD
```

We can use `IsLabelFD` instead of `IsLabel`, the ambiguity will disappear. But the `IsLabel` is irreplaceable.
