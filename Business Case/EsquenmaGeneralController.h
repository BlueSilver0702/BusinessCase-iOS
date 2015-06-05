//
//  EsquenmaGeneralController.h
//  Business Case
//
//  Created by LeeShengGe on 11/23/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EsquenmaGeneralController : UIViewController<UITextViewDelegate,UIAlertViewDelegate>

@property NSInteger selectedChildMenuNum;

@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UITextView *contents;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

- (IBAction)BackView:(id)sender;
- (IBAction)saveBtn_Clicked:(id)sender;
- (IBAction)homeBtn_Clicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *toolView;

@property (nonatomic) BOOL isHelp;
@property (nonatomic, retain) NSString *descStr;
@property (weak, nonatomic) IBOutlet UIView *instantView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) NSString *titleText;

@end
