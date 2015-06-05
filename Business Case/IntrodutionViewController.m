//
//  IntrodutionViewController.m
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "IntrodutionViewController.h"
#import "ConfigManager.h"
#import "DBAdapter.h"
#import "Attributes.h"
#import "HelpViewController.h"
#import "InstantViewController.h"

@interface IntrodutionViewController ()

@end

@implementation IntrodutionViewController
@synthesize contents,scrollView;
NSInteger keyboard_Height;
NSInteger scroll_offset;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.saveBtn.layer.cornerRadius = 3;
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [scrollView setExclusiveTouch:YES];
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, scrollView.frame.size.height)];
    scroll_offset = 30;
    [self initView];
    
    if (self.isHelp) {
        CGRect oRect = self.scrollView.frame;
        self.scrollView.frame = CGRectMake(oRect.origin.x, oRect.origin.y-50, oRect.size.width, oRect.size.height+50);
        self.toolView.hidden = YES;
    }
    
    InstantViewController *instantController = [self. storyboard instantiateViewControllerWithIdentifier:@"instant_view"];
    instantController.descText = [[Attributes getHelp:2] objectAtIndex:0];
    
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

-(void)keyboardWillShow:(NSNotification *)notification{
    CGRect keyboardBounds;
    
    [[notification.userInfo valueForKey:UIKeyboardFrameBeginUserInfoKey]getValue:&keyboardBounds];
    keyboard_Height = keyboardBounds.size.height;
}

-(void)initView{
    contents.text = (NSString *)[ConfigManager getIntroduction];
}

#pragma mark UITextViewDelegate
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if ([text isEqualToString:@"\n"]) {
        CGPoint cursorPosition = [contents caretRectForPosition:contents.selectedTextRange.start].origin;
        NSInteger height = contents.frame.size.width;
        NSInteger y = cursorPosition.y;
        
        if (keyboard_Height+y > height+100) {
            if (height+50 > y) {
                scrollView.contentOffset = CGPointMake(0, scroll_offset);
                scroll_offset +=20;
                
                [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, scrollView.frame.size.height+scroll_offset)];
            }
            
        }
    }
    return YES;
}

- (IBAction)backBtn_Clicked:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveBtn_Clicked:(id)sender {
    [self saveConfig];
    [DBAdapter updateFileData:[DBAdapter getDbFilePath]];
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


-(void)saveConfig{
    NSString *introuduce = [contents.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

    [ConfigManager setIntroduction:introuduce];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self saveConfig];
}

- (IBAction)helpBtnClick:(id)sender {
    HelpViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"help_view"];
    menuView.helpText = [[Attributes getDescription:2] objectAtIndex:0];
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
