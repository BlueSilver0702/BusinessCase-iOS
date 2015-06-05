//
//  HelpViewController.m
//  Business Case
//
//  Created by User on 3/10/15.
//  Copyright (c) 2015 LeeShengGe. All rights reserved.
//

#import "HelpViewController.h"
#import "ConfigManager.h"
#import "DBAdapter.h"

@interface HelpViewController ()

@end

@implementation HelpViewController
@synthesize contents, scrollview;

NSInteger keyboard_Height;
NSInteger scroll_offset;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [self initView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initView{
    contents.text = self.helpText;
    if  (self.titleText != nil && ![self.titleText isEqualToString:@""])
        self.titleLabel.text = self.titleText;
//    if (selectedChildMenuNum == 0) {
//        NSString *title = [ConfigManager getTitle];
//        contents.text = title;
//    }
//    if (selectedChildMenuNum == 1) {
//        NSString *tema = [ConfigManager getTema];
//        contents.text = tema;
//    }
//    if (selectedChildMenuNum == 2) {
//        NSString *objective = [ConfigManager getObjective];
//        contents.text = objective;
//    }
}



-(void)keyboardWillShow:(NSNotification *)notification{
    CGRect keyboardBounds;
    
    [[notification.userInfo valueForKey:UIKeyboardFrameBeginUserInfoKey]getValue:&keyboardBounds];
    keyboard_Height = keyboardBounds.size.height;
}


- (IBAction)BackView:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    //    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)homeBtn_Clicked:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Confirm!" message:@"¿Estás seguro que deseas cerrar tu Business Case?" delegate:self cancelButtonTitle:@"No" otherButtonTitles: nil];
    [alert addButtonWithTitle:@"Si"];
    [alert show];
}

#pragma mark UIAlertViewDelegate
-(void) alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1 ) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
