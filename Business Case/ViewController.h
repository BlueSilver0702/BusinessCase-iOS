//
//  ViewController.h
//  Business Case
//
//  Created by LeeShengGe on 11/21/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpenDialogController.h"

@interface ViewController : UIViewController{
 
}

@property (weak, nonatomic) IBOutlet UIView *openDialog_View;
@property (weak, nonatomic) IBOutlet UIView *dialogNew_View;
@property (weak, nonatomic) IBOutlet UIView *instantView;
@property (weak, nonatomic) IBOutlet UIView *deleteDialog_View;

@property OpenDialogController *openViewController;

- (IBAction)open_Clicked:(id)sender;
- (IBAction)new_Clicked:(id)sender;
- (IBAction)instant_Clicked:(id)sender;
- (IBAction)train_Clicked:(id)sender;
- (IBAction)faq_Clicked:(id)sender;
@end
