//
//  NewDialogController.h
//  Business Case
//
//  Created by LeeShengGe on 11/23/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewDialogController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *backgroundView;

@property (weak, nonatomic) IBOutlet UITextField *docName_New;
@property (weak, nonatomic) IBOutlet UIButton *ok_btn;
- (IBAction)creat_Clicked:(id)sender;
@end
