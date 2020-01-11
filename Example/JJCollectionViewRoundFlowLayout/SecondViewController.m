//
//  SecondViewController.m
//  JJCollectionViewRoundFlowLayout
//
//  Created by jiajie on 2019/10/30.
//  Copyright © 2019 谢家杰. All rights reserved.
//

#import "SecondViewController.h"
@import JJCollectionViewRoundFlowLayout;
#import "MyCollectionViewCell.h"
#import "MyCollectionReusableView.h"

@interface SecondViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,JJCollectionViewDelegateRoundFlowLayout>

@property (strong, nonatomic) UICollectionView *myCollectionView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initialization];
    [self initLayout];
}

- (void)initialization{
    _myCollectionView = ({
        JJCollectionViewRoundFlowLayout *layout = [[JJCollectionViewRoundFlowLayout alloc]init];
        
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 100, 100) collectionViewLayout:layout];
        [collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([MyCollectionViewCell class])];
        
        [collectionView registerClass:[MyCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([MyCollectionReusableView class])];
        
        [collectionView registerClass:[MyCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([MyCollectionReusableView class])];
        
        collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        [collectionView setBackgroundColor:[UIColor whiteColor]];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        
        [self.view addSubview:collectionView];
        
        collectionView;
    });
}

- (void)initLayout{
    
    UIView *view = _myCollectionView;
    
    UIView *superview = self.view;
    [superview addConstraints:@[

       //view constraints
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
                                     constant:0],

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

#pragma mark - <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 100);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MyCollectionViewCell  class]) forIndexPath:indexPath];
    cell.myLabel.text = @"测试内容";
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(20, 20, 20, 20);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5.f;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}

#pragma mark - JJCollectionViewDelegateRoundFlowLayout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout borderEdgeInsertsForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5.f, 12, 5, 12);
}

- (JJCollectionViewRoundConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout configModelForSectionAtIndex:(NSInteger)section{
    
    JJCollectionViewRoundConfigModel *model = [[JJCollectionViewRoundConfigModel alloc]init];

    model.cornerRadius = 4;
    
    if (self.isHaveShadow) {
        if (self.isHaveBGColor) {
            model.backgroundColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
            model.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        }else{
            model.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
            model.shadowColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:0.6];
        }
        model.shadowOffset = CGSizeMake(0,0);
        model.shadowOpacity = 1;
        model.shadowRadius = 4;
    }else{
        model.borderColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1];
        model.borderWidth = 1.0;
    }
    
    
    return model;
}

@end
