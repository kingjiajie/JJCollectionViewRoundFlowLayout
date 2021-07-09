//
//  SQCollectionRoundFlowLayout.m
//  JJCollectionViewRoundFlowLayout
//
//  Created by liaoyp on 2021/7/8.
//

#import "SQCollectionRoundFlowLayout.h"
#import <IGListKit/IGListKit.h>

@implementation SQCollectionRoundFlowLayout

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [self initWithIGListAdapter:nil];
}

- (instancetype)initWithIGListAdapter:(IGListAdapter *)adapter {
    self = [super init];
    if (self) {
        _adapter = adapter;
    }
    return self;
}

- (id <JJCollectionViewDelegateRoundFlowLayout> )delegate {
    return self;
}

#pragma mark - JJCollectionViewDelegateRoundFlowLayout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout borderEdgeInsertsForSectionAtIndex:(NSInteger)section{
    
    IGListSectionController <JJCollectionViewDelegateRoundFlowLayout> *sectionController = [_adapter sectionControllerForObject:[_adapter objectAtSection:section]];
    if ([sectionController respondsToSelector:@selector(collectionView:layout:borderEdgeInsertsForSectionAtIndex:)]) {
        return [sectionController collectionView:collectionView layout: collectionViewLayout borderEdgeInsertsForSectionAtIndex:section];
    }
    return UIEdgeInsetsZero;
}

- (JJCollectionViewRoundConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout configModelForSectionAtIndex:(NSInteger)section{
    
    IGListSectionController <JJCollectionViewDelegateRoundFlowLayout> *sectionController = [_adapter sectionControllerForObject:[_adapter objectAtSection:section]];
    if ([sectionController respondsToSelector:@selector(collectionView:layout:configModelForSectionAtIndex:)]) {
        return [sectionController collectionView:collectionView layout:collectionViewLayout configModelForSectionAtIndex:section];
    }
    return nil;
    
}

/// 设置是否计算headerview（根据section判断是否单独计算）
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section section description
- (BOOL)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout isCalculateHeaderViewIndex:(NSInteger)section {
    
    IGListSectionController <JJCollectionViewDelegateRoundFlowLayout> *sectionController = [_adapter sectionControllerForObject:[_adapter objectAtSection:section]];
    if ([sectionController respondsToSelector:@selector(collectionView:layout:isCalculateHeaderViewIndex:)]) {
        return [sectionController collectionView:collectionView layout:collectionViewLayout isCalculateHeaderViewIndex:section];
    }
    return NO;
}

/// 设置是否计算footerview（根据section判断是否单独计算）
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section section description
- (BOOL)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout isCalculateFooterViewIndex:(NSInteger)section {
    
    IGListSectionController <JJCollectionViewDelegateRoundFlowLayout> *sectionController = [_adapter sectionControllerForObject:[_adapter objectAtSection:section]];
    if ([sectionController respondsToSelector:@selector(collectionView:layout:isCalculateFooterViewIndex:)]) {
        return [sectionController collectionView:collectionView layout:collectionViewLayout isCalculateFooterViewIndex:section];
    }
    return NO;
}

/// 当Cell个数为0时，是否允许进行计算（根据section判断是否单独计算，Cell个数为0时，会检测计算Header或Footer）
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section section description
- (BOOL)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout isCanCalculateWhenRowEmptyWithSection:(NSInteger)section {
    
    IGListSectionController <JJCollectionViewDelegateRoundFlowLayout> *sectionController = [_adapter sectionControllerForObject:[_adapter objectAtSection:section]];
    if ([sectionController respondsToSelector:@selector(collectionView:layout:isCanCalculateWhenRowEmptyWithSection:)]) {
        return [sectionController collectionView:collectionView layout:collectionViewLayout isCanCalculateWhenRowEmptyWithSection:section];
    }
    return NO;

}

/// 背景图点击事件
/// @param collectionView collectionView description
/// @param indexPath 点击背景图的indexPath
- (void)collectionView:(UICollectionView *)collectionView didSelectDecorationViewAtIndexPath:(NSIndexPath *)indexPath {
    
    IGListSectionController <JJCollectionViewDelegateRoundFlowLayout> *sectionController = [_adapter sectionControllerForObject:[_adapter objectAtSection:indexPath.section]];
    if ([sectionController respondsToSelector:@selector(collectionView:didSelectDecorationViewAtIndexPath:)]) {
        return [sectionController collectionView:collectionView didSelectDecorationViewAtIndexPath:indexPath];
    }
}

#pragma mark - 点按动画配置

/// 背景图点按动画设置开启代理
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section 背景图的indexPath
- (BOOL)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout  isDecorationViewShowAnimationAtIndex:(NSInteger)section {
    
    IGListSectionController <JJCollectionViewDelegateRoundFlowLayout> *sectionController = [_adapter sectionControllerForObject:[_adapter objectAtSection:section]];
    if ([sectionController respondsToSelector:@selector(collectionView:layout:isDecorationViewShowAnimationAtIndex:)]) {
        return [sectionController collectionView:collectionView layout:collectionViewLayout isDecorationViewShowAnimationAtIndex:section];
    }
    
    return NO;
    
    
}

/// 背景点按动画配置(若开启动画，不实现该代理，显示默认动画)
/// @param collectionView collectionView description
/// @param collectionViewLayout collectionViewLayout description
/// @param section 配置section
- (JJCollectionViewTouchAnimationConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout animationConfigModelForSection:(NSInteger)section {
    
    IGListSectionController <JJCollectionViewDelegateRoundFlowLayout> *sectionController = [_adapter sectionControllerForObject:[_adapter objectAtSection:section]];
    if ([sectionController respondsToSelector:@selector(collectionView:layout:animationConfigModelForSection:)]) {
        return [sectionController collectionView:collectionView layout:collectionViewLayout animationConfigModelForSection:section];
    }
    
    return nil;
}



@end
