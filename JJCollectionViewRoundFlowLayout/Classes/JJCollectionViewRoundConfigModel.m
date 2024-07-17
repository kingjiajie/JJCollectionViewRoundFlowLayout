//
//  JJCollectionViewRoundConfigModel.m
//  JJCollectionViewRoundFlowLayout
//
//  Created by jiajie on 2020/1/9.
//

#import "JJCollectionViewRoundConfigModel.h"

@implementation JJCollectionViewRoundConfigModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        if (@available(iOS 11.0, *)) {
            self.maskedCorners = kCALayerMinXMinYCorner|kCALayerMaxXMinYCorner|kCALayerMinXMaxYCorner|kCALayerMaxXMaxYCorner;
        }
    }
    return self;
}

@end
