# JJCollectionViewRoundFlowLayout

[![CI Status](https://img.shields.io/travis/kingjiajie/JJCollectionViewRoundFlowLayout.svg?style=flat)](https://travis-ci.org/kingjiajie/JJCollectionViewRoundFlowLayout)
[![Version](https://img.shields.io/cocoapods/v/JJCollectionViewRoundFlowLayout.svg?style=flat)](https://cocoapods.org/pods/JJCollectionViewRoundFlowLayout)
[![License](https://img.shields.io/cocoapods/l/JJCollectionViewRoundFlowLayout.svg?style=flat)](https://cocoapods.org/pods/JJCollectionViewRoundFlowLayout)
[![Platform](https://img.shields.io/cocoapods/p/JJCollectionViewRoundFlowLayout.svg?style=flat)](https://cocoapods.org/pods/JJCollectionViewRoundFlowLayout)

<div align="vertical-center">
  <a href="https://deepwiki.com/netease-kit/nim-uikit-harmony/1-overview">
    <img src="https://devin.ai/assets/deepwiki-badge.png" alt="Ask the Deepwiki" height="20"/>
  </a>
  <p>单击跳转查看 <a href="https://deepwiki.com/kingjiajie/JJCollectionViewRoundFlowLayout/1-overview">DeepWiki</a> 源码解读。</p>
</div>

-------------------------------


   JJCollectionViewRoundFlowLayout可设置CollectionView的BackgroundColor，可跟据用户Cell个数计算背景图尺寸，可自定义是否包括计算CollectionViewHeaderView、CollectionViewFootererView或只计算Cells。设置简单，可自定义背景颜色偏移，设置显示方向（竖向、横向）显示,不同Section设置不同的背景颜色，支持自定义delegate 输入，并兼容像IGListCollectionView无delegate的情况。
   可设置内容：
   
   1、collectionView section底色。  
   2、是否包含headerview。  
   3、是否包含footerview。  
   4、支持borderWidth、borderColor。  
   5、支持shadow投影。  
   6、支持collectionView，Vertical，Horizontal。  
   7、支持根据不同section分别设置不同底色显示。  
   8、支持根据section单独判断是否计算对应headerview和footerview  
   9、新增对Cell的对齐模式进行设置，支持（左对齐）--- V2.0.0  
   10、增加对不规则Cell大小的计算方式支持，支持对不规则Cell计算实际背景视图大小，默认不开启计算，如使用不规则计算需手动开启isCalculateTypeOpenIrregularitiesCell字段  
   11、新增对Cell的对齐模式进行设置，支持（居中对齐）--- V2.1.0  
   12、新增对Cell的对齐模式进行设置，支持（右对齐）--- V2.2.0  
   13、新增对Cell的对齐模式进行设置，支持（右对齐和首个Cell右侧开始）---V2.3.0  
   14、支持xib、storyboard 唤起，能够默认开启背景图开关设置 ---V2.3.2  
   15、增加对背景图的点击事件处理和控制，通过代理返回点击的背景图的IndexPath ---V2.4.0  
   16、增加支持Cell个数为0时，可以单独对Section的Header&Footer进行计算，支持全局设置和单独根据Section设置是否计算。---V2.5.0  
   17、增加背景点击动画，支持单独设置点按相关属性，支持点按后设置Cells是否跟随背景动画。---V2.6.0  
   18、增加背景支持图片展示功能。---V2.7.0  
   19、增加对不设置JJCollectionViewRoundConfigModel的处理。---V2.7.1  
   20、扩展JJCollectionViewRoundFlowLayout 支持自定义delegate 输入，并兼容像IGListCollectionView无delegate的情况。-- 感谢liao3841054的提交。---V2.8.0  
   21、扩展JJCollectionViewRoundFlowLayout 增加根据Section自定义对应Section内Cells的对齐方式设置。---V2.9.0  
   22、fix issue:#11 切换夜间模式的问题, myCacheAttr 可能会存在空, 导致视图背景被清空问题。---V2.9.1  
   23、fix:issue:#14 修复2.9.1版本在设置header悬浮后出现的崩溃问题。(感谢wangchunjiang提出该问题)
   
   Swift版本地址：[GitHub地址](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout_Swift)  
   OC版本地址：[GitHub地址](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout)
     

## 更新日志
---
* `2.9.2`:问题修复: issue:#14 修复2.9.1版本在设置header悬浮后出现的崩溃问题。(感谢wangchunjiang提出该问题)        
- `2.9.1`:问题修复：issue #11 切换夜间模式的问题, myCacheAttr 可能会存在空, 导致视图背景被清空问题。         
- `2.9.0`:功能增加：扩展JJCollectionViewRoundFlowLayout 增加根据Section自定义对应Section内Cells的对齐方式设置。        
- `2.8.0`:功能增加：扩展JJCollectionViewRoundFlowLayout 支持自定义delegate 输入，并兼容像IGListCollectionView无delegate的情况。-- 感谢liao3841054的提交。     
- `2.7.1`:增加对不设置JJCollectionViewRoundConfigModel的处理。    
- `2.7.0`:功能增加：增加背景支持图片展示功能。    
- `2.6.0`:功能增加：增加背景点击动画，支持单独设置点按相关属性，支持点按后设置Cells是否跟随背景动画。    
- `2.5.1`:修复当cell大小不一时，首个Cell单独在首行显示时,底色判断出错问题。  
- `2.5.0`:增加支持Cell个数为0时，可以单独对Section的Header&Footer进行计算，支持全局设置和单独根据Section设置是否计算。  
- `2.4.0`:增加对背景图的点击事件处理和控制，通过代理返回点击的背景图的IndexPath。  
- `2.3.2`:增加对xib直接集成的支持，解决xib设置Layout后isRoundEnabled没有自动开启的问题。  
- `2.3.1`:解决对暗黑模式的支持问题  
- `2.3.0`:新增对Cell的对齐模式进行设置，支持（右对齐和首个Cell右侧开始）
- `2.2.0`:新增支持设置Cell对齐模式（右对齐）。
- `2.1.0`:新增支持设置Cell对齐模式（居中对齐）。
- `2.0.1`:  
增加对不规则Cell大小的计算方式支持，支持对不规则Cell计算实际背景视图大小，默认不开启计算，如使用不规则计算需手动开启isCalculateTypeOpenIrregularitiesCell字段。
- `2.0.0`：  
1、优化代码，对代码逻辑进行抽离，增加工具类等。  
2、新增支持设置Cell对齐模式（左对齐）。
- `1.1.0`：增加支持根据section单独判断是否计算对应headerview和footerview
- `1.0.1`：优化代码逻辑，增加根据支持根据不同section分别设置不同底色逻辑和demo    
- `1.0.0`：初始项目  
   1、collectionView section底色。  
   2、是否包含headerview。  
   3、是否包含footerview。  
   4、支持borderWidth、borderColor。  
   5、支持shadow投影。  
   6、支持collectionView，Vertical，Horizontal。  
   7、支持根据不同section分别设置不同底色显示。 


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* iOS 8.0


## Installation

JJCollectionViewRoundFlowLayout is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:  


```ruby
pod 'JJCollectionViewRoundFlowLayout'
```

## Overview

![](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout/blob/master/show_video.gif)

## Usage

### Import

``` obj-c
@import JJCollectionViewRoundFlowLayout;
```

### Enable

``` obj-c
//可选设置
@property (assign, nonatomic) BOOL isCalculateHeader; // 是否计算header
@property (assign, nonatomic) BOOL isCalculateFooter; // 是否计算footer
```

``` obj-c
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout borderEdgeInsertsForSectionAtIndex:(NSInteger)section; //设置底色偏移量(该设置只设置底色，与collectionview原sectioninsets区分）

- (JJCollectionViewRoundConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout configModelForSectionAtIndex:(NSInteger)section; //设置底色相关
```

### Example

``` obj-c

#pragma mark - JJCollectionViewDelegateRoundFlowLayout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout borderEdgeInsertsForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5.f, 12, 5, 12);
}

- (JJCollectionViewRoundConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout configModelForSectionAtIndex:(NSInteger)section{

    JJCollectionViewRoundConfigModel *model = [[JJCollectionViewRoundConfigModel alloc]init];
    model.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    model.cornerRadius = 10;
    return model;
    
}

```

### Setting  

>#
>### collectionView section底色
  
  
![](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout/blob/master/1.png)

``` obj-c
- (JJCollectionViewRoundConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout configModelForSectionAtIndex:(NSInteger)section{

    JJCollectionViewRoundConfigModel *model = [[JJCollectionViewRoundConfigModel alloc]init];
    model.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    model.cornerRadius = 10;
    
    return model;
}
```  


>#
>### 包含headerview、包含footerview
  
  
![](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout/blob/master/2.png)

``` obj-c

JJCollectionViewRoundFlowLayout *layout = [[JJCollectionViewRoundFlowLayout alloc]init];
layout.isCalculateHeader = YES;
layout.isCalculateFooter = YES;

- (JJCollectionViewRoundConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout configModelForSectionAtIndex:(NSInteger)section{

    JJCollectionViewRoundConfigModel *model = [[JJCollectionViewRoundConfigModel alloc]init];
    model.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    model.cornerRadius = 10;
    
    return model;
}
```  


>#
>### 支持collectionView，Vertical，Horizontal
  
  
![](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout/blob/master/3.png)


``` obj-c
//显示方向不需要进行另外设置，根据CollectionView设置好的方面，底色自动进行检测判断。

```  
  
>#
>### 支持shadow投影
  
![](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout/blob/master/4.png)

``` obj-c

- (JJCollectionViewRoundConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout configModelForSectionAtIndex:(NSInteger)section{
    
    JJCollectionViewRoundConfigModel *model = [[JJCollectionViewRoundConfigModel alloc]init];

    model.cornerRadius = 4;
    model.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    model.shadowColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:0.6];
    model.shadowOffset = CGSizeMake(0,0);
    model.shadowOpacity = 1;
    model.shadowRadius = 4;
    
    return model;
} 

```  


>#
>### 支持根据不同section分别设置不同底色显示
  
![](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout/blob/master/5.png)

``` obj-c

- (JJCollectionViewRoundConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout configModelForSectionAtIndex:(NSInteger)section{
    JJCollectionViewRoundConfigModel *model = [[JJCollectionViewRoundConfigModel alloc]init];
    
    model.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    model.cornerRadius = 10;
    
    if (section == 0) {
        model.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    }else if(section == 1){
        model.backgroundColor = [UIColor colorWithRed:100/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    }else{
        //...
    }
    
    return model;
}
```  

>#
>### 支持根据不同section分别单独设置是否计算对应Headerview和footerview
  
![](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout/blob/master/6.png)

``` obj-c

/// 根据section设置是否包含headerview（实现该方法后，isCalculateHeader将不会生效）
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section section description
- (BOOL)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout isCalculateHeaderViewIndex:(NSInteger)section{
    //这里简单设置了默认间隔一个就计算headerview，后续根据实际业务进行设置
    if (section %2 == 0) {
        return YES;
    }
    return NO;
}

/// 根据section设置是否包含footerview（实现该方法后，isCalculateFooter将不会生效）
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section section description
- (BOOL)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout isCalculateFooterViewIndex:(NSInteger)section{
    //这里简单设置了默认间隔一个就计算footerview，后续根据实际业务进行设置
    if (section %2 == 0) {
        return YES;
    }
    return NO;
}

```  

>#
>### 支持对Cell的对齐模式进行设置、可选是否填充底色(左对齐、居中、右对齐、右对齐并首个Cell右侧开始)
  
![](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout/blob/master/7.png)

``` obj-c

    JJCollectionViewRoundFlowLayout *layout = [[JJCollectionViewRoundFlowLayout alloc]init];
    layout.isRoundEnabled = NO; //设置是否填充底色
    
    layout.collectionCellAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByLeft; //设置对齐方式（左对齐）
    //layout.collectionCellAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByCenter; //设置对齐方式（居中）
    //layout.collectionCellAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByRight; //设置对齐方式（右对齐）
    //layout.collectionCellAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByRightAndStartR; //设置对齐方式（右对齐和首个Cell右侧开始）

```  
>#
>### 支持对Cell的对齐模式进行设置、可选是否填充底色(左对齐、居中)
  
![](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout/blob/master/8.png)

``` obj-c
- (JJCollectionViewRoundFlowLayoutAlignmentType)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout alignmentTypeAtSection:(NSInteger)section {
    if (section == 0) {
        return JJCollectionViewFlowLayoutAlignmentTypeByLeft;
    }else if(section == 1) {
        return JJCollectionViewFlowLayoutAlignmentTypeByCenter;
    }else if(section == 2){
        return JJCollectionViewFlowLayoutAlignmentTypeByRight;
    }else if(section == 3){
        return JJCollectionViewFlowLayoutAlignmentTypeByRightAndStartR;
    }else {
        return JJCollectionViewFlowLayoutAlignmentTypeBySystem;
    }
}

```  


>#
>### 增加对背景图的点击事件处理和控制，通过代理返回点击的背景图的IndexPath


![底部点击](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout/blob/master/BGTouch.gif)

``` obj-c

- (void)collectionView:(UICollectionView *)collectionView didSelectDecorationViewAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *message = [NSString stringWithFormat:@"section --- %ld \n row --- %ld",indexPath.section,indexPath.row];
}
```  
  
  
>#
>### 背景点击动画支持单独设置点按相关属性，支持点按后设置Cells是否跟随背景动画
![底部点击动画](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout/blob/master/BGAnimation.gif)

``` obj-c

-------------------------------------------------
/// 是否使用背景图点按动画（开启后背景底图点击会出现点按动画）
@property (nonatomic, assign) BOOL isDecorationViewTouchAnimationEnable;

-------------------------------------------------

/// 背景图点按动画设置开启代理
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section 背景图的indexPath
- (BOOL)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout  isDecorationViewShowAnimationAtIndex:(NSInteger)section {
    //这里可以单独根据indexPath设置是否有点按动画
    return YES;
}

/// 背景点按动画配置(若开启动画，不实现该代理，显示默认动画配置)
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section 配置section
- (JJCollectionViewTouchAnimationConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout animationConfigModelForSection:(NSInteger)section {
    JJCollectionViewTouchAnimationConfigModel *model = [JJCollectionViewTouchAnimationConfigModel createDefaultModel];
    if (section != 0 && section %2 == 0) {
        model.isCellsAnimationEnable = NO; //cells不跟随动画
        model.endDuration = 0.8;
    }
    return model;
}

```



## Author

kingjiajie, kingjiajie@sina.com 

## License

JJCollectionViewRoundFlowLayout is available under the MIT license. See the LICENSE file for more info.
