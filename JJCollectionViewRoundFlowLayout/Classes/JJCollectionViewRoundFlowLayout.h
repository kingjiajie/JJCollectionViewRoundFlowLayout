//
//  JJCollectionViewRoundFlowLayout.h
//  FuLaDuo
//
//  Created by jiajie on 2019/9/17.
//  Copyright © 2019 aihuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJCollectionViewRoundConfigModel.h"

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

/// 是否计算header（若实现collectionView: layout: isCalculateHeaderViewIndex:）该字段不起作用
@property (assign, nonatomic) BOOL isCalculateHeader;

/// 是否计算footer
@property (assign, nonatomic) BOOL isCalculateFooter;

@end


NS_ASSUME_NONNULL_END
