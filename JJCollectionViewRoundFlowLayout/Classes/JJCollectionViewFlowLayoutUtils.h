//
//  JJCollectionViewFlowLayoutUtils.h
//  JJCollectionViewRoundFlowLayout
//
//  Created by jiajie on 2020/1/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJCollectionViewFlowLayoutUtils : NSObject

/// 获取cell间距
/// @param sectionIndex sectionIndex description
+ (CGFloat)evaluatedMinimumInteritemSpacingForSectionWithCollectionLayout:(UICollectionViewFlowLayout *)layout atIndex:(NSInteger)sectionIndex;

/// 获取用户设置CollectionView 对应section的 sectionInset
/// @param index index description
+ (UIEdgeInsets)evaluatedSectionInsetForItemWithCollectionLayout:(UICollectionViewFlowLayout *)layout atIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
