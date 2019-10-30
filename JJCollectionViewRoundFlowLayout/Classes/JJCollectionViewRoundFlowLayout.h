//
//  JJCollectionViewRoundFlowLayout.h
//  FuLaDuo
//
//  Created by jiajie on 2019/9/17.
//  Copyright © 2019 aihuo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class JJCollectionViewRoundConfigModel;

@protocol JJCollectionViewDelegateRoundFlowLayout <UICollectionViewDelegateFlowLayout>

@required

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout borderEdgeInsertsForSectionAtIndex:(NSInteger)section;

- (JJCollectionViewRoundConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout configModelForSectionAtIndex:(NSInteger)section;

@end

@interface JJCollectionViewRoundFlowLayout : UICollectionViewFlowLayout

@property (assign, nonatomic) BOOL isCalculateHeader; // 是否计算header
@property (assign, nonatomic) BOOL isCalculateFooter; // 是否计算footer

@end

@interface JJCollectionViewRoundConfigModel : NSObject

@property (assign, nonatomic) CGFloat borderWidth;
@property (strong, nonatomic) UIColor *borderColor;

@property (strong, nonatomic) UIColor *backgroundColor;
@property (strong, nonatomic) UIColor *shadowColor;
@property (assign, nonatomic) CGSize shadowOffset;
@property (assign, nonatomic) CGFloat shadowOpacity;
@property (assign, nonatomic) CGFloat shadowRadius;
@property (assign, nonatomic) CGFloat cornerRadius;

@end

NS_ASSUME_NONNULL_END
