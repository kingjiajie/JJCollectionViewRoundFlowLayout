# JJCollectionViewRoundFlowLayout

[![CI Status](https://img.shields.io/travis/kingjiajie/JJCollectionViewRoundFlowLayout.svg?style=flat)](https://travis-ci.org/kingjiajie/JJCollectionViewRoundFlowLayout)
[![Version](https://img.shields.io/cocoapods/v/JJCollectionViewRoundFlowLayout.svg?style=flat)](https://cocoapods.org/pods/JJCollectionViewRoundFlowLayout)
[![License](https://img.shields.io/cocoapods/l/JJCollectionViewRoundFlowLayout.svg?style=flat)](https://cocoapods.org/pods/JJCollectionViewRoundFlowLayout)
[![Platform](https://img.shields.io/cocoapods/p/JJCollectionViewRoundFlowLayout.svg?style=flat)](https://cocoapods.org/pods/JJCollectionViewRoundFlowLayout)


   JJCollectionViewRoundFlowLayout可设置CollectionView的BackgroundColor，可跟据用户Cell个数计算背景图尺寸，可自定义是否包括计算CollectionViewHeaderView、CollectionViewFootererView或只计算Cells。设置简单，可自定义背景颜色偏移，设置显示方向（竖向、横向）显示,不同Section设置不同的背景颜色。
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
   
   Swift版本地址：[GitHub地址](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout_Swift)  
   OC版本地址：[GitHub地址](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout)
     

## 更新日志
---
* `2.4.0`:增加对背景图的点击事件处理和控制，通过代理返回点击的背景图的IndexPath。  
* `2.3.2`:增加对xib直接集成的支持，解决xib设置Layout后isRoundEnabled没有自动开启的问题。  
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
#### collectionView section底色
  
  
![](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout/blob/master/1.png)

``` obj-c
- (JJCollectionViewRoundConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout configModelForSectionAtIndex:(NSInteger)section{

    JJCollectionViewRoundConfigModel *model = [[JJCollectionViewRoundConfigModel alloc]init];
    model.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    model.cornerRadius = 10;
    
    return model;
}
```  


#### 包含headerview、包含footerview
  
  
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


#### 支持collectionView，Vertical，Horizontal
  
  
![](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout/blob/master/3.png)


``` obj-c
//显示方向不需要进行另外设置，根据CollectionView设置好的方面，底色自动进行检测判断。

```  
  
#### 支持shadow投影
  
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


#### 支持根据不同section分别设置不同底色显示
  
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

#### 支持根据不同section分别单独设置是否计算对应Headerview和footerview
  
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

#### 支持对Cell的对齐模式进行设置、可选是否填充底色(左对齐、居中)
  
![](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout/blob/master/7.png)

``` obj-c

    JJCollectionViewRoundFlowLayout *layout = [[JJCollectionViewRoundFlowLayout alloc]init];
    layout.isRoundEnabled = NO; //设置是否填充底色
    
    layout.collectionCellAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByLeft; //设置对齐方式（左对齐）
    //layout.collectionCellAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByCenter; //设置对齐方式（居中）
    //layout.collectionCellAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByRight; //设置对齐方式（右对齐）
    //layout.collectionCellAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByRightAndStartR; //设置对齐方式（右对齐和首个Cell右侧开始）

```  


#### 增加对背景图的点击事件处理和控制，通过代理返回点击的背景图的IndexPath


![底部点击](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout_Swift/blob/master/BGTouch.gif)

``` obj-c

- (void)collectionView:(UICollectionView *)collectionView didSelectDecorationViewAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *message = [NSString stringWithFormat:@"section --- %ld \n row --- %ld",indexPath.section,indexPath.row];
}
```

## Author

kingjiajie, kingjiajie@sina.com

## License

JJCollectionViewRoundFlowLayout is available under the MIT license. See the LICENSE file for more info.
