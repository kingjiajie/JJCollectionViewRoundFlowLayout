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
   
   
   
   Swift版本地址：[GitHub地址](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout_Swift)
   
   OC版本地址：[GitHub地址](https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout)
     

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


## Author

kingjiajie, kingjiajie@sian.com

## License

JJCollectionViewRoundFlowLayout is available under the MIT license. See the LICENSE file for more info.
