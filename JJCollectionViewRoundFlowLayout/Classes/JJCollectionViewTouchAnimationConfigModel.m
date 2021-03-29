//
//  JJCollectionViewTouchAnimationConfigModel.m
//  JJCollectionViewRoundFlowLayout
//
//  Created by jiajie on 2021/3/29.
//

#import "JJCollectionViewTouchAnimationConfigModel.h"

@implementation JJCollectionViewTouchAnimationConfigModel

+ (instancetype)createDefaultModel {
    return [[JJCollectionViewTouchAnimationConfigModel alloc]init];
};

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization {
    _transformScaleSx = 0.98;
    _transformScaleSy = 0.98;
    _startDuration = 0.2;
    _endDuration = 0.2;
    _isCellsAnimationEnable = YES;
}

@end
