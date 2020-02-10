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
        UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 100, 100) style:UITableViewStylePlain];
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
                        @"CollectionView,无sections底色，cell左对齐",
                        @"CollectionView,有sections底色，cell左对齐",
                        @"CollectionView,无sections底色，cell居中",
                        nil];
        arr;
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _myCellTitleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.textLabel.text = _myCellTitleArr[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NextViewController *VC = [[NextViewController alloc]init];
    switch (indexPath.row) {
        case 0:{
            VC.isHaveHeaderFooterView = NO;
        }break;
        case 1:{
            VC.isHaveHeaderFooterView = YES;
            VC.isRoundWithHeaerView = YES;
        }break;
        case 2:{
            VC.isHaveHeaderFooterView = YES;
            VC.isRoundWithHeaerView = YES;
            VC.isRoundWithFooterView = YES;
        }break;
        case 3:{
            VC.isHaveHeaderFooterView = YES;
            VC.isRoundWithFooterView = YES;
        }break;
        case 4:{
            VC.isHaveHeaderFooterView = NO;
            VC.isHorizontal = YES;
        }break;
        case 5:{
            VC.isHaveHeaderFooterView = YES;
            VC.isRoundWithHeaerView = YES;
            VC.isRoundWithFooterView = YES;
            VC.isHorizontal = YES;
        }break;
        case 6:{
            SecondViewController *secondVC = [[SecondViewController alloc]init];
            secondVC.isHaveShadow = NO;
            [self.navigationController pushViewController:secondVC animated:YES];
            return;
        }break;
        case 7:{
            SecondViewController *secondVC = [[SecondViewController alloc]init];
            secondVC.isHaveShadow = YES;
            [self.navigationController pushViewController:secondVC animated:YES];
            return;
        }break;
        case 8:{
            SecondViewController *secondVC = [[SecondViewController alloc]init];
            secondVC.isHaveShadow = YES;
            secondVC.isHaveBGColor = YES;
            [self.navigationController pushViewController:secondVC animated:YES];
            return;
        }break;
        case 9:{
            VC.isHaveHeaderFooterView = NO;
            VC.isShowDifferentColor = YES;
        }break;
        case 10:{
            ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
            thirdVC.isHaveHeaderFooterView = YES;
            thirdVC.isRoundWithHeaerView = YES;
            [self.navigationController pushViewController:thirdVC animated:YES];
            return;
        }break;
        case 11:{
            ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
            thirdVC.isHaveHeaderFooterView = YES;
            thirdVC.isRoundWithFooterView = YES;
            [self.navigationController pushViewController:thirdVC animated:YES];
            return;
        }break;
        case 12:{
            FourthViewController *fourthVC = [[FourthViewController alloc]init];
            fourthVC.myAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByLeft;
            [self.navigationController pushViewController:fourthVC animated:YES];
            return;
        }break;
        case 13:{
            FourthViewController *fourthVC = [[FourthViewController alloc]init];
            fourthVC.isHaveRoundBGView = YES;
            fourthVC.myAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByLeft;
            [self.navigationController pushViewController:fourthVC animated:YES];
            return;
        }break;
        case 14:{
            FourthViewController *fourthVC = [[FourthViewController alloc]init];
            fourthVC.myAlignmentType = JJCollectionViewFlowLayoutAlignmentTypeByCenter;
            [self.navigationController pushViewController:fourthVC animated:YES];
            return;
        }break;
            
            
        default:
            break;
    }
    [self.navigationController pushViewController:VC animated:YES];
}


@end
