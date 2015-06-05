//
//  AlcancesCheckedElementsViewController.h
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlcancesCheckedElementsViewController : UIViewController
{
    NSMutableArray *views;
}
@property NSMutableDictionary *showviewLists;

@property (weak, nonatomic) IBOutlet UIButton *savebtn;
- (IBAction)backBtn_Clicked:(id)sender;
- (IBAction)saveBtn_Clicked:(id)sender;
- (IBAction)homeBtn_Clicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *view4;
@property (weak, nonatomic) IBOutlet UIView *view5;
@property (weak, nonatomic) IBOutlet UIView *view6;
@property (weak, nonatomic) IBOutlet UIView *view7;
@property (weak, nonatomic) IBOutlet UIView *view8;
@property (weak, nonatomic) IBOutlet UIView *view9;
@property (weak, nonatomic) IBOutlet UIView *view10;
@property (weak, nonatomic) IBOutlet UIView *view11;
@property (weak, nonatomic) IBOutlet UIView *view12;
@property (weak, nonatomic) IBOutlet UIView *view13;

@property (weak, nonatomic) IBOutlet UITextView *data1;
@property (weak, nonatomic) IBOutlet UITextView *data2;
@property (weak, nonatomic) IBOutlet UITextView *data3;
@property (weak, nonatomic) IBOutlet UITextView *data4;
@property (weak, nonatomic) IBOutlet UITextView *data5;
@property (weak, nonatomic) IBOutlet UITextView *data6;
@property (weak, nonatomic) IBOutlet UITextView *data7;
@property (weak, nonatomic) IBOutlet UITextView *data8;
@property (weak, nonatomic) IBOutlet UITextView *data9;
@property (weak, nonatomic) IBOutlet UITextView *data10;
@property (weak, nonatomic) IBOutlet UITextView *data11;
@property (weak, nonatomic) IBOutlet UITextView *data12;
@property (weak, nonatomic) IBOutlet UITextView *data13;

@property (weak, nonatomic) IBOutlet UIView *toolView;

@property (nonatomic) BOOL isHelp;
@property (nonatomic, retain) NSString *descStr;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) NSString *titleText;

@end
