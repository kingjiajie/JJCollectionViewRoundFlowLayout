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

@interface JJViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *myTableView;

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
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        switch (indexPath.row) {
            case 0:{
                cell.textLabel.text = @"CollectionView（包住section圆角）";
            }break;
            case 1:{
                cell.textLabel.text = @"有Header&Footer，包Header,不包Footer";
            }break;
            case 2:{
                cell.textLabel.text = @"有Header&Footer，包Header,包Footer";
            }break;
            case 3:{
                cell.textLabel.text = @"有Header&Footer，不包Header,包Footer";
            }break;
            case 4:{
                cell.textLabel.text = @"CollectionView（包住section圆角）(横向)";
            }break;
            case 5:{
                cell.textLabel.text = @"CollectionView (横向 有H&F View)";
            }break;
            case 6:{
                cell.textLabel.text = @"borderLine 包Section";
            }break;
            case 7:{
                cell.textLabel.text = @"borderLine 包Section（带投影）";
            }break;
            case 8:{
                cell.textLabel.text = @"BackgroundColor 底色（带投影）";
            }break;
            case 9:{
                cell.textLabel.text = @"CollectionView（底色 圆角 分别不同颜色）";
            }break;
                
            default:
                break;
        }
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
            
            
        default:
            break;
    }
    [self.navigationController pushViewController:VC animated:YES];
}


@end
