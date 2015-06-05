//
//  FillDetailViewController.m
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "FillDetailViewController.h"
#import "ConfigManager.h"
#import "DBAdapter.h"
#import "Attributes.h"
#import "HelpViewController.h"
#import "InstantViewController.h"

@interface FillDetailViewController ()

@end

@implementation FillDetailViewController
@synthesize scrollView;
@synthesize data1_1, data1_2, data2_1, data2_2, data3_1, data3_2, data4_1, data4_2;
@synthesize view1,  view2, view3, view4;
@synthesize i, j, riesgos;

NSInteger keyboard_Height;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.saveBtn.layer.cornerRadius = 3;
    // Do any additional setup after loading the view.
//    [scrollView setExclusiveTouch:YES];
//    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, 770)];
    keyboard_Height = 0;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    showView_num = 0;
    data_nums1 = [[NSArray alloc]init];
    data_nums2 = [[NSArray alloc]init];
    [self selectViewAndSetTitle];
    [self setTextViewBorder];
    [self initView];
    
    if (self.isHelp) {
        CGRect oRect = self.scrollView.frame;
        self.scrollView.frame = CGRectMake(oRect.origin.x, oRect.origin.y-50, oRect.size.width, oRect.size.height+50);
        self.toolView.hidden = YES;
    }
    
    if (!self.j) self.j = 0;
    InstantViewController *instantController = [self. storyboard instantiateViewControllerWithIdentifier:@"instant_view"];
    if (self.parentIndex!=3) {
        instantController.descText = [[[Attributes getHelp:self.parentIndex] objectAtIndex:self.i] objectAtIndex:self.j];
    } else {
        instantController.descText = [[Attributes getHelp:3] objectAtIndex:0];
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(instantViewHidden)];
    [instantController.background_View addGestureRecognizer:tap];
    
    self.instantView.hidden = YES;
    [self addChildViewController:instantController];
    [self.instantView addSubview:instantController.view];
    
    self.titleLabel.text = self.titleText;
}

-(void)keyboardWillShow:(NSNotification *)notification{
    CGRect keyboardBounds;
    [[notification.userInfo valueForKey:UIKeyboardFrameBeginUserInfoKey]getValue:&keyboardBounds];
    keyboard_Height = keyboardBounds.size.height;
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, keyboard_Height+810)];
}

- (void) setTextViewBorder{
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

- (void)viewWillDisappear:(BOOL)animated{
    [self saveConfig];
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

-(void) selectViewAndSetTitle{
    if (riesgos == 3) {
        value = 7;
    } else{
        if (i == 2) {
            value = 4;
        }else{
            switch (j) {
                case 0:
                    if (i == 0) {
                        value = 0;
                    }
                    if (i == 1) {
                        value = 2;
                    }
                    if (i == 3) {
                        value = 5;
                    }
                    break;
                
                case  1:
                    if (i == 0) {
                        value = 1;
                    }
                    if (i == 1) {
                        value = 3;
                    }
                    if (i == 3) {
                        value = 6;
                    }
                    break;
            }
        }
    }
}


-  (void) initView{

    [self showViews];
    
}

-(void)showViews{
    switch (value) {
        case 0:
            if (![[ConfigManager getDescriptionShort1] isEqualToString:@""] && ![[ConfigManager getDescriptionLarge1] isEqualToString:@""]) {
                
                data_nums1 = [[ConfigManager getDescriptionShort1] componentsSeparatedByString:@"~"];
                data_nums2 = [[ConfigManager getDescriptionLarge1] componentsSeparatedByString:@"~"];
                
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
            break;
            
        case 1:
            if (![[ConfigManager getDescriptionShortAhorros1] isEqualToString:@""] && ![[ConfigManager getDescriptionLargeAhorros1] isEqualToString:@""]) {
                
                data_nums1 = [[ConfigManager getDescriptionShortAhorros1] componentsSeparatedByString:@"~"];
                data_nums2 = [[ConfigManager getDescriptionLargeAhorros1] componentsSeparatedByString:@"~"];
                
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
            
            break;
        case 2:
            if (![[ConfigManager getDescriptionShortEgresos1] isEqualToString:@""] && ![[ConfigManager getDescriptionLargeEgresos1] isEqualToString:@""]) {
                
                data_nums1 = [[ConfigManager getDescriptionShortEgresos1] componentsSeparatedByString:@"~"];
                data_nums2 = [[ConfigManager getDescriptionLargeEgresos1] componentsSeparatedByString:@"~"];
                
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

            break;
        case 3:
            if (![[ConfigManager getDescriptionShortCostos] isEqualToString:@""] && ![[ConfigManager getDescriptionLargeCostos] isEqualToString:@""]) {
                
                data_nums1 = [[ConfigManager getDescriptionShortCostos] componentsSeparatedByString:@"~"];
                data_nums2 = [[ConfigManager getDescriptionLargeCostos] componentsSeparatedByString:@"~"];
                
                if (![data_nums1[0] isEqualToString:@""] || ![data_nums2[0] isEqualToString:@""]) {
                    view1.hidden = NO;
                    showView_num = 1;
                }
                if (![data_nums1[1] isEqualToString:@""] || ![data_nums2[1] isEqualToString:@""]) {
                    view2.hidden = NO;
                    showView_num = 2;
                }
                if (![data_nums1[2] isEqualToString:@""] || ![data_nums2[2] isEqualToString:@""]) {
                    view3.hidden = NO;
                    showView_num = 3;
                }
                if (![data_nums1[3] isEqualToString:@""] || ![data_nums2[3] isEqualToString:@""]) {
                    view4.hidden = NO;
                    showView_num = 4;
                }
            }

            break;
        case 4:
            if (![[ConfigManager getDescriptionShortInversion] isEqualToString:@""] && ![[ConfigManager getDescriptionLargeInversion] isEqualToString:@""]) {
                
                data_nums1 = [[ConfigManager getDescriptionShortInversion] componentsSeparatedByString:@"~"];
                data_nums2 = [[ConfigManager getDescriptionLargeInversion] componentsSeparatedByString:@"~"];
                
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

            break;
        case 5:
            if (![[ConfigManager getDescriptionShortBeneficios] isEqualToString:@""] && ![[ConfigManager getDescriptionLargeBeneficios] isEqualToString:@""]) {
                
                data_nums1 = [[ConfigManager getDescriptionShortBeneficios] componentsSeparatedByString:@"~"];
                data_nums2 = [[ConfigManager getDescriptionLargeBeneficios] componentsSeparatedByString:@"~"];
                
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
            
            break;
        case 6:
            if (![[ConfigManager getDescriptionShortImpactos] isEqualToString:@""] && ![[ConfigManager getDescriptionLargeImpactos] isEqualToString:@""]) {
                
                data_nums1 = [[ConfigManager getDescriptionShortImpactos] componentsSeparatedByString:@"~"];
                data_nums2 = [[ConfigManager getDescriptionLargeImpactos] componentsSeparatedByString:@"~"];
                
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
            break;
            
        case 7:
            if (![[ConfigManager getDescriptionShortRiesgos] isEqualToString:@""] && ![[ConfigManager getDescriptionLargeRiesgos] isEqualToString:@""]) {
                
                data_nums1 = [[ConfigManager getDescriptionShortRiesgos] componentsSeparatedByString:@"~"];
                data_nums2 = [[ConfigManager getDescriptionLargeRiesgos] componentsSeparatedByString:@"~"];
                
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
            break;
        default:
            break;
    }
    
    [self setValue];
}

- (void)setValue{
    switch (value) {
        case 0:
            if (![[ConfigManager getDescriptionShort1] isEqualToString:@""]) {
                data1_1.text = [[ConfigManager getDescriptionShort1] componentsSeparatedByString:@"~"][0];
                data2_1.text = [[ConfigManager getDescriptionShort1] componentsSeparatedByString:@"~"][1];
                data3_1.text = [[ConfigManager getDescriptionShort1] componentsSeparatedByString:@"~"][2];
                data4_1.text = [[ConfigManager getDescriptionShort1] componentsSeparatedByString:@"~"][3];
            }
            
            if (![[ConfigManager getDescriptionLarge1] isEqualToString:@""]) {
                data1_2.text=[[ConfigManager getDescriptionLarge1] componentsSeparatedByString:@"~"][0];
                data2_2.text=[[ConfigManager getDescriptionLarge1] componentsSeparatedByString:@"~"][1];
                data3_2.text=[[ConfigManager getDescriptionLarge1] componentsSeparatedByString:@"~"][2];
                data4_2.text=[[ConfigManager getDescriptionLarge1] componentsSeparatedByString:@"~"][3];
            }

            break;
        case 1:
            if (![[ConfigManager getDescriptionShortAhorros1] isEqualToString:@""]) {
                data1_1.text = [[ConfigManager getDescriptionShortAhorros1] componentsSeparatedByString:@"~"][0];
                data2_1.text = [[ConfigManager getDescriptionShortAhorros1] componentsSeparatedByString:@"~"][1];
                data3_1.text = [[ConfigManager getDescriptionShortAhorros1] componentsSeparatedByString:@"~"][2];
                data4_1.text = [[ConfigManager getDescriptionShortAhorros1] componentsSeparatedByString:@"~"][3];
            }
            
            if (![[ConfigManager getDescriptionLargeAhorros1] isEqualToString:@""]) {
                data1_2.text=[[ConfigManager getDescriptionLargeAhorros1] componentsSeparatedByString:@"~"][0];
                data2_2.text=[[ConfigManager getDescriptionLargeAhorros1] componentsSeparatedByString:@"~"][1];
                data3_2.text=[[ConfigManager getDescriptionLargeAhorros1] componentsSeparatedByString:@"~"][2];
                data4_2.text=[[ConfigManager getDescriptionLargeAhorros1] componentsSeparatedByString:@"~"][3];
            }

            break;
            
        case 2:
            if (![[ConfigManager getDescriptionShortEgresos1] isEqualToString:@""]) {
                data1_1.text = [[ConfigManager getDescriptionShortEgresos1] componentsSeparatedByString:@"~"][0];
                data2_1.text = [[ConfigManager getDescriptionShortEgresos1] componentsSeparatedByString:@"~"][1];
                data3_1.text = [[ConfigManager getDescriptionShortEgresos1] componentsSeparatedByString:@"~"][2];
                data4_1.text = [[ConfigManager getDescriptionShortEgresos1] componentsSeparatedByString:@"~"][3];
            }
            
            if (![[ConfigManager getDescriptionLargeEgresos1] isEqualToString:@""]) {
                data1_2.text=[[ConfigManager getDescriptionLargeEgresos1] componentsSeparatedByString:@"~"][0];
                data2_2.text=[[ConfigManager getDescriptionLargeEgresos1] componentsSeparatedByString:@"~"][1];
                data3_2.text=[[ConfigManager getDescriptionLargeEgresos1] componentsSeparatedByString:@"~"][2];
                data4_2.text=[[ConfigManager getDescriptionLargeEgresos1] componentsSeparatedByString:@"~"][3];
            }
            break;
        
        case  3:
            if (![[ConfigManager getDescriptionShortCostos] isEqualToString:@""]) {
                data1_1.text = [[ConfigManager getDescriptionShortCostos] componentsSeparatedByString:@"~"][0];
                data2_1.text = [[ConfigManager getDescriptionShortCostos] componentsSeparatedByString:@"~"][1];
                data3_1.text = [[ConfigManager getDescriptionShortCostos] componentsSeparatedByString:@"~"][2];
                data4_1.text = [[ConfigManager getDescriptionShortCostos] componentsSeparatedByString:@"~"][3];
            }
            
            if (![[ConfigManager getDescriptionLargeCostos] isEqualToString:@""]) {
                data1_2.text=[[ConfigManager getDescriptionLargeCostos] componentsSeparatedByString:@"~"][0];
                data2_2.text=[[ConfigManager getDescriptionLargeCostos] componentsSeparatedByString:@"~"][1];
                data3_2.text=[[ConfigManager getDescriptionLargeCostos] componentsSeparatedByString:@"~"][2];
                data4_2.text=[[ConfigManager getDescriptionLargeCostos] componentsSeparatedByString:@"~"][3];
            }
            break;
        
        case 4:
            if (![[ConfigManager getDescriptionShortInversion] isEqualToString:@""]) {
                data1_1.text = [[ConfigManager getDescriptionShortInversion] componentsSeparatedByString:@"~"][0];
                data2_1.text = [[ConfigManager getDescriptionShortInversion] componentsSeparatedByString:@"~"][1];
                data3_1.text = [[ConfigManager getDescriptionShortInversion] componentsSeparatedByString:@"~"][2];
                data4_1.text = [[ConfigManager getDescriptionShortInversion] componentsSeparatedByString:@"~"][3];
            }
            
            if (![[ConfigManager getDescriptionLargeInversion] isEqualToString:@""]) {
                data1_2.text=[[ConfigManager getDescriptionLargeInversion] componentsSeparatedByString:@"~"][0];
                data2_2.text=[[ConfigManager getDescriptionLargeInversion] componentsSeparatedByString:@"~"][1];
                data3_2.text=[[ConfigManager getDescriptionLargeInversion] componentsSeparatedByString:@"~"][2];
                data4_2.text=[[ConfigManager getDescriptionLargeInversion] componentsSeparatedByString:@"~"][3];
            }

            break;
        
        case 5:
            if (![[ConfigManager getDescriptionShortBeneficios] isEqualToString:@""]) {
                data1_1.text = [[ConfigManager getDescriptionShortBeneficios] componentsSeparatedByString:@"~"][0];
                data2_1.text = [[ConfigManager getDescriptionShortBeneficios] componentsSeparatedByString:@"~"][1];
                data3_1.text = [[ConfigManager getDescriptionShortBeneficios] componentsSeparatedByString:@"~"][2];
                data4_1.text = [[ConfigManager getDescriptionShortBeneficios] componentsSeparatedByString:@"~"][3];
            }
            
            if (![[ConfigManager getDescriptionLargeBeneficios] isEqualToString:@""]) {
                data1_2.text=[[ConfigManager getDescriptionLargeBeneficios] componentsSeparatedByString:@"~"][0];
                data2_2.text=[[ConfigManager getDescriptionLargeBeneficios] componentsSeparatedByString:@"~"][1];
                data3_2.text=[[ConfigManager getDescriptionLargeBeneficios] componentsSeparatedByString:@"~"][2];
                data4_2.text=[[ConfigManager getDescriptionLargeBeneficios] componentsSeparatedByString:@"~"][3];
            }

            break;
            
        case 6:
            if (![[ConfigManager getDescriptionShortImpactos] isEqualToString:@""]) {
                data1_1.text = [[ConfigManager getDescriptionShortImpactos] componentsSeparatedByString:@"~"][0];
                data2_1.text = [[ConfigManager getDescriptionShortImpactos] componentsSeparatedByString:@"~"][1];
                data3_1.text = [[ConfigManager getDescriptionShortImpactos] componentsSeparatedByString:@"~"][2];
                data4_1.text = [[ConfigManager getDescriptionShortImpactos] componentsSeparatedByString:@"~"][3];
            }
            
            if (![[ConfigManager getDescriptionLargeImpactos] isEqualToString:@""]) {
                data1_2.text=[[ConfigManager getDescriptionLargeImpactos] componentsSeparatedByString:@"~"][0];
                data2_2.text=[[ConfigManager getDescriptionLargeImpactos] componentsSeparatedByString:@"~"][1];
                data3_2.text=[[ConfigManager getDescriptionLargeImpactos] componentsSeparatedByString:@"~"][2];
                data4_2.text=[[ConfigManager getDescriptionLargeImpactos] componentsSeparatedByString:@"~"][3];
            }
            break;
        case 7:
            if (![[ConfigManager getDescriptionShortRiesgos] isEqualToString:@""]) {
                data1_1.text = [[ConfigManager getDescriptionShortRiesgos] componentsSeparatedByString:@"~"][0];
                data2_1.text = [[ConfigManager getDescriptionShortRiesgos] componentsSeparatedByString:@"~"][1];
                data3_1.text = [[ConfigManager getDescriptionShortRiesgos] componentsSeparatedByString:@"~"][2];
                data4_1.text = [[ConfigManager getDescriptionShortRiesgos] componentsSeparatedByString:@"~"][3];
            }
            
            if (![[ConfigManager getDescriptionLargeRiesgos] isEqualToString:@""]) {
                data1_2.text=[[ConfigManager getDescriptionLargeRiesgos] componentsSeparatedByString:@"~"][0];
                data2_2.text=[[ConfigManager getDescriptionLargeRiesgos] componentsSeparatedByString:@"~"][1];
                data3_2.text=[[ConfigManager getDescriptionLargeRiesgos] componentsSeparatedByString:@"~"][2];
                data4_2.text=[[ConfigManager getDescriptionLargeRiesgos] componentsSeparatedByString:@"~"][3];
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

- (IBAction)addBtn_Cliked:(id)sender {
    if (showView_num == 0) {
        showView_num ++;
        view1.hidden = NO;
        return;
    }
    
    if (showView_num == 1) {
        showView_num ++;
        view2.hidden =NO;
        return;
    }
    
    if (showView_num == 2) {
        showView_num ++;
        view3.hidden = NO;
        [scrollView setExclusiveTouch:YES];
        [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, 810+keyboard_Height)];
        return;
    }
    
    if (showView_num == 3) {
        view4.hidden = NO;
        showView_num++;
        [scrollView setExclusiveTouch:YES];
        [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, 810+keyboard_Height)];
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

- (IBAction)saveBtn_Clicke:(id)sender {
    [self saveConfig];
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

- (void) saveConfig{
    NSString * strDescCorta = [[data1_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString: @"~"];
    strDescCorta = [strDescCorta stringByAppendingString:[[data2_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString: @"~"]];
    strDescCorta = [strDescCorta stringByAppendingString:[[data3_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString: @"~"]];
    strDescCorta = [strDescCorta stringByAppendingString:[data4_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    
    NSString *strDescLarga = [[data1_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString: @"~"];
    strDescLarga = [strDescLarga stringByAppendingString:[[data2_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString: @"~"]];
    strDescLarga = [strDescLarga stringByAppendingString:[[data3_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAppendingString: @"~"]];
    strDescLarga = [strDescLarga stringByAppendingString:[data4_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    
    
    //by  section
    
    switch (value) {
        case 0:
            [ConfigManager setDescriptionShort1:strDescCorta];
            [ConfigManager setDescriptionLarge1:strDescLarga];
            break;
        case 1:
            [ConfigManager setDescriptionShortAhorros1:strDescCorta];
            [ConfigManager setDescriptionLargeAhorros1:strDescLarga];
            break;
        case 2:
            [ConfigManager setDescriptionShortEgresos1:strDescCorta];
            [ConfigManager setDescriptionLargeEgresos1:strDescLarga];
            break;
        case 3:
            [ConfigManager setDescriptionShortCostos:strDescCorta];
            [ConfigManager setDescriptionLargeCostos:strDescLarga];
            break;
        case 4:
            [ConfigManager setDescriptionShortInversion:strDescCorta];
            [ConfigManager setDescriptionLargeInversion:strDescLarga];
            break;
        case 5:
            [ConfigManager setDescriptionShortBeneficios:strDescCorta];
            [ConfigManager setDescriptionLargeBeneficios:strDescLarga];
            break;
        case 6:
            [ConfigManager setDescriptionShortImpactos:strDescCorta];
            [ConfigManager setDescriptionLargeImpactos:strDescLarga];
            break;
        case 7:
            [ConfigManager setDescriptionShortRiesgos:strDescCorta];
            [ConfigManager setDescriptionLargeRiesgos:strDescLarga];
            break;
        default:
            break;
    }
}

#pragma mark UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
   
        if (textView == data2_1) {
            NSInteger offset = view2.frame.origin.y - view1.frame.origin.y;
            scrollView.contentOffset = CGPointMake(0, offset);
        }
        if (textView == data2_2) {
            NSInteger offset = view2.frame.origin.y - view1.frame.origin.y;
            scrollView.contentOffset = CGPointMake(0, offset);
        }
        if (textView == data3_1) {
            NSInteger offset = view3.frame.origin.y - view1.frame.origin.y;
            scrollView.contentOffset = CGPointMake(0, offset);
        }
    
        if (textView == data3_2) {
            NSInteger offset = view3.frame.origin.y - view1.frame.origin.y;
            scrollView.contentOffset = CGPointMake(0, offset);
        }
    
        if (textView == data4_1) {
            NSInteger offset = view4.frame.origin.y - view1.frame.origin.y;
            scrollView.contentOffset = CGPointMake(0, offset);
        }
    
        if (textView == data4_2) {
            NSInteger offset = view4.frame.origin.y - view1.frame.origin.y;
            scrollView.contentOffset = CGPointMake(0, offset);
        }
   // }
    return YES;
}

- (IBAction)helpBtnClick:(id)sender {
    HelpViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"help_view"];
    if (self.parentIndex!=3) {
        menuView.helpText = [[[[Attributes getDescription:self.parentIndex] objectAtIndex:self.i] objectAtIndex:self.j] objectAtIndex:0];
    } else {
        menuView.helpText = [[Attributes getDescription:3] objectAtIndex:0];
    }
    
    menuView.titleText = self.titleText;
    [self.navigationController pushViewController: menuView animated:YES];
}

- (IBAction)help1BtnClick:(id)sender {
    HelpViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"help_view"];
    if (self.parentIndex!=3) {
        menuView.helpText = [[[[Attributes getDescription:self.parentIndex] objectAtIndex:self.i] objectAtIndex:self.j] objectAtIndex:1];
    } else {
        menuView.helpText = [[Attributes getDescription:3] objectAtIndex:1];
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
