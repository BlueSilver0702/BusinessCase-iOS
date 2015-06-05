//
//  InstantViewController.h
//  Business Case
//
//  Created by LeeShengGe on 11/23/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstantViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *ok_btn;

- (IBAction)okBtn_Clicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *example_text;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *background_View;
@property (nonatomic, retain) NSString *descText;

@end
