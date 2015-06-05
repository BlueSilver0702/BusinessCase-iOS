//
//  BeneficiosFinanceController.h
//  Business Case
//
//  Created by LeeShengGe on 11/23/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeneficiosFinanceController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *titles;
}

@property NSInteger selectedTitle;

@property NSInteger rowSelectedNum;
@property NSInteger rowParentSelectedNum;
@property (weak, nonatomic) IBOutlet UITableView *beneficiosFinanceLists;

- (IBAction)back_Clicked:(id)sender;
- (IBAction)home_Clicked:(id)sender;
- (IBAction)help_Clicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *toolView;

@property (nonatomic) BOOL isHelp;
@property (nonatomic, retain) NSString *descStr;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) NSString *titleText;

@end
