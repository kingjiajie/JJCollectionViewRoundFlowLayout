//
//  JJCollectionViewRoundConfigModel.h
//  JJCollectionViewRoundFlowLayout
//
//  Created by jiajie on 2020/1/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJCollectionViewRoundConfigModel : NSObject

/// 外圈line边显示宽度
@property (assign, nonatomic) CGFloat borderWidth;

/// 外圈line边显示颜色
@property (strong, nonatomic) UIColor *borderColor;

/// 背景颜色
@property (strong, nonatomic) UIColor *backgroundColor;

/// 投影相关参数
@property (strong, nonatomic) UIColor *shadowColor;
@property (assign, nonatomic) CGSize shadowOffset;
@property (assign, nonatomic) CGFloat shadowOpacity;
@property (assign, nonatomic) CGFloat shadowRadius;

/// 圆角
@property (assign, nonatomic) CGFloat cornerRadius;

@end

NS_ASSUME_NONNULL_END
