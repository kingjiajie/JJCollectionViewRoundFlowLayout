//
//  MyLabelCollectionViewCell.m
//  JJCollectionViewRoundFlowLayout_Example
//
//  Created by jiajie on 2020/1/11.
//  Copyright © 2020 谢家杰. All rights reserved.
//

#import "MyLabelCollectionViewCell.h"

@interface MyLabelCollectionViewCell ()

@property (strong, nonatomic,readwrite) UILabel *myLabel;

@end

@implementation MyLabelCollectionViewCell


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
        
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextColor:[UIColor whiteColor]];
        [label setFont:[UIFont systemFontOfSize:15.f]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:label];
        label;
    });
    
    [self initLayout];

    self.contentView.layer.cornerRadius = 15.f;
    [self.contentView setBackgroundColor:[UIColor colorWithRed:250/255.0 green:185/255.0 blue:105/255.0 alpha:1.0]];
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
                                     constant:5],

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
                                     constant:-5],

    ]];
}


@end
