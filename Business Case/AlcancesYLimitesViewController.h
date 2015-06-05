//
//  AlcancesYLimitesViewController.h
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlcancesYLimitesViewController : UIViewController<UITableViewDataSource
,  UITableViewDelegate>
{
    NSArray *lists;
    BOOL checkBtn_cliked;
    NSMutableDictionary *selectedRows;
}


@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)backBtn_Clicked:(id)sender;
- (IBAction)nextBtn_Clicked:(id)sender;
- (IBAction)homeBtn_Clicked:(id)sender;
- (IBAction)checkBtn_Clicked:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIView *toolView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) BOOL isHelp;
@property (nonatomic, retain) NSString *descStr;
@property (weak, nonatomic) IBOutlet UIView *instantView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) NSString *titleText;

@end
