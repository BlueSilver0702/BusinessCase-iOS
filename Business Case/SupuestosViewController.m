//
//  SupuestosViewController.m
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "SupuestosViewController.h"
#import "ConfigManager.h"
#import "DBAdapter.h"
#import "Attributes.h"
#import "HelpViewController.h"
#import "InstantViewController.h"

@interface SupuestosViewController ()

@end

@implementation SupuestosViewController

@synthesize data1_1, data1_2, data2_1, data2_2, data3_1, data3_2,data4_1, data4_2;
@synthesize view1, view2, view3, view4;
@synthesize scrollview;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.saveBtn.layer.cornerRadius = 3;
    // Do any additional setup after loading the view.
    [scrollview setContentSize:CGSizeMake(scrollview.frame.size.width, 1000)];
    
    showView_num = 0;
    data_nums1 = [[NSArray alloc]init];
    data_nums2 = [[NSArray alloc]init];
    [self setRoundTextView];
    [self showViews];
    [self setValue];
    
    if (self.isHelp) {
        CGRect oRect = self.scrollview.frame;
        self.scrollview.frame = CGRectMake(oRect.origin.x, oRect.origin.y-50, oRect.size.width, oRect.size.height+50);
        self.toolView.hidden = YES;
    }
    
    InstantViewController *instantController = [self. storyboard instantiateViewControllerWithIdentifier:@"instant_view"];
    instantController.descText = [[Attributes getHelp:8] objectAtIndex:0];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(instantViewHidden)];
    [instantController.background_View addGestureRecognizer:tap];
    
    self.instantView.hidden = YES;
    [self addChildViewController:instantController];
    [self.instantView addSubview:instantController.view];
    
    self.titleLabel.text = self.titleText;
}

- (void) setRoundTextView{
    UIColor *border_color = [UIColor blackColor];
    
    data1_1.layer.borderColor = border_color.CGColor;
    data1_1.layer.borderWidth = 1.0;
    data1_1.layer.cornerRadius = 3.0;
    
    data1_2.layer.borderColor = border_color.CGColor;
    data1_2.layer.borderWidth = 1.0;
    data1_2.layer.cornerRadius = 3.0;
    
    data2_1.layer.borderColor = border_color.CGColor;
    data2_1.layer.borderWidth = 1.0;
    data2_1.layer.cornerRadius = 3.0;
    
    data2_2.layer.borderColor = border_color.CGColor;
    data2_2.layer.borderWidth = 1.0;
    data2_2.layer.cornerRadius = 3.0;
    
    data3_1.layer.borderColor = border_color.CGColor;
    data3_1.layer.borderWidth = 1.0;
    data3_1.layer.cornerRadius = 3.0;
    
    data3_2.layer.borderColor = border_color.CGColor;
    data3_2.layer.borderWidth = 1.0;
    data3_2.layer.cornerRadius = 3.0;
    
    data4_1.layer.borderColor = border_color.CGColor;
    data4_1.layer.borderWidth = 1.0;
    data4_1.layer.cornerRadius = 3.0;
    
    data4_2.layer.borderColor = border_color.CGColor;
    data4_2.layer.borderWidth = 1.0;
    data4_2.layer.cornerRadius = 3.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) showViews{
    if (![[ConfigManager getSupuestosDescLarga] isEqualToString:@""]) {
        data_nums2 = [[ConfigManager getSupuestosDescLarga]componentsSeparatedByString:@"~"];
        if (![[ConfigManager getSupuestos1]isEqualToString:@""] || ![data_nums2[0]isEqualToString:@""]) {
            view1.hidden = NO;
            showView_num = 1;
        }
        if (![[ConfigManager getSupuestos2]isEqualToString:@""] || ![data_nums2[1]isEqualToString:@""]) {
            view1.hidden = NO;
            view2.hidden = NO;
            showView_num = 2;
        }
        if (![[ConfigManager getSupuestos3]isEqualToString:@""] || ![data_nums2[2]isEqualToString:@""]) {
            view1.hidden = NO;
            view2.hidden = NO;
            view3.hidden = NO;
            showView_num = 3;
        }
        if (![[ConfigManager getSupuestos4]isEqualToString:@""] || ![data_nums2[3]isEqualToString:@""]) {
            view1.hidden = NO;
            view2.hidden = NO;
            view3.hidden = NO;
            view4.hidden = NO;
            showView_num = 4;
        }
    }
}

-(void) setValue{
    if (![[ConfigManager getSupuestos1] isEqualToString:@""]) {
        data1_1.text = [ConfigManager getSupuestos1];
    }
    if (![[ConfigManager getSupuestos2] isEqualToString:@""]) {
        data2_1.text = [ConfigManager getSupuestos2];
    }
    if (![[ConfigManager getSupuestos3] isEqualToString:@""]) {
        data3_1.text = [ConfigManager getSupuestos3];
    }
    if (![[ConfigManager getSupuestos4] isEqualToString:@""]) {
        data4_1.text = [ConfigManager getSupuestos4];
    }
    
    if (![[ConfigManager getSupuestosDescLarga] isEqualToString:@""]) {
        data1_2.text = [[ConfigManager getSupuestosDescLarga] componentsSeparatedByString:@"~"][0];
        data2_2.text = [[ConfigManager getSupuestosDescLarga] componentsSeparatedByString:@"~"][1];
        data3_2.text = [[ConfigManager getSupuestosDescLarga] componentsSeparatedByString:@"~"][2];
        data4_2.text = [[ConfigManager getSupuestosDescLarga] componentsSeparatedByString:@"~"][3];
    }
}

- (IBAction)backBtn_Clicked:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)homebtn_Clicked:(id)sender {
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Confirm!" message:@"¿Estás seguro que deseas cerrar tu Business Case?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:nil];
    [alert addButtonWithTitle:@"Si"];
    [alert show];
}

#pragma mark UIAlertViewDelegate
-(void) alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1 ) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)saveBtn_Clicked:(id)sender {
    [self saveConfig];
    [DBAdapter updateFileData : [DBAdapter getDbFilePath]];
}

-(void) saveConfig{
    
    [ConfigManager setSupuestos1 : data1_1.text];
    [ConfigManager setSupuestos2 : data2_1.text];
    [ConfigManager setSupuestos3 : data3_1.text];
    [ConfigManager setSupuestos4 : data4_1.text];
    
    NSString *strDepLarga = [[data1_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString:@"~"];
    strDepLarga = [strDepLarga stringByAppendingString:[[data2_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    strDepLarga = [strDepLarga stringByAppendingString:[[data3_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    strDepLarga = [strDepLarga stringByAppendingString:[data4_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    
    [ConfigManager setSupuestosDescLarga : strDepLarga];
}

- (IBAction)addBtn_Clicked:(id)sender {
    if (showView_num == 0) {
        showView_num ++;
        view1.hidden = NO;
        return;
    }
    if (showView_num == 1) {
        showView_num  ++;
        view2.hidden = NO;
        return;
    }
    
    if (showView_num == 2) {
        showView_num ++;
        view3.hidden = NO;
        return;
    }
    
    if (showView_num == 3) {
        view4.hidden = NO;
        showView_num ++;
        return;
    }
}

- (IBAction)deleteBtn_Clicked:(id)sender {
    if (showView_num == 4) {
        view4.hidden = YES;
        showView_num--;
        return;
    }
    
    if (showView_num == 3) {
        view3.hidden = YES;
        showView_num --;
        return;
    }
    
    if (showView_num == 2) {
        view2.hidden = YES;
        showView_num --;
        return;
    }
    
    if (showView_num == 1) {
        view1.hidden = YES;
        showView_num --;
        return;
    }

}

-(void)viewWillDisappear:(BOOL)animated{
    [self saveConfig];
}

- (IBAction)helpBtnClick:(id)sender {
    HelpViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"help_view"];
    menuView.helpText = [[Attributes getDescription:8] objectAtIndex:0];
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
