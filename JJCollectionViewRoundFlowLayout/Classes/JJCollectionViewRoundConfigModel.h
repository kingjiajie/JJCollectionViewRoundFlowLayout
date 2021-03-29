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
@property (nonatomic, assign) CGFloat borderWidth;

/// 外圈line边显示颜色
@property (nonatomic, strong) UIColor *borderColor;

/// 背景颜色
@property (nonatomic, strong) UIColor *backgroundColor;

/// 投影相关参数
@property (nonatomic, strong) UIColor *shadowColor;
@property (nonatomic, assign) CGSize shadowOffset;
@property (nonatomic, assign) CGFloat shadowOpacity;
@property (nonatomic, assign) CGFloat shadowRadius;

/// 圆角
@property (nonatomic, assign) CGFloat cornerRadius;

@end

NS_ASSUME_NONNULL_END
