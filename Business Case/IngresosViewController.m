//
//  IngresosViewController.m
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "IngresosViewController.h"
#import "ConfigManager.h"
#import "DBAdapter.h"
#import "Attributes.h"
#import "HelpViewController.h"
#import "InstantViewController.h"

@interface IngresosViewController ()

@end

@implementation IngresosViewController
@synthesize view1, view2, view3,view4, view5,view6, view7,view8;
@synthesize scrollView;
@synthesize data1_1, data1_2, data2_1,data2_2, data3_1, data3_2, data4_1, data4_2, data5_1, data5_2, data6_1, data6_2, data7_1, data7_2, data8_1, data8_2;
@synthesize i,  j;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.saveBtn.layer.cornerRadius = 3;
    // Do any additional setup after loading the view.
    [scrollView setExclusiveTouch:YES];
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, 1000)];
    
    data_nums1 = [[NSArray alloc]init];
    data_nums2 = [[NSArray alloc]init];
    [self selectViewAndSetTitle];
    [self showViews];
    
    if (self.isHelp) {
        CGRect oRect = self.scrollView.frame;
        self.scrollView.frame = CGRectMake(oRect.origin.x, oRect.origin.y-50, oRect.size.width, oRect.size.height+50);
        self.toolView.hidden = YES;
    }
    
    if (!self.j) self.j = 0;
    
    InstantViewController *instantController = [self. storyboard instantiateViewControllerWithIdentifier:@"instant_view"];
    instantController.descText = [[Attributes getHelp:self.parentIndex] objectAtIndex:self.i];
//    if (self.parentIndex) {
//        instantController.descText = [[[Attributes getHelp:self.parentIndex] objectAtIndex:self.i] objectAtIndex:0];
//    } else {
//        instantController.descText = [[Attributes getHelp:3] objectAtIndex:0];
//    }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void) selectViewAndSetTitle{
    if (i == 2) {
        val = 2;
    } else{
        switch (j) {
            case 0:
                if (i == 0) {
                    val = 0;
                }
                if (i == 1) {
                    val = 1;
                }
                break;
            case  1:
                if (i == 0) {
                    val = 3;
                }
                if (i == 1) {
                    val = 4;
                }
                break;
            default:
                break;
        }
    }

}

-(void)showViews{
    switch (val) {
        case 0:
            if (![[ConfigManager getVariable] isEqualToString:@""] && ![[ConfigManager getValor] isEqualToString:@""]) {
                
                data_nums1 = [[ConfigManager getVariable] componentsSeparatedByString:@"~"];
                data_nums2 = [[ConfigManager getValor] componentsSeparatedByString:@"~"];
                
                if (![data_nums1[0] isEqualToString:@""] || ![data_nums2[0] isEqualToString:@""]) {
                    view1.hidden = NO;
                    showview_Num = 1;
                }
                if (![data_nums1[1] isEqualToString:@""] || ![data_nums2[1] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    showview_Num = 2;
                }
                if (![data_nums1[2] isEqualToString:@""] || ![data_nums2[2] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    showview_Num = 3;
                }
                if (![data_nums1[3] isEqualToString:@""] || ![data_nums2[3] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    showview_Num = 4;
                }
                if (![data_nums1[4] isEqualToString:@""] || ![data_nums2[4] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    showview_Num = 5;
                }
                if (![data_nums1[5] isEqualToString:@""] || ![data_nums2[5] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    view6.hidden = NO;
                    showview_Num = 6;
                }
                if (![data_nums1[6] isEqualToString:@""] || ![data_nums2[6] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    view6.hidden = NO;
                    view7.hidden = NO;
                    showview_Num = 7;
                }
                if (![data_nums1[7] isEqualToString:@""] || ![data_nums2[7] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    view6.hidden = NO;
                    view7.hidden = NO;
                    view8.hidden = NO;
                    showview_Num = 8;
                }
            }
            break;
            
        case 1:
            if (![[ConfigManager getEgrossVariable] isEqualToString:@""] && ![[ConfigManager getEgrossValor] isEqualToString:@""]) {
                
                data_nums1 = [[ConfigManager getEgrossVariable] componentsSeparatedByString:@"~"];
                data_nums2 = [[ConfigManager getEgrossValor] componentsSeparatedByString:@"~"];
                
                if (![data_nums1[0] isEqualToString:@""] || ![data_nums2[0] isEqualToString:@""]) {
                    view1.hidden = NO;
                    showview_Num = 1;
                }
                if (![data_nums1[1] isEqualToString:@""] || ![data_nums2[1] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    showview_Num = 2;
                }
                if (![data_nums1[2] isEqualToString:@""] || ![data_nums2[2] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    showview_Num = 3;
                }
                if (![data_nums1[3] isEqualToString:@""] || ![data_nums2[3] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    showview_Num = 4;
                }
                if (![data_nums1[4] isEqualToString:@""] || ![data_nums2[4] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    showview_Num = 5;
                }
                if (![data_nums1[5] isEqualToString:@""] || ![data_nums2[5] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    view6.hidden = NO;
                    showview_Num = 6;
                }
                if (![data_nums1[6] isEqualToString:@""] || ![data_nums2[6] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    view6.hidden = NO;
                    view7.hidden = NO;
                    showview_Num = 7;
                }
                if (![data_nums1[7] isEqualToString:@""] || ![data_nums2[7] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    view6.hidden = NO;
                    view7.hidden = NO;
                    view8.hidden = NO;
                    showview_Num = 8;
                }
            }
            break;
            
        case 2:
            if (![[ConfigManager getInversionVariable] isEqualToString:@""] && ![[ConfigManager getInversionValor] isEqualToString:@""]) {
                
                data_nums1 = [[ConfigManager getInversionVariable] componentsSeparatedByString:@"~"];
                data_nums2 = [[ConfigManager getInversionValor] componentsSeparatedByString:@"~"];
                
                if (![data_nums1[0] isEqualToString:@""] || ![data_nums2[0] isEqualToString:@""]) {
                    view1.hidden = NO;
                    showview_Num = 1;
                }
                if (![data_nums1[1] isEqualToString:@""] || ![data_nums2[1] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    showview_Num = 2;
                }
                if (![data_nums1[2] isEqualToString:@""] || ![data_nums2[2] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    showview_Num = 3;
                }
                if (![data_nums1[3] isEqualToString:@""] || ![data_nums2[3] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    showview_Num = 4;
                }
                if (![data_nums1[4] isEqualToString:@""] || ![data_nums2[4] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    showview_Num = 5;
                }
                if (![data_nums1[5] isEqualToString:@""] || ![data_nums2[5] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    view6.hidden = NO;
                    showview_Num = 6;
                }
                if (![data_nums1[6] isEqualToString:@""] || ![data_nums2[6] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    view6.hidden = NO;
                    view7.hidden = NO;
                    showview_Num = 7;
                }
                if (![data_nums1[7] isEqualToString:@""] || ![data_nums2[7] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    view6.hidden = NO;
                    view7.hidden = NO;
                    view8.hidden = NO;
                    showview_Num = 8;
                }
            }
            break;
        case 3:
            if (![[ConfigManager getAhorrosVariable] isEqualToString:@""] && ![[ConfigManager getAhorrosValor] isEqualToString:@""]) {
                
                data_nums1 = [[ConfigManager getAhorrosVariable] componentsSeparatedByString:@"~"];
                data_nums2 = [[ConfigManager getAhorrosValor] componentsSeparatedByString:@"~"];
                
                if (![data_nums1[0] isEqualToString:@""] || ![data_nums2[0] isEqualToString:@""]) {
                    view1.hidden = NO;
                    showview_Num = 1;
                }
                if (![data_nums1[1] isEqualToString:@""] || ![data_nums2[1] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    showview_Num = 2;
                }
                if (![data_nums1[2] isEqualToString:@""] || ![data_nums2[2] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    showview_Num = 3;
                }
                if (![data_nums1[3] isEqualToString:@""] || ![data_nums2[3] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    showview_Num = 4;
                }
                if (![data_nums1[4] isEqualToString:@""] || ![data_nums2[4] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    showview_Num = 5;
                }
                if (![data_nums1[5] isEqualToString:@""] || ![data_nums2[5] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    view6.hidden = NO;
                    showview_Num = 6;
                }
                if (![data_nums1[6] isEqualToString:@""] || ![data_nums2[6] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    view6.hidden = NO;
                    view7.hidden = NO;
                    showview_Num = 7;
                }
                if (![data_nums1[7] isEqualToString:@""] || ![data_nums2[7] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    view6.hidden = NO;
                    view7.hidden = NO;
                    view8.hidden = NO;
                    showview_Num = 8;
                }
            }

            break;
            
            case 4:
            if (![[ConfigManager getCostosVariable] isEqualToString:@""] && ![[ConfigManager getCostosValor] isEqualToString:@""]) {
                
                data_nums1 = [[ConfigManager getCostosVariable] componentsSeparatedByString:@"~"];
                data_nums2 = [[ConfigManager getCostosValor] componentsSeparatedByString:@"~"];
                
                if (![data_nums1[0] isEqualToString:@""] || ![data_nums2[0] isEqualToString:@""]) {
                    view1.hidden = NO;
                    showview_Num = 1;
                }
                if (![data_nums1[1] isEqualToString:@""] || ![data_nums2[1] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    showview_Num = 2;
                }
                if (![data_nums1[2] isEqualToString:@""] || ![data_nums2[2] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    showview_Num = 3;
                }
                if (![data_nums1[3] isEqualToString:@""] || ![data_nums2[3] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    showview_Num = 4;
                }
                if (![data_nums1[4] isEqualToString:@""] || ![data_nums2[4] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    showview_Num = 5;
                }
                if (![data_nums1[5] isEqualToString:@""] || ![data_nums2[5] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    view6.hidden = NO;
                    showview_Num = 6;
                }
                if (![data_nums1[6] isEqualToString:@""] || ![data_nums2[6] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    view6.hidden = NO;
                    view7.hidden = NO;
                    showview_Num = 7;
                }
                if (![data_nums1[7] isEqualToString:@""] || ![data_nums2[7] isEqualToString:@""]) {
                    view1.hidden = NO;
                    view2.hidden = NO;
                    view3.hidden = NO;
                    view4.hidden = NO;
                    view5.hidden = NO;
                    view6.hidden = NO;
                    view7.hidden = NO;
                    view8.hidden = NO;
                    showview_Num = 8;
                }
            }

            
        default:
            break;
    }
    [self setvalueOf];
}
- (void) setvalueOf{
    switch (val) {
        case 0:
            if (![[ConfigManager getVariable] isEqualToString:@""]) {
                data1_1.text = [[ConfigManager getVariable] componentsSeparatedByString:@"~"][0];
                data2_1.text = [[ConfigManager getVariable] componentsSeparatedByString:@"~"][1];
                data3_1.text = [[ConfigManager getVariable] componentsSeparatedByString:@"~"][2];
                data4_1.text = [[ConfigManager getVariable] componentsSeparatedByString:@"~"][3];
                data5_1.text = [[ConfigManager getVariable] componentsSeparatedByString:@"~"][4];
                data6_1.text = [[ConfigManager getVariable] componentsSeparatedByString:@"~"][5];
                data7_1.text = [[ConfigManager getVariable] componentsSeparatedByString:@"~"][6];
                data8_1.text = [[ConfigManager getVariable] componentsSeparatedByString:@"~"][7];

            }
            if (![[ConfigManager getValor] isEqualToString:@""]) {
                data1_2.text=[[ConfigManager getValor] componentsSeparatedByString:@"~"][0];
                data2_2.text=[[ConfigManager getValor] componentsSeparatedByString:@"~"][1];
                data3_2.text=[[ConfigManager getValor] componentsSeparatedByString:@"~"][2];
                data4_2.text=[[ConfigManager getValor] componentsSeparatedByString:@"~"][3];
                data5_2.text=[[ConfigManager getValor] componentsSeparatedByString:@"~"][4];
                data6_2.text=[[ConfigManager getValor] componentsSeparatedByString:@"~"][5];
                data7_2.text=[[ConfigManager getValor] componentsSeparatedByString:@"~"][6];
                data8_2.text=[[ConfigManager getValor] componentsSeparatedByString:@"~"][7];
            }

            break;
        
        case 1:
            if (![[ConfigManager getEgrossVariable] isEqualToString:@""]) {
                data1_1.text = [[ConfigManager getEgrossVariable] componentsSeparatedByString:@"~"][0];
                data2_1.text = [[ConfigManager getEgrossVariable] componentsSeparatedByString:@"~"][1];
                data3_1.text = [[ConfigManager getEgrossVariable] componentsSeparatedByString:@"~"][2];
                data4_1.text = [[ConfigManager getEgrossVariable] componentsSeparatedByString:@"~"][3];
                data5_1.text = [[ConfigManager getEgrossVariable] componentsSeparatedByString:@"~"][4];
                data6_1.text = [[ConfigManager getEgrossVariable] componentsSeparatedByString:@"~"][5];
                data7_1.text = [[ConfigManager getEgrossVariable] componentsSeparatedByString:@"~"][6];
                data8_1.text = [[ConfigManager getEgrossVariable] componentsSeparatedByString:@"~"][7];
                
            }
            if (![[ConfigManager getEgrossValor] isEqualToString:@""]) {
                data1_2.text=[[ConfigManager getEgrossValor] componentsSeparatedByString:@"~"][0];
                data2_2.text=[[ConfigManager getEgrossValor] componentsSeparatedByString:@"~"][1];
                data3_2.text=[[ConfigManager getEgrossValor] componentsSeparatedByString:@"~"][2];
                data4_2.text=[[ConfigManager getEgrossValor] componentsSeparatedByString:@"~"][3];
                data5_2.text=[[ConfigManager getEgrossValor] componentsSeparatedByString:@"~"][4];
                data6_2.text=[[ConfigManager getEgrossValor] componentsSeparatedByString:@"~"][5];
                data7_2.text=[[ConfigManager getEgrossValor] componentsSeparatedByString:@"~"][6];
                data8_2.text=[[ConfigManager getEgrossValor] componentsSeparatedByString:@"~"][7];
            }

            break;
            
        case 2:
            if (![[ConfigManager getInversionVariable] isEqualToString:@""]) {
                data1_1.text = [[ConfigManager getInversionVariable] componentsSeparatedByString:@"~"][0];
                data2_1.text = [[ConfigManager getInversionVariable] componentsSeparatedByString:@"~"][1];
                data3_1.text = [[ConfigManager getInversionVariable] componentsSeparatedByString:@"~"][2];
                data4_1.text = [[ConfigManager getInversionVariable] componentsSeparatedByString:@"~"][3];
                data5_1.text = [[ConfigManager getInversionVariable] componentsSeparatedByString:@"~"][4];
                data6_1.text = [[ConfigManager getInversionVariable] componentsSeparatedByString:@"~"][5];
                data7_1.text = [[ConfigManager getInversionVariable] componentsSeparatedByString:@"~"][6];
                data8_1.text = [[ConfigManager getInversionVariable] componentsSeparatedByString:@"~"][7];
                
            }
            if (![[ConfigManager getInversionValor] isEqualToString:@""]) {
                data1_2.text=[[ConfigManager getInversionValor] componentsSeparatedByString:@"~"][0];
                data2_2.text=[[ConfigManager getInversionValor] componentsSeparatedByString:@"~"][1];
                data3_2.text=[[ConfigManager getInversionValor] componentsSeparatedByString:@"~"][2];
                data4_2.text=[[ConfigManager getInversionValor] componentsSeparatedByString:@"~"][3];
                data5_2.text=[[ConfigManager getInversionValor] componentsSeparatedByString:@"~"][4];
                data6_2.text=[[ConfigManager getInversionValor] componentsSeparatedByString:@"~"][5];
                data7_2.text=[[ConfigManager getInversionValor] componentsSeparatedByString:@"~"][6];
                data8_2.text=[[ConfigManager getInversionValor] componentsSeparatedByString:@"~"][7];
            }

            break;
            
        case 3:
            if (![[ConfigManager getAhorrosVariable] isEqualToString:@""]) {
                data1_1.text = [[ConfigManager getAhorrosVariable] componentsSeparatedByString:@"~"][0];
                data2_1.text = [[ConfigManager getAhorrosVariable] componentsSeparatedByString:@"~"][1];
                data3_1.text = [[ConfigManager getAhorrosVariable] componentsSeparatedByString:@"~"][2];
                data4_1.text = [[ConfigManager getAhorrosVariable] componentsSeparatedByString:@"~"][3];
                data5_1.text = [[ConfigManager getAhorrosVariable] componentsSeparatedByString:@"~"][4];
                data6_1.text = [[ConfigManager getAhorrosVariable] componentsSeparatedByString:@"~"][5];
                data7_1.text = [[ConfigManager getAhorrosVariable] componentsSeparatedByString:@"~"][6];
                data8_1.text = [[ConfigManager getAhorrosVariable] componentsSeparatedByString:@"~"][7];
                
            }
            if (![[ConfigManager getAhorrosValor] isEqualToString:@""]) {
                data1_2.text=[[ConfigManager getAhorrosValor] componentsSeparatedByString:@"~"][0];
                data2_2.text=[[ConfigManager getAhorrosValor] componentsSeparatedByString:@"~"][1];
                data3_2.text=[[ConfigManager getAhorrosValor] componentsSeparatedByString:@"~"][2];
                data4_2.text=[[ConfigManager getAhorrosValor] componentsSeparatedByString:@"~"][3];
                data5_2.text=[[ConfigManager getAhorrosValor] componentsSeparatedByString:@"~"][4];
                data6_2.text=[[ConfigManager getAhorrosValor] componentsSeparatedByString:@"~"][5];
                data7_2.text=[[ConfigManager getAhorrosValor] componentsSeparatedByString:@"~"][6];
                data8_2.text=[[ConfigManager getAhorrosValor] componentsSeparatedByString:@"~"][7];
            }

            break;
            
        case 4:
            if (![[ConfigManager getCostosVariable] isEqualToString:@""]) {
                data1_1.text = [[ConfigManager getCostosVariable] componentsSeparatedByString:@"~"][0];
                data2_1.text = [[ConfigManager getCostosVariable] componentsSeparatedByString:@"~"][1];
                data3_1.text = [[ConfigManager getCostosVariable] componentsSeparatedByString:@"~"][2];
                data4_1.text = [[ConfigManager getCostosVariable] componentsSeparatedByString:@"~"][3];
                data5_1.text = [[ConfigManager getCostosVariable] componentsSeparatedByString:@"~"][4];
                data6_1.text = [[ConfigManager getCostosVariable] componentsSeparatedByString:@"~"][5];
                data7_1.text = [[ConfigManager getCostosVariable] componentsSeparatedByString:@"~"][6];
                data8_1.text = [[ConfigManager getCostosVariable] componentsSeparatedByString:@"~"][7];
                
            }
            if (![[ConfigManager getCostosValor] isEqualToString:@""]) {
                data1_2.text=[[ConfigManager getCostosValor] componentsSeparatedByString:@"~"][0];
                data2_2.text=[[ConfigManager getCostosValor] componentsSeparatedByString:@"~"][1];
                data3_2.text=[[ConfigManager getCostosValor] componentsSeparatedByString:@"~"][2];
                data4_2.text=[[ConfigManager getCostosValor] componentsSeparatedByString:@"~"][3];
                data5_2.text=[[ConfigManager getCostosValor] componentsSeparatedByString:@"~"][4];
                data6_2.text=[[ConfigManager getCostosValor] componentsSeparatedByString:@"~"][5];
                data7_2.text=[[ConfigManager getCostosValor] componentsSeparatedByString:@"~"][6];
                data8_2.text=[[ConfigManager getCostosValor] componentsSeparatedByString:@"~"][7];
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

- (IBAction)addBtn_Clicked:(id)sender {
    if (showview_Num == 0) {
        view1.hidden = NO;
        showview_Num ++;
        return;
    }
    if (showview_Num == 1) {
        view2.hidden = NO;
        showview_Num ++;
        return;
    }
    if (showview_Num == 2) {
        view3.hidden = NO;
        showview_Num ++;
        return;
    }
    if (showview_Num == 3) {
        view4.hidden = NO;
        showview_Num ++;
            return;
    }
    if (showview_Num == 4) {
        view5.hidden = NO;
        showview_Num ++;
            return;
    }
    
    if (showview_Num == 5) {
        view6.hidden = NO;
        showview_Num ++;
            return;
    }
    if(showview_Num == 6){
        view7.hidden = NO;
        showview_Num ++;
            return;
    }
    if (showview_Num == 7) {
        view8.hidden = NO;
        showview_Num ++;
            return;
    }
}

- (IBAction)delBtn_Clicked:(id)sender {
    if (showview_Num == 8) {
        view8.hidden = YES;
        showview_Num --;
        return;
    }
    
    if (showview_Num == 7) {
        view7.hidden = YES;
        showview_Num --;
                return;
    }
    if (showview_Num ==6) {
        view6.hidden = YES;
        showview_Num --;
                return;
    }
    if (showview_Num == 5) {
        view5.hidden = YES;
        showview_Num --;
                return;
    }
    
    if (showview_Num == 4) {
        view4.hidden = YES;
        showview_Num --;
                return;
    }
    
    if (showview_Num == 3) {
        view3.hidden = YES;
        showview_Num --;
                return;
    }
    if (showview_Num == 2) {
        view2.hidden = YES;
        showview_Num--;
                return;
    }
    if (showview_Num == 1) {
        view1.hidden = YES;
        showview_Num --;
        return;
    }
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

- (IBAction)saveBtn_Clicked:(id)sender {
    [self saveConfig];
    [DBAdapter updateFileData:[DBAdapter getDbFilePath]];
}

- (void) saveConfig{
    NSString *strVariable = [[data1_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"];
    strVariable = [strVariable stringByAppendingString:[[data2_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    strVariable = [strVariable stringByAppendingString:[[data3_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    strVariable = [strVariable stringByAppendingString:[[data4_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    strVariable = [strVariable stringByAppendingString:[[data5_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    strVariable = [strVariable stringByAppendingString:[[data6_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    strVariable = [strVariable stringByAppendingString:[[data7_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    strVariable = [strVariable stringByAppendingString:[data8_1.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    
    
    NSString *strValue = [[data1_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"];
    strValue = [strValue stringByAppendingString:[[data2_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    strValue = [strValue stringByAppendingString:[[data3_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    strValue = [strValue stringByAppendingString:[[data4_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    strValue = [strValue stringByAppendingString:[[data5_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    strValue = [strValue stringByAppendingString:[[data6_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    strValue = [strValue stringByAppendingString:[[data7_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByAppendingString: @"~"]];
    strValue = [strValue stringByAppendingString:[data8_2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    
    switch (val) {
        case 0:
            [ConfigManager setVariable : strVariable];
            [ConfigManager setValor : strValue];
            break;
            
        case 1:
            [ConfigManager setEgrossVariable : strVariable];
            [ConfigManager setEgrossValor : strValue];
            break;
            
        case 2:
            [ConfigManager setInversionVariable : strVariable];
            [ConfigManager setInversionValor : strValue];
            break;
            
        case 3:
            [ConfigManager setAhorrosVariable : strVariable];
            [ConfigManager setAhorrosValor : strValue];
            break;
            
        case 4:
            [ConfigManager setCostosVariable : strVariable];
            [ConfigManager setCostosValor : strValue];
            break;
            
        default:
            break;
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [self saveConfig];
}

- (IBAction)helpBtnClick:(id)sender {
    HelpViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"help_view"];
    menuView.helpText = [[Attributes getDescription:self.parentIndex] objectAtIndex:self.i];
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
