//
//  JJViewController.m
//  JJCollectionViewRoundFlowLayout
//
//  Created by 谢家杰 on 10/30/2019.
//  Copyright (c) 2019 谢家杰. All rights reserved.
//

#import "JJViewController.h"
#import "NextViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthlyViewController.h"
#import "SixthViewController.h"

typedef NS_OPTIONS(NSInteger, JJViewSectionType) {
    JJViewSectionTypeByRoundDemo = 0,
    JJViewSectionTypeByAlignmentDemo,
    JJViewSectionTypeByEventDemo,
    JJViewSectionTypeByAllSection
};

typedef NS_OPTIONS(NSInteger, JJViewSectionTypeByRoundRowType) {
    JJViewSectionTypeByRoundRowTypeBaseRound = 0,
    JJViewSectionTypeByRoundRowTypeBaseRoundWithHeader,
    JJViewSectionTypeByRoundRowTypeBaseRoundWithHF,
    JJViewSectionTypeByRoundRowTypeBaseRoundWithFooter,
    JJViewSectionTypeByRoundRowTypeHorizontalRound,
    JJViewSectionTypeByRoundRowTypeHorizontalRoundWithHF,
    JJViewSectionTypeByRoundRowTypeBorderLine,
    JJViewSectionTypeByRoundRowTypeBorderLineWithShadow,
    JJViewSectionTypeByRoundRowTypeBackgroundColorWithShadow,
    JJViewSectionTypeByRoundRowTypeRoundWithDifferentColor,
    JJViewSectionTypeByRoundRowTypeRoundAccordingToHeader,
    JJViewSectionTypeByRoundRowTypeRoundAccordingToFooter,
    JJViewSectionTypeByRoundRowTypeWhenCellIsEmpty,
    JJViewSectionTypeByRoundRowTypeAllRow
};

typedef NS_OPTIONS(NSInteger, JJViewSectionTypeByAlignmentRowType) {
    JJViewSectionTypeByAlignmentRowTypeByLeft = 0,
    JJViewSectionTypeByAlignmentRowTypeByLeftAndHaveRound,
    JJViewSectionTypeByAlignmentRowTypeByCenter,
    JJViewSectionTypeByAlignmentRowTypeByRight,
    JJViewSectionTypeByAlignmentRowTypeByRightAndStartR,
    JJViewSectionTypeByAlignmentRowTypeByAllRow
};

typedef NS_OPTIONS(NSInteger, JJViewSectionTypeByEventRowType) {
    JJViewSectionTypeByEventRowTypeByBackViewTouch = 0,
    JJViewSectionTypeByEventRowTypeByAllRow
};

@interface JJViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *myTableView;
@property (strong, nonatomic) NSArray *myCellTitleArr;

@end

@implementation JJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initialization];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialization{
    _myTableView = ({
        UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 100, 100) style:UITableViewStyleGrouped];
        tableview.delegate = self;
        tableview.dataSource = self;
        
        tableview.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.view addSubview:tableview];
        
        UIView *superview = self.view;
        [superview addConstraints:@[

           //tableview constraints
           [NSLayoutConstraint constraintWithItem:tableview
                                        attribute:NSLayoutAttributeTop
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:superview
                                        attribute:NSLayoutAttributeTop
                                       multiplier:1.0
                                         constant:0],

           [NSLayoutConstraint constraintWithItem:tableview
                                        attribute:NSLayoutAttributeLeft
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:superview
                                        attribute:NSLayoutAttributeLeft
                                       multiplier:1.0
                                         constant:0],

           [NSLayoutConstraint constraintWithItem:tableview
                                        attribute:NSLayoutAttributeBottom
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:superview
                                        attribute:NSLayoutAttributeBottom
                                       multiplier:1.0
                                         constant:0],

           [NSLayoutConstraint constraintWithItem:tableview
                                        attribute:NSLayoutAttributeRight
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:superview
                                        attribute:NSLayoutAttributeRight
                                       multiplier:1
                                         constant:0],

        ]];
        
        tableview.tableFooterView = [[UIView alloc]init];
        
        tableview;
    });
    
    _myCellTitleArr = ({
        NSArray *arr = [NSArray arrayWithObjects:
                        @"CollectionView（包住section圆角）",
                        @"有Header&Footer，包Header,不包Footer",
                        @"有Header&Footer，包Header,包Footer",
                        @"有Header&Footer，不包Header,包Footer",
                        @"CollectionView（包住section圆角）(横向)",
                        @"CollectionView (横向 有H&F View)",
                        @"borderLine 包Section",
                        @"borderLine 包Section（带投影）",
                        @"BackgroundColor 底色（带投影）",
                        @"CollectionView（底色 圆角 分别不同颜色）",
                        @"CollectionView（单独设置某个 header 底色）",
                        @"CollectionView（单独设置某个 footer 底色）",
                        @"有H&F，Cell为0，判断是否计算H&F",
                        
#pragma mark - alignment
                        @"CollectionView,无sections底色，cell左对齐",
                        @"CollectionView,有sections底色，cell左对齐",
                        @"CollectionView,无sections底色，cell居中",
                        @"CollectionView,无sections底色，cell右对齐",
                        @"CollectionView,cell右对齐与cell右侧开始",
                        
#pragma mark - touch
                        @"CollectionView,背景图点击事件响应",
                        nil];
        arr;
    });
}

#pragma mark - delegate , dataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch(section) {
        case JJViewSectionTypeByRoundDemo :         return @"CollectionView Section底色设置";        break;
        case JJViewSectionTypeByAlignmentDemo:      return @"CollectionView Cell对齐方式";           break;
        case JJViewSectionTypeByEventDemo:          return @"CollectionView DecorationView点击响应"; break;
    }
    return @"";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return JJViewSectionTypeByAllSection;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case JJViewSectionTypeByRoundDemo:      return JJViewSectionTypeByRoundRowTypeAllRow;       break;
        case JJViewSectionTypeByAlignmentDemo:  return JJViewSectionTypeByAlignmentRowTypeByAllRow; break;
        case JJViewSectionTypeByEventDemo:      return JJViewSectionTypeByEventRowTypeByAllRow;     break;
        default:                                return 0;                                           break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    switch (indexPath.section) {
        case JJViewSectionTypeByRoundDemo: {
            cell.textLabel.text = _myCellTitleArr[indexPath.row];
        } break;
        case JJViewSectionTypeByAlignmentDemo: {
            cell.textLabel.text = _myCellTitleArr[JJViewSectionTypeByRoundRowTypeAllRow + indexPath.row];
        } break;
        case JJViewSectionTypeByEventDemo: {
            cell.textLabel.text = _myCellTitleArr[JJViewSectionTypeByRoundRowTypeAllRow + JJViewSectionTypeByAlignmentRowTypeByAllRow + indexPath.row];
        } break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case JJViewSectionTypeByRoundDemo: {
            NextViewController *VC = [[NextViewController alloc]init];
            switch(indexPath.row) {
                case JJViewSectionTypeByRoundRowTypeBaseRound : {
                    //CollectionView（包住section圆角）
                    VC.isHaveHeaderFooterView = NO;
                    break;
                }
                case JJViewSectionTypeByRoundRowTypeBaseRoundWithHeader: {
                    //有Header&Footer，包Header,不包Footer
                    VC.isHaveHeaderFooterView = YES;
                    VC.isRoundWithHeaerView = YES;
                    break;
                }
                case JJViewSectionTypeByRoundRowTypeBaseRoundWithHF: {
                    //有Header&Footer，包Header,包Footer
                    VC.isHaveHeaderFooterView = YES;
                    VC.isRoundWithHeaerView = YES;
                    VC.isRoundWithFooterView = YES;
                    break;
                }
                case JJViewSectionTypeByRoundRowTypeBaseRoundWithFooter: {
                    //有Header&Footer，不包Header,包Footer
                    VC.isHaveHeaderFooterView = YES;
                    VC.isRoundWithFooterView = YES;
                    break;
                }
                case JJViewSectionTypeByRoundRowTypeHorizontalRound: {
                    //CollectionView（包住section圆角）(横向)
                    VC.isHaveHeaderFooterView = NO;
                    VC.isHorizontal = YES;
                    break;
                }
                case JJViewSectionTypeByRoundRowTypeHorizontalRoundWithHF: {
                    //CollectionView (横向 有H&F View)
                    VC.isHaveHeaderFooterView = YES;
                    VC.isRoundWithHeaerView = YES;
                    VC.isRoundWithFooterView = YES;
                    VC.isHorizontal = YES;
                    break;
                }
                case JJViewSectionTypeByRoundRowTypeBorderLine: {
                    //borderLine 包Section
                    SecondViewController *secondVC = [[SecondViewController alloc]init];
                    secondVC.isHaveShadow = NO;
                    [self.navigationController pushViewController:secondVC animated:YES];
                    return;
                    break;
                }
                case JJViewSectionTypeByRoundRowTypeBorderLineWithShadow: {
                    //borderLine 包Section（带投影）
                    SecondViewController *secondVC = [[SecondViewController alloc]init];
                    secondVC.isHaveShadow = YES;
                    [self.navigationController pushViewController:secondVC animated:YES];
                    return;
                    break;
                }
                case JJViewSectionTypeByRoundRowTypeBackgroundColorWithShadow: {
                    //BackgroundColor 底色（带投影）
                    SecondViewController *secondVC = [[SecondViewController alloc]init];
                    secondVC.isHaveShadow = YES;
                    secondVC.isHaveBGColor = YES;
                    [self.navigationController pushViewController:secondVC animated:YES];
                    return;
                    break;
                }
                case JJViewSectionTypeByRoundRowTypeRoundWithDifferentColor: {
                    //CollectionView（底色 圆角 分别不同颜色）
                    VC.isHaveHeaderFooterView = NO;
                    VC.isShowDifferentColor = YES;
                    break;
                }
                case JJViewSectionTypeByRoundRowTypeRoundAccordingToHeader: {
                    //CollectionView（单独设置某个 header 底色）
                    ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
                    thirdVC.isHaveHeaderFooterView = YES;
                    thirdVC.isRoundWithHeaerView = YES;
                    [self.navigationController pushViewController:thirdVC animated:YES];
                    return;
                    break;
                }
                case JJViewSectionTypeByRoundRowTypeRoundAccordingToFooter: {
                    //CollectionView（单独设置某个 footer 底色）
                    ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
                    thirdVC.isHaveHeaderFooterView = YES;
                    thirdVC.isRoundWithFooterView = YES;
                    [self.navigationController pushViewController:thirdVC animated:YES];
                    return;
                    break;
                }
                case JJViewSectionTypeByRoundRowTypeWhenCellIsEmpty:{
                    SixthViewController *vc = [[SixthViewController alloc]init];
                    vc.isHaveHeaderFooterView = YES;
                    vc.isRoundWithHeaerView = YES;
                    vc.isRoundWithFooterView = YES;
                    [self.navigationController pushViewController:vc animated:YES];
                    return;
                    break;
                }
            }
            [self.navigationController pushViewController:VC animated:YES];
        } break;
        case JJViewSectionTypeByAlignmentDemo: {
            FourthViewController *fourthVC = [[FourthViewController alloc]init];
            
            switch(indexPath.row) {
                case JJViewSectionTypeByAlignmentRowTypeByLeft : {
                    //CollectionView,无sections底色，cell左对齐
                    fourthVC.myAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByLeft;
                }break;
                case JJViewSectionTypeByAlignmentRowTypeByLeftAndHaveRound : {
                    //CollectionView,有sections底色，cell左对齐
                    fourthVC.isHaveRoundBGView = YES;
                    fourthVC.myAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByLeft;
                }break;
                case JJViewSectionTypeByAlignmentRowTypeByCenter: {
                    //CollectionView,无sections底色，cell居中
                    fourthVC.myAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByCenter;
                }
                    break;
                case JJViewSectionTypeByAlignmentRowTypeByRight: {
                    //CollectionView,无sections底色，cell右对齐
                    fourthVC.myAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByRight;
                }
                    break;
                case JJViewSectionTypeByAlignmentRowTypeByRightAndStartR: {
                    //CollectionView,cell右对齐与cell右侧开始
                    fourthVC.myAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByRightAndStartR;
                }break;
            }
            [self.navigationController pushViewController:fourthVC animated:YES];
        } break;
        case JJViewSectionTypeByEventDemo: {
            switch (indexPath.row) {
                case JJViewSectionTypeByEventRowTypeByBackViewTouch:{
                    //CollectionView,背景图点击事件响应
                    FifthlyViewController *fifthlyVC = [[FifthlyViewController alloc]init];
                    [self.navigationController pushViewController:fifthlyVC animated:YES];
                }break;
                    
                default:
                    break;
            }
        } break;
        default:
            break;
    }
}


@end
