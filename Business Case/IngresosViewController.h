//
//  IngresosViewController.h
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IngresosViewController : UIViewController
{
    NSInteger showview_Num;
    
    NSArray *data_nums1;
    NSArray *data_nums2;
    
    NSInteger val;
}

@property NSInteger i;
@property NSInteger j;

@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)backBtn_Clicked:(id)sender;
- (IBAction)addBtn_Clicked:(id)sender;
- (IBAction)delBtn_Clicked:(id)sender;
- (IBAction)homeBtn_Clicked:(id)sender;

- (IBAction)saveBtn_Clicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *view4;
@property (weak, nonatomic) IBOutlet UIView *view5;
@property (weak, nonatomic) IBOutlet UIView *view6;
@property (weak, nonatomic) IBOutlet UIView *view7;
@property (weak, nonatomic) IBOutlet UIView *view8;
@property (weak, nonatomic) IBOutlet UITextField *data1_1;
@property (weak, nonatomic) IBOutlet UITextField *data1_2;
@property (weak, nonatomic) IBOutlet UITextField *data2_1;
@property (weak, nonatomic) IBOutlet UITextField *data2_2;
@property (weak, nonatomic) IBOutlet UITextField *data3_1;
@property (weak, nonatomic) IBOutlet UITextField *data3_2;
@property (weak, nonatomic) IBOutlet UITextField *data4_1;
@property (weak, nonatomic) IBOutlet UITextField *data4_2;
@property (weak, nonatomic) IBOutlet UITextField *data5_1;
@property (weak, nonatomic) IBOutlet UITextField *data5_2;
@property (weak, nonatomic) IBOutlet UITextField *data6_1;
@property (weak, nonatomic) IBOutlet UITextField *data6_2;
@property (weak, nonatomic) IBOutlet UITextField *data7_1;
@property (weak, nonatomic) IBOutlet UITextField *data7_2;
@property (weak, nonatomic) IBOutlet UITextField *data8_1;
@property (weak, nonatomic) IBOutlet UITextField *data8_2;

@property (weak, nonatomic) IBOutlet UIView *toolView;

@property (nonatomic) BOOL isHelp;
@property (nonatomic, retain) NSString *descStr;
@property (weak, nonatomic) IBOutlet UIView *instantView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) NSString *titleText;

@property NSInteger parentIndex;

@end
