//
//  ContingYViewController.m
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "ContingYViewController.h"
#import "ConfigManager.h"
#import "DBAdapter.h"
#import "Attributes.h"
#import "HelpViewController.h"
#import "InstantViewController.h"

@interface ContingYViewController ()

@end

@implementation ContingYViewController
@synthesize selectedRow, resulta;
@synthesize view1, view2, view3, view4;
@synthesize data1_1, data1_2, data2_1, data2_2, data3_1, data3_2,data4_1, data4_2;
@synthesize scrollview;
@synthesize destitle1, destitle2, destitle3, destitle4;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.saveBtn.layer.cornerRadius = 3;
    // Do any additional setup after loading the view.
    
    [scrollview setContentSize:CGSizeMake(scrollview.frame.size.width, 1000)];
//    resulta = 0;
    showView_num = 0;
    data_nums1 = [[NSArray alloc]init];
    data_nums2 = [[NSArray alloc]init];
    [self setRoundTextView];
    [self SetTitle];
    [self showViews];
    [self setValue];
    
    if (self.isHelp) {
        CGRect oRect = self.scrollview.frame;
        self.scrollview.frame = CGRectMake(oRect.origin.x, oRect.origin.y-50, oRect.size.width, oRect.size.height+50);
        self.toolView.hidden = YES;
    }
    
    InstantViewController *instantController = [self. storyboard instantiateViewControllerWithIdentifier:@"instant_view"];
    if (resulta == 999) {
        instantController.descText = [[Attributes getHelp:7] objectAtIndex:0];
    } else {
        instantController.descText = [[Attributes getHelp:6] objectAtIndex:self.selectedRow];
    }

    
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

-(void) SetTitle{
    if (resulta == 999) {
        destitle1.text = @"Resultados1";
        destitle2.text = @"Resultados2";
        destitle3.text = @"Resultados3";
        destitle4.text = @"Resultados4";
    }else{
    
        if (selectedRow == 0) {
            destitle1.text = @"Contingencias1";
            destitle2.text = @"Contingencias2";
            destitle3.text = @"Contingencias3";
            destitle4.text = @"Contingencias4";
        } else{
            destitle1.text = @"Dependencias1";
            destitle2.text = @"Dependencias2";
            destitle3.text = @"Dependencias3";
            destitle4.text = @"Dependencias4";
        }
    }
}

- (void)showViews{
    
    if (resulta == 999) {
        if (![[ConfigManager getDescriptionShortBeneficios] isEqualToString:@""] &&![[ConfigManager getResultadosDescLarga]isEqualToString:@""] ) {
            
            data_nums1 = [[ConfigManager getDescriptionShortBeneficios] componentsSeparatedByString:@"~"];
            data_nums2 = [[ConfigManager getResultadosDescLarga]componentsSeparatedByString:@"~"];
            
            if (![data_nums1[0] isEqualToString:@""] || ![data_nums2[0] isEqualToString:@""]) {
                view1.hidden = NO;
                showView_num = 1;
            }
            if (![data_nums1[1] isEqualToString:@""] || ![data_nums2[1] isEqualToString:@""]) {
                view1.hidden = NO;
                view2.hidden = NO;
                showView_num = 2;
            }
            if (![data_nums1[2] isEqualToString:@""] || ![data_nums2[2] isEqualToString:@""]) {
                view1.hidden = NO;
                view2.hidden = NO;
                view3.hidden = NO;
                showView_num = 3;
            }
            if (![data_nums1[3] isEqualToString:@""] || ![data_nums2[3] isEqualToString:@""]) {
                view1.hidden = NO;
                view2.hidden = NO;
                view3.hidden = NO;
                view4.hidden = NO;
                showView_num = 4;
            }
        }
        
    }else{
        if (selectedRow == 0) {
            if (![[ConfigManager getDescriptionShortRiesgos] isEqualToString:@""] &&![[ConfigManager getContingenciaDesLarga]isEqualToString:@""] ) {
                
                data_nums1 = [[ConfigManager getDescriptionShortRiesgos] componentsSeparatedByString:@"~"];
                data_nums2 = [[ConfigManager getContingenciaDesLarga]componentsSeparatedByString:@"~"];
                
                if (![data_nums1[0] isEqualToString:@""] || ![data_nums2[0] isEqualToString:@""]) {
                    view1.hidden = NO;
                    showView_num = 1;
                }
                if (![data_nums1[1] isEqualToString:@""] || ![data_nums2[1] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    showView_num = 2;
                }
                if (![data_nums1[2] isEqualToString:@""] || ![data_nums2[2] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    showView_num = 3;
                }
                if (![data_nums1[3] isEqualToString:@""] || ![data_nums2[3] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    showView_num = 4;
                }
            }
        } else if(selectedRow == 1){
            if (![[ConfigManager getDependenciaDesLarga] isEqualToString:@""]) {
                data_nums2 = [[ConfigManager getDependenciaDesLarga]componentsSeparatedByString:@"~"];
                if (![[ConfigManager getDependencia1]isEqualToString:@""] || ![data_nums2[0]isEqualToString:@""]) {
                    view1.hidden = NO;
                    showView_num = 1;
                }
                if (![[ConfigManager getDependencia2]isEqualToString:@""] || ![data_nums2[1]isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    showView_num = 2;
                }
                if (![[ConfigManager getDependencia3]isEqualToString:@""] || ![data_nums2[2]isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    showView_num = 3;
                }
                if (![[ConfigManager getDependencia4]isEqualToString:@""] || ![data_nums2[3]isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    showView_num = 4;
                }
            }
        }
    }
}

-(void) setValue{
    if (resulta == 999) {
        if (![[ConfigManager getDescriptionShortBeneficios] isEqualToString:@""]) {
            data1_1.text = [[ConfigManager getDescriptionShortBeneficios] componentsSeparatedByString:@"~"][0];
            data2_1.text = [[ConfigManager getDescriptionShortBeneficios] componentsSeparatedByString:@"~"][1];
            data3_1.text = [[ConfigManager getDescriptionShortBeneficios] componentsSeparatedByString:@"~"][2];
            data4_1.text = [[ConfigManager getDescriptionShortBeneficios] componentsSeparatedByString:@"~"][3];
        }
        
        if (![[ConfigManager getResultadosDescLarga]isEqualToString:@""] ) {
            data1_2.text = [[ConfigManager getResultadosDescLarga] componentsSeparatedByString:@"~"][0];
            data2_2.text = [[ConfigManager getResultadosDescLarga] componentsSeparatedByString:@"~"][1];
            data3_2.text = [[ConfigManager getResultadosDescLarga] componentsSeparatedByString:@"~"][2];
            data4_2.text = [[ConfigManager getResultadosDescLarga] 	componentsSeparatedByString:@"~"][3];
        }
    }else{
    
        if (selectedRow == 0) {
            if (![[ConfigManager getDescriptionShortRiesgos] isEqualToString:@""]) {
                data1_1.text = [[ConfigManager getDescriptionShortRiesgos] componentsSeparatedByString:@"~"][0];
                 data2_1.text = [[ConfigManager getDescriptionShortRiesgos] componentsSeparatedByString:@"~"][1];
                 data3_1.text = [[ConfigManager getDescriptionShortRiesgos] componentsSeparatedByString:@"~"][2];
                 data4_1.text = [[ConfigManager getDescriptionShortRiesgos] componentsSeparatedByString:@"~"][3];
            }
            
            if (![[ConfigManager getContingenciaDesLarga]isEqualToString:@""] ) {
                data1_2.text = [[ConfigManager getContingenciaDesLarga] componentsSeparatedByString:@"~"][0];
                data2_2.text = [[ConfigManager getContingenciaDesLarga] componentsSeparatedByString:@"~"][1];
                data3_2.text = [[ConfigManager getContingenciaDesLarga] componentsSeparatedByString:@"~"][2];
                data4_2.text = [[ConfigManager getContingenciaDesLarga] 	componentsSeparatedByString:@"~"][3];
            }
            
        } else if(selectedRow == 1){
            if (![[ConfigManager getDependencia1] isEqualToString:@""]) {
                data1_1.text = [ConfigManager getDependencia1];
            }
            if (![[ConfigManager getDependencia2] isEqualToString:@""]) {
                data2_1.text = [ConfigManager getDependencia2];
            }
            if (![[ConfigManager getDependencia3] isEqualToString:@""]) {
                data3_1.text = [ConfigManager getDependencia3];
            }
            if (![[ConfigManager getDependencia4] isEqualToString:@""]) {
                data4_1.text = [ConfigManager getDependencia4];
            }
            
            if (![[ConfigManager getDependenciaDesLarga] isEqualToString:@""]) {
                data1_2.text = [[ConfigManager getDependenciaDesLarga] componentsSeparatedByString:@"~"][0];
                data2_2.text = [[ConfigManager getDependenciaDesLarga] componentsSeparatedByString:@"~"][1];
                data3_2.text = [[ConfigManager getDependenciaDesLarga] componentsSeparatedByString:@"~"][2];
                data4_2.text = [[ConfigManager getDependenciaDesLarga] componentsSeparatedByString:@"~"][3];
            }
        }
    }
}
- (IBAction)backBtn_Clicked:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
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

- (IBAction)removeBtn_Clicked:(id)sender {
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

- (IBAction)homeBtn_Clicked:(id)sender {
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Confirm!" message:@"¿Estás seguro que deseas cerrar tu Business Case?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:nil];
    [alert addButtonWithTitle:@"Si"];
    [alert show];
}

- (IBAction)saveBtn_Clicked:(id)sender {
    [self saveConfig];
    [DBAdapter updateFileData : [DBAdapter getDbFilePath]];
}

- (void)saveConfig{
    if (resulta == 999) {
        NSString *strRes = [[data1_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString:@"~"];
        strRes = [strRes stringByAppendingString:[[data2_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString: @"~"]];
        strRes = [strRes stringByAppendingString:[[data3_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString: @"~"]];
        strRes = [strRes stringByAppendingString:[data4_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
        
        [ConfigManager setDescriptionShortBeneficios : strRes];
        
        NSString *strResLarga = [[data1_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString:@"~"];
        strResLarga = [strResLarga stringByAppendingString:[[data2_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
        strResLarga = [strResLarga stringByAppendingString:[[data3_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
        strResLarga = [strResLarga stringByAppendingString:[data4_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
        
        [ConfigManager setResultadosDescLarga : strResLarga];
        
    } else{
       
        if (selectedRow == 0) {
            NSString *strCon = [[data1_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString:@"~"];
            strCon = [strCon stringByAppendingString:[[data2_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString: @"~"]];
            strCon = [strCon stringByAppendingString:[[data3_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString: @"~"]];
            strCon = [strCon stringByAppendingString:[data4_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
            
            [ConfigManager setDescriptionShortRiesgos : strCon];
            
            NSString *strConLarga = [[data1_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString:@"~"];
            strConLarga = [strConLarga stringByAppendingString:[[data2_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
            strConLarga = [strConLarga stringByAppendingString:[[data3_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
           strConLarga = [strConLarga stringByAppendingString:[data4_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
           
            [ConfigManager setContingenciaDesLarga:strConLarga];
            
        } else if(selectedRow == 1){
            NSString *strDep1 = data1_1.text;
            [ConfigManager setDependencia1 : strDep1];
            NSString *strDep2 = data2_1.text;
            [ConfigManager setDependencia2 : strDep2];
            NSString *strDep3 = data3_1.text;
            [ConfigManager setDependencia3 : strDep3];
            NSString *strDep4 = data4_1.text;
            [ConfigManager setDependencia4 : strDep4];
            
            NSString *strDepLarga = [[data2_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString:@"~"];
            strDepLarga = [strDepLarga stringByAppendingString:[[data2_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
            strDepLarga = [strDepLarga stringByAppendingString:[[data3_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
            strDepLarga = [strDepLarga stringByAppendingString:[[data4_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
            
            [ConfigManager setDependenciaDesLarga : strDepLarga];
        }
    }
}

#pragma mark UIAlertViewDelegate
-(void) alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1 ) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [self saveConfig];
}

- (IBAction)helpBtnClick:(id)sender {
    HelpViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"help_view"];
    if (resulta == 999) {
        menuView.helpText = [[Attributes getDescription:7] objectAtIndex:0];
    } else {
        menuView.helpText = [[[Attributes getDescription:6] objectAtIndex:self.selectedRow] objectAtIndex:0];
    }
    menuView.titleText = self.titleText;
    [self.navigationController pushViewController: menuView animated:YES];
}

- (IBAction)help1BtnClick:(id)sender {
    HelpViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"help_view"];
    if (resulta == 999) {
        menuView.helpText = [[Attributes getDescription:7] objectAtIndex:0];
    } else {
        menuView.helpText = [[[Attributes getDescription:6] objectAtIndex:self.selectedRow] objectAtIndex:1];
    }
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
