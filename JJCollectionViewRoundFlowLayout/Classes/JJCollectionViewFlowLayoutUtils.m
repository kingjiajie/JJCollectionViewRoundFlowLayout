//
//  JJCollectionViewFlowLayoutUtils.m
//  JJCollectionViewRoundFlowLayout
//
//  Created by jiajie on 2020/1/10.
//

#import "JJCollectionViewFlowLayoutUtils.h"

@class JJCollectionViewDelegateRoundFlowLayout;

@implementation JJCollectionViewFlowLayoutUtils

/// 获取cell间距
/// @param sectionIndex sectionIndex description
+ (CGFloat)evaluatedMinimumInteritemSpacingForSectionWithCollectionLayout:(UICollectionViewFlowLayout *)layout atIndex:(NSInteger)sectionIndex {
    CGFloat minimumInteritemSpacing = layout.minimumInteritemSpacing;
    if ([layout.collectionView.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
//        id<JJCollectionViewDelegateRoundFlowLayout> delegate = (id<JJCollectionViewDelegateRoundFlowLayout>)layout.collectionView.delegate;
        id delegate = layout.collectionView.delegate;
        minimumInteritemSpacing = [delegate collectionView:layout.collectionView layout:layout minimumInteritemSpacingForSectionAtIndex:sectionIndex];
    }
    return minimumInteritemSpacing;
}

/// 获取用户设置CollectionView 对应section的 sectionInset
/// @param index index description
+ (UIEdgeInsets)evaluatedSectionInsetForItemWithCollectionLayout:(UICollectionViewFlowLayout *)layout atIndex:(NSInteger)index{
    UIEdgeInsets sectionInset = layout.sectionInset;
    if ([layout.collectionView.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
//        id<JJCollectionViewDelegateRoundFlowLayout> delegate = (id<JJCollectionViewDelegateRoundFlowLayout>)layout.collectionView.delegate;
        id delegate = layout.collectionView.delegate;
        sectionInset = [delegate collectionView:layout.collectionView layout:layout insetForSectionAtIndex:index];
    }
    return sectionInset;
}


#pragma mark - 不规则Cell计算方案

/// 不规则cell找出top最高位置
/// @param section section description
/// @param numberOfItems numberOfItems description
/// @param defaultFrame defaultFrame description
+ (CGRect)calculateIrregularitiesCellByMinTopFrameWithLayout:(UICollectionViewFlowLayout *)layout section:(NSInteger)section numberOfItems:(NSInteger)numberOfItems defaultFrame:(CGRect)defaultFrame{
    CGRect firstFrame = defaultFrame;
    if (layout.scrollDirection == UICollectionViewScrollDirectionVertical) {
        //竖向
        CGFloat minY = CGRectGetMinY(firstFrame);
        for (NSInteger i = 0; i <= numberOfItems - 1; i ++ ) {
            UICollectionViewLayoutAttributes *attr = [layout layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:section]];
            minY = MIN(minY, CGRectGetMinY(attr.frame));
        }
        CGRect rect = firstFrame;
        firstFrame = CGRectMake(rect.origin.x, minY, rect.size.width, rect.size.height);
    }else{
        //横向
        CGFloat minX = CGRectGetMinX(firstFrame);
        for (NSInteger i = 0; i <= numberOfItems - 1; i ++ ) {
            UICollectionViewLayoutAttributes *attr = [layout layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:section]];
            minX = MIN(minX, CGRectGetMinX(attr.frame));
        }
        CGRect rect = firstFrame;
        firstFrame = CGRectMake(minX ,rect.origin.y, rect.size.width, rect.size.height);
    }
    return firstFrame;
}

/// 不规则cell找出bootom最低位置
/// @param layout layout description
/// @param section section description
/// @param numberOfItems numberOfItems description
/// @param defaultFrame defaultFrame description
+ (CGRect)calculateIrregularitiesCellByMaxBottomFrameWithLayout:(UICollectionViewFlowLayout *)layout section:(NSInteger)section numberOfItems:(NSInteger)numberOfItems defaultFrame:(CGRect)defaultFrame{
    CGRect lastFrame = defaultFrame;
    if (layout.scrollDirection == UICollectionViewScrollDirectionVertical) {
        //竖向
        CGFloat maxY = CGRectGetMinY(lastFrame);
        NSInteger index = numberOfItems-1;
        for (NSInteger i = 0; i <= numberOfItems - 1; i ++ ) {
            UICollectionViewLayoutAttributes *attr = [layout layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:section]];
            if (maxY < MAX(maxY, CGRectGetMaxY(attr.frame))) {
                maxY = MAX(maxY, CGRectGetMaxY(attr.frame));
                index = i;
            }
        }
        lastFrame = [layout layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:section]].frame;
    }else{
        //横向
        CGFloat maxX = CGRectGetMaxX(lastFrame);
        NSInteger index = numberOfItems-1;
        for (NSInteger i = 0; i <= numberOfItems - 1; i ++ ) {
            UICollectionViewLayoutAttributes *attr = [layout layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:section]];
            if (maxX < MAX(maxX, CGRectGetMaxX(attr.frame))) {
                maxX = MAX(maxX, CGRectGetMaxX(attr.frame));
                index = i;
            }
        }
        lastFrame = [layout layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:section]].frame;
    }
    return lastFrame;
}

@end
