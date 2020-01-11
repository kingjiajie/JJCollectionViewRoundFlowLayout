//
//  FourthViewController.m
//  JJCollectionViewRoundFlowLayout_Example
//
//  Created by jiajie on 2020/1/11.
//  Copyright © 2020 谢家杰. All rights reserved.
//

#import "FourthViewController.h"
@import JJCollectionViewRoundFlowLayout;
#import "MyLabelCollectionViewCell.h"
#import "MyCollectionReusableView.h"

@interface FourthViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,JJCollectionViewDelegateRoundFlowLayout>

@property (strong, nonatomic) UICollectionView *myCollectionView;
@property (strong, nonatomic) NSMutableArray *myDataArr;

@end

@implementation FourthViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initialization];
    [self initLayout];
    [self initData];
}

- (void)initData{
    _myDataArr = ({
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
        [arr addObject:@"Hello"];
        [arr addObject:@"你好"];
        [arr addObject:@"您好啊。"];
        [arr addObject:@"大家好，这里是JJCollectionView"];
        [arr addObject:@"标签"];
        [arr addObject:@"对应不错的东西哦"];
        [arr addObject:@"GitHub"];
        [arr addObject:@"支持左对齐方式"];
        [arr addObject:@"这个东西就是很长，就想弄一个很长的出来"];
        [arr addObject:@"上面的文字好像不够长"];
        [arr addObject:@"想一下接下来做什么功能呢"];
        [arr addObject:@"嗯，知道了"];
        [arr addObject:@"优秀"];
        arr;
    });
}

- (void)initialization{
    _myCollectionView = ({
        JJCollectionViewRoundFlowLayout *layout = [[JJCollectionViewRoundFlowLayout alloc]init];
        
        
        if (self.isAlignmentLeft) {
            layout.collectionCellAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByLelt;
        }
        layout.isRoundEnabled = self.isHaveRoundBGView;
        
        
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 100, 100) collectionViewLayout:layout];
        [collectionView registerClass:[MyLabelCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([MyLabelCollectionViewCell class])];
        
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

/**
 计算整体尺寸
 */
+ (CGSize)calculateStringViewSizeWithShowSize:(CGSize)showSize fontSize:(UIFont *)fontSize string:(NSString *)string{
    //---- 计算高度 ---- //
    CGSize size = showSize;
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:fontSize,NSFontAttributeName, nil];
    CGSize cur = [string boundingRectWithSize:size
                                      options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                   attributes:dic
                                      context:nil].size;
    return cur;
}

#pragma mark - <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.myDataArr.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *string = self.myDataArr[indexPath.row];
    CGSize size = [FourthViewController calculateStringViewSizeWithShowSize:CGSizeMake(CGFLOAT_MAX, 38.f) fontSize:[UIFont systemFontOfSize:15.f] string:string];
    return CGSizeMake(size.width + 10 + 1, 30.f);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyLabelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MyLabelCollectionViewCell  class]) forIndexPath:indexPath];
    cell.myLabel.text = self.myDataArr[indexPath.row];
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
    
    model.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    model.cornerRadius = 10;
    return model;
}


@end
