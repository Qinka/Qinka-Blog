# 使用 haskell-hi 绘制 1

这一部分将是关于使用 Haskell 的一个库 haskell-gi 来绘制简单的 UI。 

## Haskell-GI

这个叫 haskell-gi 的库，在 Haskell 的 gtk 系列 绑定的。同时使用 其 Gtk 的绑定的库。

安装方式的话，需要使用 cabal(1) 或者 stack(1) 来安装。在安装之前需要确保在任何平台上，有安装 X11 与 GTK 的内容。
其中的话， macOS 需要人为的装一下（对于较高的版本来说），Windows 下 使用 MYSY2 与 Chocolatey。此外，Windows下 需要管理员权限。
具体的安装方式参照 GitHub 上 [gtk2hs/gtk2hs](https://github.com/gtk2hs/gtk2hs) 仓库中所提到的安装方式安装。

然后安装 haskell-gi，通过 cabal(1)。

```
cabal update
cabal install alex happy
cabal install haskell-gi gi-gtk
```

然后就可以进行 GTK 之旅了。

## Hello World

直接参考 haskell-gi 官方的例子，我们写一个 Hello World 的例子。

首先先

```haskell
{-# LANGUAGE OverloadedStrings
	       , OverloadedLabels
		   #-}
```

haskell-gi 使用到了 GHC-8.0 新的 语法扩展特性 OverloadedLabels 特性。

然后导入

```
import GI.Gtk hiding (init,main)
import qualified GI.Gtk as Gtk
import Data.GI.Base
```

然后

```
main :: IO ()
main = do
```

然后初始化 GTK

```
  Gtk.init Nothing
```

初始化GTK 之后需要新建一个窗口，当然，如果你愿意，可以建两个。

```
  win <- new Window [ #title := "Hello World!" ]
  on win #destory mainQuit
```

同时设置一个 销毁的事件。

然后创建一个按钮

```
  button <- new Button [ #label := "Hi!" ]
```

然后我们再创建一个 Dialog，并让当这个Dialog 销毁时，退出程序。

```
  msg <- new MessageDialog [ #text := "Hi" ]
  on msg #destory mainQuit
```

然后将的 Dialog 注册到 按钮的点击时间上面

```
  on button #clicked $ do
    dialogRun msg
```

然后将 按钮 注册到窗体，并显示窗体

```
  #add win button
  #showAll win
```

最后再启动

```
  Gtk.main
```

编译，我们假定这个文件名是 hw.hs 。然后

```
ghc -o hw hw.hs
```

最后运行这个可执行文件就好了。

最后能看见一个神奇的小窗口，然后点击那个 “Hi” 。然后的话，就会出现一个弹窗，显示 “Hi”，然后关闭那个弹窗。

![创建的主窗口](/img/gtk-hello-world-1.png)

![弹出的MessageDialog](/img/gtk-hello-world-2.png)
