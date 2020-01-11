//
//  MyCollectionReusableView.m
//  JJCollectionViewRoundFlowLayout
//
//  Created by jiajie on 2019/10/30.
//  Copyright © 2019 谢家杰. All rights reserved.
//

#import "MyCollectionReusableView.h"

@interface MyCollectionReusableView ()


@property (strong, nonatomic,readwrite) UILabel *myLabel;

@end

@implementation MyCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization{
    _myLabel = ({
        UILabel *label = [[UILabel alloc]init];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:label];
        
        label;
    });
    
    [self initLayout];
    
//    [self setBackgroundColor:[UIColor colorWithRed:250/255.0 green:185/255.0 blue:105/255.0 alpha:1.0]];
}


- (void)initLayout{
    
    UIView *view = _myLabel;
    
    UIView *superview = self;
    [superview addConstraints:@[

       //tableview constraints
       [NSLayoutConstraint constraintWithItem:view
                                    attribute:NSLayoutAttributeTop
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:superview
                                    attribute:NSLayoutAttributeTop
                                   multiplier:1.0
                                     constant:0],

       [NSLayoutConstraint constraintWithItem:view
                                    attribute:NSLayoutAttributeLeft
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:superview
                                    attribute:NSLayoutAttributeLeft
                                   multiplier:1.0
                                     constant:20.f],

       [NSLayoutConstraint constraintWithItem:view
                                    attribute:NSLayoutAttributeBottom
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:superview
                                    attribute:NSLayoutAttributeBottom
                                   multiplier:1.0
                                     constant:0],

       [NSLayoutConstraint constraintWithItem:view
                                    attribute:NSLayoutAttributeRight
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:superview
                                    attribute:NSLayoutAttributeRight
                                   multiplier:1
                                     constant:0],

    ]];
}

@end
