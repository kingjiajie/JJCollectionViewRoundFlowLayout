//
//  JJCollectionViewRoundFlowLayout.h
//  FuLaDuo
//
//  Created by jiajie on 2019/9/17.
//  Copyright © 2019 谢家杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJCollectionViewRoundConfigModel.h"
#import "JJCollectionViewFlowLayoutConfig.h"

NS_ASSUME_NONNULL_BEGIN

@protocol JJCollectionViewDelegateRoundFlowLayout <UICollectionViewDelegateFlowLayout>

@required

/// 设置底色参数
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section section description
- (JJCollectionViewRoundConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout configModelForSectionAtIndex:(NSInteger)section;


@optional

/// 设置底色偏移点量（与collectionview的sectionInset用法相同，但是与sectionInset区分）
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section section description
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout borderEdgeInsertsForSectionAtIndex:(NSInteger)section;

/// 设置是否计算headerview（根据section判断是否单独计算）
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section section description
- (BOOL)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout isCalculateHeaderViewIndex:(NSInteger)section;

/// 设置是否计算footerview（根据section判断是否单独计算）
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section section description
- (BOOL)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout isCalculateFooterViewIndex:(NSInteger)section;

@end

@interface JJCollectionViewRoundFlowLayout : UICollectionViewFlowLayout

/// 设置cell对齐方式，不设置为使用系统默认，支持Left
@property (assign, nonatomic) JJCollectionViewRoundFlowLayoutAlignmentType collectionCellAlignmentType;

/// 是否开始Round计算，（默认YES），当该位置为NO时，计算模块都不开启，包括设置的代理
@property (assign, nonatomic) BOOL isRoundEnabled;

/// 是否计算header（若实现collectionView: layout: isCalculateHeaderViewIndex:）该字段不起作用
@property (assign, nonatomic) BOOL isCalculateHeader;

/// 是否计算footer
@property (assign, nonatomic) BOOL isCalculateFooter;

/// 是否使用不规则Cell大小的计算方式(若Cell的大小是相同固定大小，则无需开启该方法)，默认NO
@property (assign, nonatomic) BOOL isCalculateTypeOpenIrregularitiesCell;


@end


NS_ASSUME_NONNULL_END
