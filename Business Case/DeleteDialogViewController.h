//
//  DeleteDialogViewController.h
//  Business Case
//
//  Created by LeeShengGe on 11/25/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeleteDialogViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *Ok_btn;
@property (weak, nonatomic) IBOutlet UIButton *Cancel_Btn;
- (IBAction)okBtn_Clicked:(id)sender;
- (IBAction)cancelBtn_Clicked:(id)sender;

@end
