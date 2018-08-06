# YYTextDemo
## 问题
在使用YYTextView时碰到一个bug，在UIScrollView中加入YYTextView，在选择文字时滚动ScrollView，此时选中的光标会有1个圆圈显示位置出问题。查看issues发现有相同情况，并且YY大神给出了解决方案。<br>[issue链接](https://github.com/ibireme/YYText/issues/320)本质上YY大神希望参考UIKit的实现方案，将选择视图加在UIWindow上，但是由于没有什么好的方案检测textView在屏幕上绝对位置的实时变化，导致scrollView滑动时，textView并不知晓自己的位置发生变化而引起的问题。

## 方案
YY大神也给出了相应的方案，因为在textView中的一些scrollViewDelegate中，会有更新选中位置的操作，因此在监听到scrollView滑动时调用textView内有更新选中位置的方法即可。

在demo中粗暴地直接调用方法了

``` objc
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.textView performSelector:@selector(scrollViewDidEndDecelerating:) withObject:self.textView]; 
}
```

