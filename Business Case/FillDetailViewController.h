//
//  FillDetailViewController.h
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FillDetailViewController : UIViewController<UITextViewDelegate>
{
    NSInteger showView_num;
    NSArray *data_nums1;
    NSArray *data_nums2;
    
    NSInteger value;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)backBtn_Clicked:(id)sender;
- (IBAction)addBtn_Cliked:(id)sender;
- (IBAction)deleteBtn_Clicked:(id)sender;
- (IBAction)saveBtn_Clicke:(id)sender;
- (IBAction)homeBtn_Clicked:(id)sender;

@property NSInteger i;
@property NSInteger j;
@property NSInteger riesgos;

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *view4;

@property (weak, nonatomic) IBOutlet UITextView *data1_1;
@property (weak, nonatomic) IBOutlet UITextView *data1_2;
@property (weak, nonatomic) IBOutlet UITextView *data2_1;
@property (weak, nonatomic) IBOutlet UITextView *data2_2;
@property (weak, nonatomic) IBOutlet UITextView *data3_1;
@property (weak, nonatomic) IBOutlet UITextView *data3_2;
@property (weak, nonatomic) IBOutlet UITextView *data4_1;
@property (weak, nonatomic) IBOutlet UITextView *data4_2;

@property (weak, nonatomic) IBOutlet UIView *toolView;

@property (nonatomic) BOOL isHelp;
@property (nonatomic, retain) NSString *descStr;
@property NSInteger parentIndex;

@property (weak, nonatomic) IBOutlet UIView *instantView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) NSString *titleText;

@end
