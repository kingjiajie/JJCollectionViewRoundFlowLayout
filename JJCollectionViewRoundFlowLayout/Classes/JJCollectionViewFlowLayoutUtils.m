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


@end
