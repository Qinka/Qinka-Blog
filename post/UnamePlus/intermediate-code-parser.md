# 中间代码解析器 

实际的 Uname 的中间代码的格式与中间代码的设计略有不同。其中帧与帧之间的分隔符不是使用一行或者是多行的空白而是使用命令`frame`。
同时提高了容错率，其中当有错误的内容传输进来时，会做一些适当的处理来忽略错误内容。

## 中间代码的格式示例

修改过的的中间代码可能长这样：

```
rotate 0
scale 10 10
translate 10 20
frame
1 1 RGB 9 6 7
-2 2 
.3 3.
4 4.e12
5 5 255 0 255
6 6
7 7
8 .8e2
rotate 0.569
frame
1 2.2e2
2 3.3
3 4
4 5
5 6
6 7
7 8
8 9
```
大致类似于这样，其中 `rotate`,`scale`,`translate`这三个是设置坐标平移变换的与旋转的。
`frame` 是控制或者叫分割帧的。
`DOUBLE DOUBLE [COLOR-TYPE] {DOUBLE}` 是每一个点的格式，至少指明点的坐标，然后可以选择性的指明颜色的格式，与颜色的参数。

## 解析浮点数

中间代码解析的一部分内容是解析数字，点与一些命令是需要接受浮点类型的参数的。
所以解析浮点数是先写的内容。浮点数的格式有如下的格式。  
整数部分与小数部分均有。  
`digit{digit}.digit{digit}[(e|E)[+|-]digit{digit}]`  
只有整数部分  
`digit{digit}[.][(e|E)[+|-]digit{digit}]`  
或者只有小数部分  
`.digit{digit}[(e|E)[+|-]dight{digit}]`  

所以解析的时候需要有三个部分。
第一个部分是解析整数部分。

```haskell
intOL :: Parser Double
intOL = do
  f <- read <$> many1 digit
  option '.' $ char '.'
  e <- option id expItem
  return $ e f
```

首先先解析整数部分的那些数字。限制整数部分至少有一位，所以使用 `many1`，然后限制数字类型（十进制）的字符。
读出来的是一系列数字，也就是要转换成最后的数值。有需后面可以跟随一个小数点，则使用 `option` 读取一个小数点。
`option` 使得一个程序尝试读取一个匹配，比如一个字符——“.”，然后如果无法匹配则，就是用默认的一个。
最后获取指数部分的内容，指数部分的内容，然会的是一个函数，来使得指数部分作用于常规部分。
最后返回这个数字。

如果解析的是只有小数的部分。

```haskell
pointOL :: Parser Double
pointOL = do
  f <- (read.("0."++)) <$> (char '.' *> many1 digit)
  e <- option id expItem
  return $ e f
```

首先先获取到小数点，然后获取到至少一位的小数部分，然后转化成 Double 类型的数据。之后，在类似的获取到指数部分的内容。
组合成最后数据。

然后是解析全部的完成的浮点数类型。

```haskell
bypartL :: Parser Double
bypartL = do
  l <- many1 digit
  p <- char '.'
  r <- many1 digit
  let f = read $ l++p:r
  e <- option id expItem
  return $ e f
```

使用类似的方式，解析小数与整数部分均有的数。其中先获取整数部分，然后获取小数点，最后获取小数的部分。然后是获取指数部分。
然后将小数、整数、与小数点组合后转化成 浮点数，在与指数部分组合。

然后是指数部分的获取。其中各种小数表示的方法都是相同的指数湖区部分。

```haskell
expItem :: Parser (Double -> Double)
expItem = do
  char 'E' <|> char 'e'
  g <- sign
  x <- read <$> (many digit)
  return $ f (g x)
  where
    f 0 0 = 0
    f x y = y ^^ x
	
sign :: Num a => Parser (a -> a)
sign = do
  x <- option '+' $ oneOf "+-"
  return $ \a -> case x of
    '+' -> a
    '-' -> -a
```

首先获取指数部分所需要有的那个字符 'e' 或者 'E'，标志着指数部分的开始。然后是是获许符号，并返回一个函数来调整符号为。
然后是获取指数部分中的指数，读取一串整数即可。然后整合在一起。其中GHC 有一个问题是 0 的 0次方 本身是不应该存在的，但是这里是应该为应该为
0的，所以人工使之为零。

然后将整个浮点数部分串联起来。

```haskell
floatLit :: Parser Double
floatLit = sign >>= \x -> x <$> choice [try bypartL, intOL, pointOL,floatFailed]
```

其中由于整数与两者都有的在某些情况下是“重合”的，所以设置两者都有的小数形式现匹配。最后由于重点代码需要有一定的容错率，所以使用
`floatFailed` 来处理解析浮点数的时候出错的情况。

```haskell
floatFailed :: Parser Double
floatFailed = warning True "parsing float number failed" Nothing >> return 0
```

要将错误记录到状态之中，然后反馈给需要它的地方。

小数就这样解析完了。


## 坐标点解析

有了浮点数解析的内容，然后我们就可以解析坐标点了。坐标点一共有两个部分：X、Y坐标与颜色。其中颜色的部分是可以选择的。

```haskell
point :: Parser Point
point = do
  whiteSpace
  x <- floatLit
  whiteSpace
  y <- floatLit
  whiteSpace
  ck <- (map toUpper) <$> many letter
  whiteSpace
  ds <- (floatLit `sepBy` whiteSpace)
  return $ Point (x,y) ck ds
```

首先先将行首的空白略去，然后读取第一个浮点数。然后再略去空白，读取第二个浮点数。

然后就是可选的颜色部分。对于颜色的种类，是可选的。先读取字母，读取的个数可以是没有，一个或者多个。
然后是颜色的数据，由于不同类型颜色的参数个数不同，所以，我们使用数组存储数据。获取没有或者几个浮点数。
获取的策略是直到末尾。

然后将这些数组组装成一个点的数据类型。

## 帧与坐标变换解析

帧是比较好解析的，在一行中有一个单词（唯一的）“frame”，就标记着一个新的帧的开始。在没有时间系环境中，等效于清屏。

```haskell
newFrame :: Parser Input
newFrame = do
  whiteSpace
  string "frame"
  whiteSpace
  return FrameSplit
```

其中略去 frame 两边的空格，读出 单词“frame”。返回帧分割的“标记”。

对于 坐标变换这一部分来说，只是比 帧分割的部分多出了几个参数，相似的解决问题即可。

```haskell
setting :: Parser Setting
setting = do
  whiteSpace
  x <-  string "rotate"
    <|> string "scale"
    <|> string "translate"
  whiteSpace
  case x of
    "rotate" -> do
      x <- floatLit
      whiteSpace
      return $ Rotate x
    "scale" -> do
      x <- floatLit
      whiteSpace
      y <- floatLit
      whiteSpace
      return $ Scale (x,y)
    "translate" -> do
      x <- floatLit
      whiteSpace
      y <- floatLit
      whiteSpace
```

先去将空格消去，并且 “rotate”，“scale”与“translate” 中的一个。然后根据获得的字符串来判定是那个类型的变换，并且获得相对应的数据。
再将数据整合返回。

## 中间代码解析

对于中间代码的三部分都处理完之后，我们再是编写处理整个中间代码的内容。

```haskell
input :: Parser Input
input = do
  x <- choice [try newFrame, PointI <$> try point, SettingI <$> try setting,try errorItem] <* end
  spaces
  return x
```

对于整个中间代码，每一行都应该是帧分隔符，坐标变换，或者坐标点之中的一个。如果不是，除非是空白行，否则就是错误输入。
由于对于容错的要求，我们不处理有醋五的那一行，而是将其记录下来。在 点，设置，帧分割之间匹配。如果没有匹配的，就进入错误处理的部分。

```haskell
parser :: Parser ([Input],[Warning])
parser = do
  rt <- ignore <$> many input <* eof
  st <- getState
  return (rt,st)
  where
    ignore [] = []
    ignore (InvailedStmt:xs) = ignore xs
    ignore (x:xs) = x:ignore xs
```
然后产生最后的 parser。使用 “ignore”， 处理多余的 InvailedStmt。然后获取当前状态，里面有关于无效内容的信息。

```haskell
runIC :: String -> String -> Either ParseError ([Input],[Warning])
runIC s str = runP parser [] s str

runICIO :: Handle -> IO  (Either ParseError ([Input],[Warning]))
runICIO h = hGetContents h >>= \str -> return $ runIC (filepath h) str
  where
    filepath (DuplexHandle i _ _) = i
    filepath (FileHandle i _ ) = i
```

最后将这些东西包装一下。

## 处理错误与其他部分

由于对于容错的要求较高，因为不希望让一些小错误甚至大量的错误影响正常语句的读写。
所以先定义警告语句，由于不能停止，所以不是错误语句。

```haskell
warning ::Bool ->  String -> Maybe String -> Parser ()
warning is reason text =  do
  pos <- getPosition
  let errStr = "In "
        ++ sourceName pos
        ++ ", line "
        ++ show (sourceLine pos)
        ++ ", column "
        ++ show (sourceColumn pos)
        ++ ": "
        ++ reason
  modifyState (Warning errStr text:)
  when is $ parserFail $ errStr ++ fromMaybe "" ((". with: "++) <$> text)
```

遇到了错误部分，先获取当前错误部分的信息，然后修改状态，添加无效语句的信息。选择性地报告错误。

对于处理错误语句的部分

```haskell
errorItem :: Parser Input
errorItem = do
  text <- many (noneOf "\n") <* char '\n'
  warning False "parsing point or command failed" $ Just text
  return InvailedStmt
```

先读到这一行行尾，也就是跳过可能的那些错误部分，来到了下一行。

对于其他的一些处理，包括空白与换行，代码如下。

```haskell
whiteSpace :: Parser ()
whiteSpace = skipMany $ oneOf " \t"

nline :: Parser Char
nline = try crlf <|> newline

end :: Parser ()
end = skipMany nline
```

## 结尾

这个中间代码就基本上这样做好了，性能并不是太好，处理 1.1Mb 大小的中间代码需要大约 2秒钟的时间（其中 全部内容为点，1万个点，大约 57kb 大小）。


