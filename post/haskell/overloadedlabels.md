# Haskell OverloadedLables Extension

Since GHC 8.0.1, there are a new language extension named "OverloadedLabels", which will enable use of the `#foo` overloaded label syntax.

According to *GHC User Guide 8.0.1*. GHC now supports overloaded labels. This syntax is a form of identifier, and the way about choosing what
is it may depend on both of type and literal text. And for a label named foo, `#foo`, the type is `IsLabel "foo" a => a`. 
And there is a class named `IsLabel`, liking `IsString` and `IsList`.

## Type class: `IsLabel`

If you want to use the "OverloadedString" extension, and "OverloadedList" extension, you need to know how to give the instance.
It's same to "OverloadedLabels". But befor that, we need to know how this extension is defined.

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
So you can have a try, 
