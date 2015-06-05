//
//  ConclusionViewController.h
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConclusionViewController : UIViewController<UITextViewDelegate,UIAlertViewDelegate>

@property NSInteger selectedRow;

@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)backBtn_Clicked:(id)sender;
- (IBAction)homeBtn_Clicked:(id)sender;
- (IBAction)saveBtn_Clicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UITextView *data;
@property (weak, nonatomic) IBOutlet UIView *toolView;

@property (nonatomic) BOOL isHelp;
@property (nonatomic, retain) NSString *descStr;
@property (weak, nonatomic) IBOutlet UIView *instantView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) NSString *titleText;

@end
