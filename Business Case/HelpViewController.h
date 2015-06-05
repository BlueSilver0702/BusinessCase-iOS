//
//  HelpViewController.h
//  Business Case
//
//  Created by User on 3/10/15.
//  Copyright (c) 2015 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpViewController : UIViewController<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *contents;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

- (IBAction)BackView:(id)sender;
- (IBAction)homeBtn_Clicked:(id)sender;

@property (nonatomic, retain) NSString *helpText;
@property (nonatomic, retain) NSString *titleText;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
