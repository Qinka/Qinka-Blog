UWP 的数据绑定
===

# 绑定1: 控件间绑定
```XAML
<TextBox x:Name="bI"/>
<TextBlock x:Name="bO" Text"{Binding ElementName=bI,Path=Text,ModeOneWay}"/>
```

* `ElementName` 是元素的名称
* `Path` 是路径指代具体的属性
* `Mode` 是表示绑定的方式，分别为`OneTime`一次性，`OneWay` 单向，`TwoWay`双向。
