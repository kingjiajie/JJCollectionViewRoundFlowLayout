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
#import "JJCollectionViewTouchAnimationConfigModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol JJCollectionViewDelegateRoundFlowLayout <UICollectionViewDelegateFlowLayout>

@required


@optional

/// 设置底色参数
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section section description
- (JJCollectionViewRoundConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout configModelForSectionAtIndex:(NSInteger)section;

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

/// 当Cell个数为0时，是否允许进行计算（根据section判断是否单独计算，Cell个数为0时，会检测计算Header或Footer）
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section section description
- (BOOL)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout isCanCalculateWhenRowEmptyWithSection:(NSInteger)section;

/// 背景图点击事件
/// @param collectionView collectionView description
/// @param indexPath 点击背景图的indexPath
- (void)collectionView:(UICollectionView *)collectionView didSelectDecorationViewAtIndexPath:(NSIndexPath *)indexPath;

#pragma mark - 点按动画配置

/// 背景图点按动画设置开启代理
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section 背景图的indexPath
- (BOOL)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout  isDecorationViewShowAnimationAtIndex:(NSInteger)section;

/// 背景点按动画配置(若开启动画，不实现该代理，显示默认动画)
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section 配置section
- (JJCollectionViewTouchAnimationConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout animationConfigModelForSection:(NSInteger)section;

@end

@interface JJCollectionViewRoundFlowLayout : UICollectionViewFlowLayout

/// 外部可自定义delegate进行传入；（默认使用的是：collectionView.delegate）
/// ps：增加JJFlowLayout的可扩展性，兼容像IGListCollectionView无delegate的情况
@property (nonatomic, weak) id<JJCollectionViewDelegateRoundFlowLayout> delegate;

/// 设置cell对齐方式，不设置为使用系统默认，支持Left
@property (nonatomic, assign) JJCollectionViewRoundFlowLayoutAlignmentType collectionCellAlignmentType;

/// 是否开始Round计算，（默认YES），当该位置为NO时，计算模块都不开启，包括设置的代理
@property (nonatomic, assign) BOOL isRoundEnabled;

/// 是否计算header（若实现collectionView: layout: isCalculateHeaderViewIndex:）该字段不起作用
@property (nonatomic, assign) BOOL isCalculateHeader;

/// 是否计算footer（若实现collectionView: layout: isCalculateFooterViewIndex:）该字段不起作用
@property (nonatomic, assign) BOOL isCalculateFooter;

/// 是否使用不规则Cell大小的计算方式(若Cell的大小是相同固定大小，则无需开启该方法)，默认NO
@property (nonatomic, assign) BOOL isCalculateTypeOpenIrregularitiesCell;

/// 当Cell个数为0时，是否允许进行计算（开启后，Cell个数为0时，会检测计算Header或Footer）
/// 注意！！！是否计算Header或Footer，会根据设置的isCalculateHeader、isCalculateFooter和对应代理方法进行判断！！！请注意！！！
///（若实现collectionView:layout:isCanCalculateWhenRowEmptyWithSection:），isCanCalculateWhenRowEmpty该字段不起作用（由于该功能的特殊性，内部逻辑先检测代理方法，再检测设置字段）
/// 注意！！！！！！ 在使用该功能的时候，请自行检测和处理sectionInset的偏移量，Cell无数据时，有header&footer，设置了的sectionInset还是生效的，底色在计算时候会进行sectionInset相关的偏移处理。
@property (nonatomic, assign) BOOL isCanCalculateWhenRowEmpty;

/// 是否使用背景图点按动画（开启后背景底图点击会出现点按动画）
@property (nonatomic, assign) BOOL isDecorationViewTouchAnimationEnable;

@end


NS_ASSUME_NONNULL_END
