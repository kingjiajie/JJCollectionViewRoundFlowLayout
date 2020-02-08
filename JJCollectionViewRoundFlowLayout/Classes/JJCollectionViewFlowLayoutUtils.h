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


#pragma mark - 不规则Cell计算方案

/// 不规则cell找出top最高位置
/// @param section section description
/// @param numberOfItems numberOfItems description
/// @param defaultFrame defaultFrame description
+ (CGRect)calculateIrregularitiesCellByMinTopFrameWithLayout:(UICollectionViewFlowLayout *)layout
                                                     section:(NSInteger)section
                                               numberOfItems:(NSInteger)numberOfItems
                                                defaultFrame:(CGRect)defaultFrame;

/// 不规则cell找出bootom最低位置
/// @param layout layout description
/// @param section section description
/// @param numberOfItems numberOfItems description
/// @param defaultFrame defaultFrame description
+ (CGRect)calculateIrregularitiesCellByMaxBottomFrameWithLayout:(UICollectionViewFlowLayout *)layout
                                                        section:(NSInteger)section
                                                  numberOfItems:(NSInteger)numberOfItems
                                                   defaultFrame:(CGRect)defaultFrame;

@end

NS_ASSUME_NONNULL_END
