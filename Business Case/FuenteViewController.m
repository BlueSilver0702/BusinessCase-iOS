//
//  FuenteViewController.m
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "FuenteViewController.h"
#import "ConfigManager.h"
#import "DBAdapter.h"
#import "Attributes.h"
#import "HelpViewController.h"
#import "InstantViewController.h"

@interface FuenteViewController ()

@end

@implementation FuenteViewController

@synthesize data1, data2, data3, data4;
@synthesize selectedRow;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.saveBtn.layer.cornerRadius = 3;
    // Do any additional setup after loading the view.
    [self setRoundTextView];
    [self setValues];
    
    if (self.isHelp) {
        CGRect oRect = self.scrollview.frame;
        self.scrollview.frame = CGRectMake(oRect.origin.x, oRect.origin.y-50, oRect.size.width, oRect.size.height+50);
        self.toolView.hidden = YES;
    }
    
    InstantViewController *instantController = [self. storyboard instantiateViewControllerWithIdentifier:@"instant_view"];
    instantController.descText = [[Attributes getHelp:9] objectAtIndex:self.selectedRow];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(instantViewHidden)];
    [instantController.background_View addGestureRecognizer:tap];
    
    self.instantView.hidden = YES;
    [self addChildViewController:instantController];
    [self.instantView addSubview:instantController.view];
    
    self.titleLabel.text = self.titleText;
}

- (void) setRoundTextView{
    UIColor *border_color = [UIColor blackColor];
    data1.layer.borderColor = border_color.CGColor;
    data1.layer.borderWidth = 1.0;
    data1.layer.cornerRadius = 3.0;
    
    data2.layer.borderColor = border_color.CGColor;
    data2.layer.borderWidth = 1.0;
    data2.layer.cornerRadius = 3.0;
    
    data3.layer.borderColor = border_color.CGColor;
    data3.layer.borderWidth = 1.0;
    data3.layer.cornerRadius = 3.0;
    
    data4.layer.borderColor = border_color.CGColor;
    data4.layer.borderWidth = 1.0;
    data4.layer.cornerRadius = 3.0;
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

- (void) setValues{
    switch (selectedRow) {
        case 0:
            if(![[ConfigManager  getFuntesIngresos] isEqualToString:@""])
            {
                data1.text = [[ConfigManager getFuntesIngresos] componentsSeparatedByString:@"~"][0];
                data2.text = [[ConfigManager getFuntesIngresos] componentsSeparatedByString:@"~"][1];
                data3.text = [[ConfigManager getFuntesIngresos] componentsSeparatedByString:@"~"][2];
                data4.text = [[ConfigManager getFuntesIngresos] componentsSeparatedByString:@"~"][3];
            } else if(![[ConfigManager getDescriptionShort1] isEqualToString:@""]){
                data1.text = [[ConfigManager getDescriptionShort1] componentsSeparatedByString:@"~"][0];
                data2.text = [[ConfigManager getDescriptionShort1] componentsSeparatedByString:@"~"][1];
                data3.text = [[ConfigManager getDescriptionShort1] componentsSeparatedByString:@"~"][2];
                data4.text = [[ConfigManager getDescriptionShort1] componentsSeparatedByString:@"~"][3];
            }
            break;
        case 1:
            if(![[ConfigManager  getDescriptionShortAhorros1] isEqualToString:@"" ])
            {
                data1.text = [[ConfigManager getDescriptionShortAhorros1] componentsSeparatedByString:@"~"][0];
                data2.text = [[ConfigManager getDescriptionShortAhorros1] componentsSeparatedByString:@"~"][1];
                data3.text = [[ConfigManager getDescriptionShortAhorros1] componentsSeparatedByString:@"~"][2];
                data4.text = [[ConfigManager getDescriptionShortAhorros1] componentsSeparatedByString:@"~"][3];
            }
            break;
        
        case 2:
            if(![[ConfigManager  getDescriptionShortEgresos1] isEqualToString:@"" ])
            {
                data1.text = [[ConfigManager getDescriptionShortEgresos1] componentsSeparatedByString:@"~"][0];
                data2.text = [[ConfigManager getDescriptionShortEgresos1] componentsSeparatedByString:@"~"][1];
                data3.text = [[ConfigManager getDescriptionShortEgresos1] componentsSeparatedByString:@"~"][2];
                data4.text = [[ConfigManager getDescriptionShortEgresos1] componentsSeparatedByString:@"~"][3];
            }
            break;
        case 3:
            if(![[ConfigManager  getDescriptionShortCostos] isEqualToString:@"" ])
            {
                data1.text = [[ConfigManager getDescriptionShortCostos] componentsSeparatedByString:@"~"][0];
                data2.text = [[ConfigManager getDescriptionShortCostos] componentsSeparatedByString:@"~"][1];
                data3.text = [[ConfigManager getDescriptionShortCostos] componentsSeparatedByString:@"~"][2];
                data4.text = [[ConfigManager getDescriptionShortCostos] componentsSeparatedByString:@"~"][3];
            }
            break;
        case 4:
            if(![[ConfigManager  getDescriptionShortInversion] isEqualToString:@"" ])
            {
                data1.text = [[ConfigManager getDescriptionShortInversion] componentsSeparatedByString:@"~"][0];
                data2.text = [[ConfigManager getDescriptionShortInversion] componentsSeparatedByString:@"~"][1];
                data3.text = [[ConfigManager getDescriptionShortInversion] componentsSeparatedByString:@"~"][2];
                data4.text = [[ConfigManager getDescriptionShortInversion] componentsSeparatedByString:@"~"][3];
            }
            break;
        default:
            break;
    }
}

- (IBAction)backBtn_Clicked:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)homeBtn_Clicked:(id)sender {
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

- (void) saveConfig{
    NSString *str = [[data1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString:@"~"];
    str = [str stringByAppendingString:[[data2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    str = [str stringByAppendingString:[[data3.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    str = [str stringByAppendingString:[[data4.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    
    switch (selectedRow) {
        case 0:
            [ConfigManager setFuntesIngresos : str];
            break;
        case 1:
            [ConfigManager setDescriptionShortAhorros1 : str];
            break;
        case 2:
            [ConfigManager setDescriptionShortEgresos1 : str];
            break;
        case 3:
            [ConfigManager setDescriptionShortCostos : str];
            break;
        case 4:
            [ConfigManager setDescriptionShortInversion : str];
            break;
        default:
            break;
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [self saveConfig];
}

- (IBAction)helpBtnClick:(id)sender {
    HelpViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"help_view"];
    menuView.helpText = [[Attributes getDescription:9] objectAtIndex:0];
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
