//
//  JJCollectionViewTouchAnimationConfigModel.h
//  JJCollectionViewRoundFlowLayout
//
//  Created by jiajie on 2021/3/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJCollectionViewTouchAnimationConfigModel : NSObject

/**
 transformScaleSx、transformScaleSy的值最大为1，缩放时数值不宜太小，基本0.95～0.99可以达到轻点缩放视觉效果。
 */
///TransformScale的sx属性（影响缩放大小，默认0.980）
@property (nonatomic, assign) CGFloat transformScaleSx;

///TransformScale的sy属性（影响缩放大小，默认0.980）
@property (nonatomic, assign) CGFloat transformScaleSy;

/// 点按动画时长,默认0.3
@property (nonatomic, assign) CGFloat startDuration;

/// 回弹动画时长，默认0.3
@property (nonatomic, assign) CGFloat endDuration;

/// Cells们是否也参与动画（如没有显示的Cell或者超出显示范围的Cell，collectionView系统不会显示，无法进行动画操作）
@property (nonatomic, assign) BOOL isCellsAnimationEnable;

/// 创建默认数值model
+ (instancetype)createDefaultModel;

@end

NS_ASSUME_NONNULL_END
