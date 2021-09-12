//
//  JJCollectionViewRoundFlowLayout+Alignment.h
//  JJCollectionViewRoundFlowLayout
//
//  Created by jiajie on 2020/1/10.
//

#import <Foundation/Foundation.h>
#import "JJCollectionViewFlowLayoutConfig.h"
#import "JJCollectionViewRoundFlowLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface JJCollectionViewRoundFlowLayout (Alignment)

/// 将相同section的cell集合到一个集合中(竖向)
/// @param layoutAttributesAttrs layoutAttributesAttrs description
- (NSDictionary *)groupLayoutAttributesForElementsBySectionWithLayoutAttributesAttrs:(NSArray *)layoutAttributesAttrs;

/// 将相同y位置的cell集合到一个列表中(竖向)
/// @param layoutAttributesAttrs layoutAttributesAttrs description
- (NSArray *)groupLayoutAttributesForElementsByYLineWithLayoutAttributesAttrs:(NSArray *)layoutAttributesAttrs;


/// 将相同x位置的cell集合到一个列表中(横向)
/// @param layoutAttributesAttrs layoutAttributesAttrs description
- (NSArray *)groupLayoutAttributesForElementsByXLineWithLayoutAttributesAttrs:(NSArray *)layoutAttributesAttrs;

/// 进行cells集合对齐方式判断解析
/// @param layoutAttributesAttrs layoutAttributesAttrs description
/// @param toChangeAttributesAttrsList toChangeAttributesAttrsList description
/// @param alignmentType alignmentType description
- (void)analysisCellSettingFrameWithLayoutAttributesAttrs:(NSArray *)layoutAttributesAttrs
                                 toChangeAttributesAttrsList:(NSMutableArray *_Nonnull *_Nonnull)toChangeAttributesAttrsList
                                        cellAlignmentType:(JJCollectionViewRoundFlowLayoutAlignmentType)alignmentType;

/// 根据不同对齐方式进行Cell位置计算
/// @param layoutAttributesAttrs 传入需计算的AttributesAttrs集合列表
/// @param toChangeAttributesAttrsList 用来保存所有计算后的AttributesAttrs
/// @param alignmentType 对齐方式
- (NSMutableArray *)evaluatedAllCellSettingFrameWithLayoutAttributesAttrs:(NSArray *)layoutAttributesAttrs toChangeAttributesAttrsList:(NSMutableArray *_Nonnull *_Nonnull)toChangeAttributesAttrsList cellAlignmentType:(JJCollectionViewRoundFlowLayoutAlignmentType)alignmentType;


#pragma mark - alignment

/// 计算AttributesAttrs左对齐
/// @param layout JJCollectionViewRoundFlowLayout
/// @param layoutAttributesAttrs 需计算的AttributesAttrs列表
- (void)evaluatedCellSettingFrameByLeftWithWithJJCollectionLayout:(JJCollectionViewRoundFlowLayout *)layout layoutAttributesAttrs:(NSArray *)layoutAttributesAttrs;

/// 计算AttributesAttrs居中对齐
/// @param layout JJCollectionViewRoundFlowLayout
/// @param layoutAttributesAttrs 需计算的AttributesAttrs列表
- (void)evaluatedCellSettingFrameByCentertWithWithJJCollectionLayout:(JJCollectionViewRoundFlowLayout *)layout layoutAttributesAttrs:(NSArray *)layoutAttributesAttrs;

/// 计算AttributesAttrs右对齐
/// @param layout JJCollectionViewRoundFlowLayout
/// @param layoutAttributesAttrs 需计算的AttributesAttrs列表
- (void)evaluatedCellSettingFrameByRightWithWithJJCollectionLayout:(JJCollectionViewRoundFlowLayout *)layout layoutAttributesAttrs:(NSArray *)layoutAttributesAttrs;

@end


NS_ASSUME_NONNULL_END
