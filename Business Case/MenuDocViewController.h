//
//  MenuDocViewController.h
//  Business Case
//
//  Created by LeeShengGe on 11/23/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChildMenuListController.h"
#import "OpenDialogController.h"
#import "Confirm1ViewController.h"

@interface MenuDocViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *menuList;
    ChildMenuListController *childMenuController;
}

@property (weak, nonatomic) IBOutlet UILabel *menu_title;
@property (weak, nonatomic) IBOutlet UIView *openDocDialogView;
@property (weak, nonatomic) IBOutlet UIView *DialogView_NewDoc;
@property (weak, nonatomic) IBOutlet UIView *childMenuView;
@property (weak, nonatomic) IBOutlet UIView *toolView;
@property (weak, nonatomic) IBOutlet UITableView *parentMenu_List;
@property (weak, nonatomic) IBOutlet UIView *confirmDialogView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;

@property (nonatomic) BOOL isHelp;
@property (nonatomic) BOOL isDoc;

@property (nonatomic, retain) NSString *filename;

@property OpenDialogController *openViewController;
@property Confirm1ViewController *confirmViewController;

- (IBAction)backBtn_Clicked:(id)sender;
- (IBAction)homeBtn_Clicked:(id)sender;

- (IBAction)newDoc_btn:(id)sender;
- (IBAction)openDoc_btn:(id)sender;
- (IBAction)saveDoc_btn:(id)sender;
- (IBAction)wordDoc_btn:(id)sender;
- (IBAction)excelDoc_btn:(id)sender;
- (IBAction)heipDoc_btn:(id)sender;

-(void) confirmViewHidden;
-(void) loadingShow;
-(void) loadingHide;

@end
