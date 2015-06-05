//
//
//  Business Case
//
//  Created by LeeShengGe on 11/23/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "EsquenmaGeneralController.h"
#import "ConfigManager.h"
#import "DBAdapter.h"
#import "Attributes.h"
#import "HelpViewController.h"
#import "InstantViewController.h"

@interface EsquenmaGeneralController ()

@end

@implementation EsquenmaGeneralController
@synthesize selectedChildMenuNum;
@synthesize contents, scrollview;

NSInteger keyboard_Height;
NSInteger scroll_offset;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.saveBtn.layer.cornerRadius = 3;
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [scrollview setExclusiveTouch:YES];
    [scrollview setContentSize:CGSizeMake(scrollview.frame.size.width, scrollview.frame.size.height)];
    scroll_offset = 30;
    
    [self initView];
    
    if (self.isHelp) {
        CGRect oRect = self.scrollview.frame;
        self.scrollview.frame = CGRectMake(oRect.origin.x, oRect.origin.y-50, oRect.size.width, oRect.size.height+50);
        self.toolView.hidden = YES;
    }
    
    InstantViewController *instantController = [self. storyboard instantiateViewControllerWithIdentifier:@"instant_view"];
    instantController.descText = [[Attributes getHelp:0] objectAtIndex:selectedChildMenuNum];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(instantViewHidden)];
    [instantController.background_View addGestureRecognizer:tap];
    
    self.instantView.hidden = YES;
    [self addChildViewController:instantController];
    [self.instantView addSubview:instantController.view];
    
    self.titleLabel.text = self.titleText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initView{
    if (selectedChildMenuNum == 0) {
       NSString *title = [ConfigManager getTitle];
        contents.text = title;
    }
    if (selectedChildMenuNum == 1) {
        NSString *tema = [ConfigManager getTema];
        contents.text = tema;
    }
    if (selectedChildMenuNum == 2) {
        NSString *objective = [ConfigManager getObjective];
        contents.text = objective;
    }
}



-(void)keyboardWillShow:(NSNotification *)notification{
    CGRect keyboardBounds;
    
    [[notification.userInfo valueForKey:UIKeyboardFrameBeginUserInfoKey]getValue:&keyboardBounds];
    keyboard_Height = keyboardBounds.size.height;
}

#pragma mark UITextViewDelegate
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
 
    if ([text isEqualToString:@"\n"]) {
        CGPoint cursorPosition = [contents caretRectForPosition:contents.selectedTextRange.start].origin;
        NSInteger height = contents.frame.size.width;
        NSInteger y = cursorPosition.y;
 
        if (keyboard_Height+y > height+100) {
            if (height+50 > y) {
                scrollview.contentOffset = CGPointMake(0, scroll_offset);
                scroll_offset +=20;
           
                [scrollview setContentSize:CGSizeMake(scrollview.frame.size.width, scrollview.frame.size.height+scroll_offset)];
            }
            
        }
    }
    return YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    NSString *save_txt = contents.text;
    
    if (selectedChildMenuNum == 0) {
        [ConfigManager setTitle:save_txt];
    }
    
    if (selectedChildMenuNum == 1 ) {
        [ConfigManager setTema:save_txt];
    }
    
    if (selectedChildMenuNum == 2) {
        [ConfigManager setObjective:save_txt];
    }
}



- (IBAction)BackView:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveBtn_Clicked:(id)sender {
    NSString *save_txt = contents.text;
    
    if (selectedChildMenuNum == 0) {
        [ConfigManager setTitle:save_txt];
    }
    
    if (selectedChildMenuNum == 1 ) {
        [ConfigManager setTema:save_txt];
    }
    
    if (selectedChildMenuNum == 2) {
        [ConfigManager setObjective:save_txt];
    }
    
    //updateRow
    [DBAdapter updateFileData : [DBAdapter getDbFilePath]];
    
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

- (IBAction)helpBtnClick:(id)sender {
    HelpViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"help_view"];
    menuView.helpText = [[Attributes getDescription:0] objectAtIndex:self.selectedChildMenuNum];
    menuView.titleText = self.titleText;
    [self.navigationController pushViewController: menuView animated:YES];
}

- (IBAction)detailBtnClick:(id)sender {
    self.instantView.hidden = NO;
    
    self.instantView.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^
     {
         self.instantView.alpha = 1;
     }
                     completion:nil];
}

- (void) instantViewHidden{
    self.instantView.hidden = YES;
}

@end
