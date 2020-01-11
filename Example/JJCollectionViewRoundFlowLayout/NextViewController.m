//
//  NextViewController.m
//  JJCollectionViewRoundFlowLayout
//
//  Created by jiajie on 2019/10/30.
//  Copyright © 2019 谢家杰. All rights reserved.
//

#import "NextViewController.h"
@import JJCollectionViewRoundFlowLayout;
#import "MyCollectionViewCell.h"
#import "MyCollectionReusableView.h"

@interface NextViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,JJCollectionViewDelegateRoundFlowLayout>

@property (strong, nonatomic) UICollectionView *myCollectionView;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initialization];
    [self initLayout];
}

- (void)initialization{
    _myCollectionView = ({
        JJCollectionViewRoundFlowLayout *layout = [[JJCollectionViewRoundFlowLayout alloc]init];
        layout.scrollDirection = self.isHorizontal ? UICollectionViewScrollDirectionHorizontal : UICollectionViewScrollDirectionVertical;
        layout.isCalculateHeader = self.isRoundWithHeaerView;
        layout.isCalculateFooter = self.isRoundWithFooterView;
        
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
//    return UIEdgeInsetsMake(0, 20, 20, 20);
}

- (JJCollectionViewRoundConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout configModelForSectionAtIndex:(NSInteger)section{
    JJCollectionViewRoundConfigModel *model = [[JJCollectionViewRoundConfigModel alloc]init];
    model.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    model.cornerRadius = 10;
    
    
    if (self.isShowDifferentColor) {
        if (section == 0) {
            model.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
        }else{
            model.backgroundColor = [UIColor colorWithRed:100/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
        }
    }
    
    return model;
}


#pragma mark - header&footer

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (self.isHaveHeaderFooterView) {
        return CGSizeMake(100, 60);
    }
    return CGSizeMake(0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (self.isHaveHeaderFooterView) {
        return CGSizeMake(100, 60);
    }
    return CGSizeMake(0, 0);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    MyCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([MyCollectionReusableView class]) forIndexPath:indexPath];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view.myLabel.text = @"Header";
        return view;
    }else{
        view.myLabel.text = @"Footer";
        return view;
    }
}

@end
