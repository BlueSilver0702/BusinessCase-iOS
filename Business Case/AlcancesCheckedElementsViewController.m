//
//  AlcancesCheckedElementsViewController.m
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "AlcancesCheckedElementsViewController.h"
#import "ConfigManager.h"
#import "DBAdapter.h"
#import "Attributes.h"
#import "HelpViewController.h"


@interface AlcancesCheckedElementsViewController ()

@end

@implementation AlcancesCheckedElementsViewController
@synthesize data1, data10,data11,data12,data13,data2,data3,data4,data5,data6,data7,data8,data9;
@synthesize view1,view10,view11,view12,view13,view2,view3,view4,view5,view6,view7,view8,view9;
@synthesize showviewLists;
@synthesize scrollview;
NSArray *lists;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.savebtn.layer.cornerRadius = 3;
    [scrollview setContentSize:CGSizeMake(scrollview.frame.size.width, 1500)];
    // Do any additional setup after loading the view.
    lists  = [[NSArray alloc] initWithObjects:@"Tiempo",@"Capacidad instalada",@"Horarios de operacion",@"Cobertura geografic",@"Productos y servicios a comercializar",@"Moneda",@"Distribución",@"Almacenamiento",@"Edificaciones",@"Capital Requerido",@"Otro1",@"Otro2",@"Otro3", nil];
    [self setTextViewBorder];
    [self initViews];
    
    if (self.isHelp) {
        CGRect oRect = self.scrollview.frame;
        self.scrollview.frame = CGRectMake(oRect.origin.x, oRect.origin.y-50, oRect.size.width, oRect.size.height+50);
        self.toolView.hidden = YES;
    }
    
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
- (void) setTextViewBorder{
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
    
    data5.layer.borderColor = border_color.CGColor;
    data5.layer.borderWidth = 1.0;
    data5.layer.cornerRadius = 3.0;
    
    data6.layer.borderColor = border_color.CGColor;
    data6.layer.borderWidth = 1.0;
    data6.layer.cornerRadius = 3.0;
    
    data7.layer.borderColor = border_color.CGColor;
    data7.layer.borderWidth = 1.0;
    data7.layer.cornerRadius = 3.0;
    
    data8.layer.borderColor = border_color.CGColor;
    data8.layer.borderWidth = 1.0;
    data8.layer.cornerRadius = 3.0;
    
    data9.layer.borderColor = border_color.CGColor;
    data9.layer.borderWidth = 1.0;
    data9.layer.cornerRadius = 3.0;
    
    data10.layer.borderColor = border_color.CGColor;
    data10.layer.borderWidth = 1.0;
    data10.layer.cornerRadius = 3.0;
    
    data11.layer.borderColor = border_color.CGColor;
    data11.layer.borderWidth = 1.0;
    data11.layer.cornerRadius = 3.0;
    
    data12.layer.borderColor = border_color.CGColor;
    data12.layer.borderWidth = 1.0;
    data12.layer.cornerRadius = 3.0;
    
    data13.layer.borderColor = border_color.CGColor;
    data13.layer.borderWidth = 1.0;
    data13.layer.cornerRadius = 3.0;
    
}

- (void) initViews{
    if ([[showviewLists valueForKey:[lists objectAtIndex:0]] isEqualToString:@"0"]) {
        view1.hidden = YES;
        [self moveViews: 0];
    }else{
        view1.hidden = NO;
        data1.text = [[ConfigManager getAlcancesYLimits] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    if ([[showviewLists valueForKey:[lists objectAtIndex:1]] isEqualToString:@"0"]) {
        view2.hidden = YES;
        [self moveViews: 1];
    } else{
        view2.hidden = NO;
        data2.text = [[ConfigManager getAlcancesYLimitsCapcidad] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    if ([[showviewLists valueForKey:[lists objectAtIndex:2]] isEqualToString:@"0"]) {
        view3.hidden = YES;
        [self moveViews: 2];
    } else{
        view3.hidden = NO;
        data3.text = [[ConfigManager getAlcancesYLimitsHorarios] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    if ([[showviewLists valueForKey:[lists objectAtIndex:3]] isEqualToString:@"0"]) {
        view4.hidden = YES;
        [self moveViews: 3];
    } else{
        view4.hidden = NO;
        data4.text = [[ConfigManager getAlcancesYLimitsCobertura] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    if ([[showviewLists valueForKey:[lists objectAtIndex:4]] isEqualToString:@"0"]) {
        view5.hidden = YES;
        [self moveViews: 4];
    } else{
        view5.hidden = NO;
        data5.text = [[ConfigManager getAlcancesYLimitsComercial] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }

    if ([[showviewLists valueForKey:[lists objectAtIndex:5]] isEqualToString:@"0"]) {
        view6.hidden = YES;
        [self moveViews: 5];
    } else{
        view6.hidden = NO;
        data6.text = [[ConfigManager getAlcancesYLimitsPersonal] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }

    if ([[showviewLists valueForKey:[lists objectAtIndex:6]] isEqualToString:@"0"]) {
        view7.hidden = YES;
        [self moveViews: 6];
    } else{
        view7.hidden = NO;
        data7.text= [[ConfigManager getAlcancesYLimitsDemanda] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    if ([[showviewLists valueForKey:[lists objectAtIndex:7]] isEqualToString:@"0"]) {
        view8.hidden = YES;
        [self moveViews: 7];
    } else{
        view8.hidden = NO;
        data8.text = [[ConfigManager getAlcancesYLimitsDuracion] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }

    if ([[showviewLists valueForKey:[lists objectAtIndex:8]] isEqualToString:@"0"]) {
        view9.hidden = YES;
        [self moveViews: 8];
    } else{
        view9.hidden = NO;
        data9.text = [[ConfigManager getAlcancesYLimitsSegmen] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    if ([[showviewLists valueForKey:[lists objectAtIndex:9]] isEqualToString:@"0"]) {
        view10.hidden = YES;
        [self moveViews: 9];
    } else{
        view10.hidden = NO;
        data10.text = [[ConfigManager getAlcancesYLimitsTechnologia] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    if ([[showviewLists valueForKey:[lists objectAtIndex:10]] isEqualToString:@"0"]) {
        view11.hidden = YES;
        [self moveViews: 10];
    } else{
        view11.hidden = NO;
        data11.text = [[ConfigManager getAlcancesYLimitsOtro1] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    if ([[showviewLists valueForKey:[lists objectAtIndex:11]] isEqualToString:@"0"]) {
        view12.hidden = YES;
        [self moveViews: 11];
    } else{
        view12.hidden = NO;
        data12.text = [[ConfigManager getAlcancesYLimitsOtro2] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    if ([[showviewLists valueForKey:[lists objectAtIndex:12]] isEqualToString:@"0"]) {
        view13.hidden = YES;
//        [self moveViews: 12];
    } else{
        view13.hidden = NO;
        data13.text  = [[ConfigManager getAlcancesYLimitsOtro3] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }

    
}

- (void) moveViews : (NSInteger) i{
    CGFloat dt1 = view1.frame.size.height;
    CGFloat dt2 = view2.frame.size.height;
    CGFloat dt3 = view3.frame.size.height;
    CGFloat dt4 = view4.frame.size.height;
    CGFloat dt5 = view5.frame.size.height;
    CGFloat dt6 = view6.frame.size.height;
    CGFloat dt7 = view7.frame.size.height;
    CGFloat dt8 = view8.frame.size.height;
    CGFloat dt9 = view9.frame.size.height;
    CGFloat dt10 = view10.frame.size.height;
    CGFloat dt11 = view11.frame.size.height;
    CGFloat dt12 = view12.frame.size.height;
    CGFloat dt13 = view13.frame.size.height;
    switch (i) {
        case 0:
            [view2 setFrame:CGRectMake(view2.frame.origin.x, view2.frame.origin.y-dt1,  view2.frame.size.width, view2.frame.size.height)];
            [view3 setFrame:CGRectMake(view3.frame.origin.x, view3.frame.origin.y-dt1,  view3.frame.size.width, view3.frame.size.height)];
            [view4 setFrame:CGRectMake(view4.frame.origin.x, view4.frame.origin.y-dt1,  view4.frame.size.width, view4.frame.size.height)];
            [view5 setFrame:CGRectMake(view5.frame.origin.x, view5.frame.origin.y-dt1,  view5.frame.size.width, view5.frame.size.height)];
            [view6 setFrame:CGRectMake(view6.frame.origin.x, view6.frame.origin.y-dt1,  view6.frame.size.width, view6.frame.size.height)];
            [view7 setFrame:CGRectMake(view7.frame.origin.x, view7.frame.origin.y-dt1,  view7.frame.size.width, view7.frame.size.height)];
            [view8 setFrame:CGRectMake(view8.frame.origin.x, view8.frame.origin.y-dt1,  view8.frame.size.width, view8.frame.size.height)];
            [view9 setFrame:CGRectMake(view9.frame.origin.x, view9.frame.origin.y-dt1,  view9.frame.size.width, view9.frame.size.height)];
            [view10 setFrame:CGRectMake(view10.frame.origin.x, view10.frame.origin.y-dt1,  view10.frame.size.width, view10.frame.size.height)];
            [view11 setFrame:CGRectMake(view11.frame.origin.x, view11.frame.origin.y-dt1,  view11.frame.size.width, view11.frame.size.height)];
            [view12 setFrame:CGRectMake(view12.frame.origin.x, view12.frame.origin.y-dt1,  view12.frame.size.width, view12.frame.size.height)];
             [view13 setFrame:CGRectMake(view13.frame.origin.x, view13.frame.origin.y-dt1,  view13.frame.size.width, view13.frame.size.height)];
            break;
        case 1:
            [view3 setFrame:CGRectMake(view3.frame.origin.x, view3.frame.origin.y-dt2,  view3.frame.size.width, view3.frame.size.height)];
            [view4 setFrame:CGRectMake(view4.frame.origin.x, view4.frame.origin.y-dt2,  view4.frame.size.width, view4.frame.size.height)];
            [view5 setFrame:CGRectMake(view5.frame.origin.x, view5.frame.origin.y-dt2,  view5.frame.size.width, view5.frame.size.height)];
            [view6 setFrame:CGRectMake(view6.frame.origin.x, view6.frame.origin.y-dt2,  view6.frame.size.width, view6.frame.size.height)];
            [view7 setFrame:CGRectMake(view7.frame.origin.x, view7.frame.origin.y-dt2,  view7.frame.size.width, view7.frame.size.height)];
            [view8 setFrame:CGRectMake(view8.frame.origin.x, view8.frame.origin.y-dt2,  view8.frame.size.width, view8.frame.size.height)];
            [view9 setFrame:CGRectMake(view9.frame.origin.x, view9.frame.origin.y-dt2,  view9.frame.size.width, view9.frame.size.height)];
            [view10 setFrame:CGRectMake(view10.frame.origin.x, view10.frame.origin.y-dt2,  view10.frame.size.width, view10.frame.size.height)];
            [view11 setFrame:CGRectMake(view11.frame.origin.x, view11.frame.origin.y-dt2,  view11.frame.size.width, view11.frame.size.height)];
            [view12 setFrame:CGRectMake(view12.frame.origin.x, view12.frame.origin.y-dt2,  view12.frame.size.width, view12.frame.size.height)];
            [view13 setFrame:CGRectMake(view13.frame.origin.x, view13.frame.origin.y-dt2,  view13.frame.size.width, view13.frame.size.height)];
            break;
        case 2:
            [view4 setFrame:CGRectMake(view4.frame.origin.x, view4.frame.origin.y-dt3,  view4.frame.size.width, view4.frame.size.height)];
            [view5 setFrame:CGRectMake(view5.frame.origin.x, view5.frame.origin.y-dt3,  view5.frame.size.width, view5.frame.size.height)];
            [view6 setFrame:CGRectMake(view6.frame.origin.x, view6.frame.origin.y-dt3,  view6.frame.size.width, view6.frame.size.height)];
            [view7 setFrame:CGRectMake(view7.frame.origin.x, view7.frame.origin.y-dt3,  view7.frame.size.width, view7.frame.size.height)];
            [view8 setFrame:CGRectMake(view8.frame.origin.x, view8.frame.origin.y-dt3,  view8.frame.size.width, view8.frame.size.height)];
            [view9 setFrame:CGRectMake(view9.frame.origin.x, view9.frame.origin.y-dt3,  view9.frame.size.width, view9.frame.size.height)];
            [view10 setFrame:CGRectMake(view10.frame.origin.x, view10.frame.origin.y-dt3,  view10.frame.size.width, view10.frame.size.height)];
            [view11 setFrame:CGRectMake(view11.frame.origin.x, view11.frame.origin.y-dt3,  view11.frame.size.width, view11.frame.size.height)];
            [view12 setFrame:CGRectMake(view12.frame.origin.x, view12.frame.origin.y-dt3,  view12.frame.size.width, view12.frame.size.height)];
            [view13 setFrame:CGRectMake(view13.frame.origin.x, view13.frame.origin.y-dt3,  view13.frame.size.width, view13.frame.size.height)];
            break;
        case 3:
            [view5 setFrame:CGRectMake(view5.frame.origin.x, view5.frame.origin.y-dt4,  view5.frame.size.width, view5.frame.size.height)];
            [view6 setFrame:CGRectMake(view6.frame.origin.x, view6.frame.origin.y-dt4,  view6.frame.size.width, view6.frame.size.height)];
            [view7 setFrame:CGRectMake(view7.frame.origin.x, view7.frame.origin.y-dt4,  view7.frame.size.width, view7.frame.size.height)];
            [view8 setFrame:CGRectMake(view8.frame.origin.x, view8.frame.origin.y-dt4,  view8.frame.size.width, view8.frame.size.height)];
            [view9 setFrame:CGRectMake(view9.frame.origin.x, view9.frame.origin.y-dt4,  view9.frame.size.width, view9.frame.size.height)];
            [view10 setFrame:CGRectMake(view10.frame.origin.x, view10.frame.origin.y-dt4,  view10.frame.size.width, view10.frame.size.height)];
            [view11 setFrame:CGRectMake(view11.frame.origin.x, view11.frame.origin.y-dt4,  view11.frame.size.width, view11.frame.size.height)];
            [view12 setFrame:CGRectMake(view12.frame.origin.x, view12.frame.origin.y-dt4,  view12.frame.size.width, view12.frame.size.height)];
            [view13 setFrame:CGRectMake(view13.frame.origin.x, view13.frame.origin.y-dt4,  view13.frame.size.width, view13.frame.size.height)];
            break;
        case 4:
            [view6 setFrame:CGRectMake(view6.frame.origin.x, view6.frame.origin.y-dt5,  view6.frame.size.width, view6.frame.size.height)];
            [view7 setFrame:CGRectMake(view7.frame.origin.x, view7.frame.origin.y-dt5,  view7.frame.size.width, view7.frame.size.height)];
            [view8 setFrame:CGRectMake(view8.frame.origin.x, view8.frame.origin.y-dt5,  view8.frame.size.width, view8.frame.size.height)];
            [view9 setFrame:CGRectMake(view9.frame.origin.x, view9.frame.origin.y-dt5,  view9.frame.size.width, view9.frame.size.height)];
            [view10 setFrame:CGRectMake(view10.frame.origin.x, view10.frame.origin.y-dt5,  view10.frame.size.width, view10.frame.size.height)];
            [view11 setFrame:CGRectMake(view11.frame.origin.x, view11.frame.origin.y-dt5,  view11.frame.size.width, view11.frame.size.height)];
            [view12 setFrame:CGRectMake(view12.frame.origin.x, view12.frame.origin.y-dt5,  view12.frame.size.width, view12.frame.size.height)];
            [view13 setFrame:CGRectMake(view13.frame.origin.x, view13.frame.origin.y-dt5,  view13.frame.size.width, view13.frame.size.height)];
            break;
        case 5:
            [view7 setFrame:CGRectMake(view7.frame.origin.x, view7.frame.origin.y-dt6,  view7.frame.size.width, view7.frame.size.height)];
            [view8 setFrame:CGRectMake(view8.frame.origin.x, view8.frame.origin.y-dt6,  view8.frame.size.width, view8.frame.size.height)];
            [view9 setFrame:CGRectMake(view9.frame.origin.x, view9.frame.origin.y-dt6,  view9.frame.size.width, view9.frame.size.height)];
            [view10 setFrame:CGRectMake(view10.frame.origin.x, view10.frame.origin.y-dt6,  view10.frame.size.width, view10.frame.size.height)];
            [view11 setFrame:CGRectMake(view11.frame.origin.x, view11.frame.origin.y-dt6,  view11.frame.size.width, view11.frame.size.height)];
            [view12 setFrame:CGRectMake(view12.frame.origin.x, view12.frame.origin.y-dt6,  view12.frame.size.width, view12.frame.size.height)];
            [view13 setFrame:CGRectMake(view13.frame.origin.x, view13.frame.origin.y-dt6,  view13.frame.size.width, view13.frame.size.height)];
            break;
        case 6:
            [view8 setFrame:CGRectMake(view8.frame.origin.x, view8.frame.origin.y-dt7,  view8.frame.size.width, view8.frame.size.height)];
            [view9 setFrame:CGRectMake(view9.frame.origin.x, view9.frame.origin.y-dt7,  view9.frame.size.width, view9.frame.size.height)];
            [view10 setFrame:CGRectMake(view10.frame.origin.x, view10.frame.origin.y-dt7,  view10.frame.size.width, view10.frame.size.height)];
            [view11 setFrame:CGRectMake(view11.frame.origin.x, view11.frame.origin.y-dt7,  view11.frame.size.width, view11.frame.size.height)];
            [view12 setFrame:CGRectMake(view12.frame.origin.x, view12.frame.origin.y-dt7,  view12.frame.size.width, view12.frame.size.height)];
            [view13 setFrame:CGRectMake(view13.frame.origin.x, view13.frame.origin.y-dt7,  view13.frame.size.width, view13.frame.size.height)];
            break;
        case 7:
            [view9 setFrame:CGRectMake(view9.frame.origin.x, view9.frame.origin.y-dt8,  view9.frame.size.width, view9.frame.size.height)];
            [view10 setFrame:CGRectMake(view10.frame.origin.x, view10.frame.origin.y-dt8,  view10.frame.size.width, view10.frame.size.height)];
            [view11 setFrame:CGRectMake(view11.frame.origin.x, view11.frame.origin.y-dt8,  view11.frame.size.width, view11.frame.size.height)];
            [view12 setFrame:CGRectMake(view12.frame.origin.x, view12.frame.origin.y-dt8,  view12.frame.size.width, view12.frame.size.height)];
            [view13 setFrame:CGRectMake(view13.frame.origin.x, view13.frame.origin.y-dt8,  view13.frame.size.width, view13.frame.size.height)];
            break;
        case 8:
            [view10 setFrame:CGRectMake(view10.frame.origin.x, view10.frame.origin.y-dt9,  view10.frame.size.width, view10.frame.size.height)];
            [view11 setFrame:CGRectMake(view11.frame.origin.x, view11.frame.origin.y-dt9,  view11.frame.size.width, view11.frame.size.height)];
            [view12 setFrame:CGRectMake(view12.frame.origin.x, view12.frame.origin.y-dt9,  view12.frame.size.width, view12.frame.size.height)];
            [view13 setFrame:CGRectMake(view13.frame.origin.x, view13.frame.origin.y-dt9,  view13.frame.size.width, view13.frame.size.height)];
            break;
        case 9:
            [view11 setFrame:CGRectMake(view11.frame.origin.x, view11.frame.origin.y-dt10,  view11.frame.size.width, view11.frame.size.height)];
            [view12 setFrame:CGRectMake(view12.frame.origin.x, view12.frame.origin.y-dt10,  view12.frame.size.width, view12.frame.size.height)];
            [view13 setFrame:CGRectMake(view13.frame.origin.x, view13.frame.origin.y-dt10,  view13.frame.size.width, view13.frame.size.height)];
            break;
        case 10:
            [view12 setFrame:CGRectMake(view12.frame.origin.x, view12.frame.origin.y-dt11,  view12.frame.size.width, view12.frame.size.height)];
            [view13 setFrame:CGRectMake(view13.frame.origin.x, view13.frame.origin.y-dt11,  view13.frame.size.width, view13.frame.size.height)];
            break;
       case 11:
            [view13 setFrame:CGRectMake(view13.frame.origin.x, view13.frame.origin.y-dt12,  view13.frame.size.width, view13.frame.size.height)];
        default:
            break;
    }
}

- (IBAction)backBtn_Clicked:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveBtn_Clicked:(id)sender {
    [self saveConfigfile];
    [DBAdapter updateFileData : [DBAdapter getDbFilePath]];
}

-(void)  saveConfigfile{
    NSString * data;
    
    if([[showviewLists valueForKey:[lists objectAtIndex:0]] isEqualToString:@"1"]){
        data = [data1.text stringByAppendingString:@" "];
        if (view1.hidden  == YES) {
            [ConfigManager setAlcancesYLimits : @""];
        }else
            [ConfigManager setAlcancesYLimits : data];
    }else{
           [ConfigManager setAlcancesYLimits : @""];
    }
    
    if([[showviewLists valueForKey:[lists objectAtIndex:1]] isEqualToString:@"1"]){
        data = [data2.text stringByAppendingString:@" "];
        if (view2.hidden  == YES) {
            [ConfigManager setAlcancesYLimitsCapcidad : @""];
        }else
            [ConfigManager setAlcancesYLimitsCapcidad : data];
    } else{
        [ConfigManager setAlcancesYLimitsCapcidad : @""];
    }
    
    if([[showviewLists valueForKey:[lists objectAtIndex:2]] isEqualToString:@"1"]){
        data = [data3.text stringByAppendingString:@" "];
        if (view3.hidden  == YES) {
            [ConfigManager setAlcancesYLimitsHorarios : @""];
        }else
            [ConfigManager setAlcancesYLimitsHorarios : data];
    }else{
            [ConfigManager setAlcancesYLimitsHorarios : @""];
    }
    
    
    if([[showviewLists valueForKey:[lists objectAtIndex:3]] isEqualToString:@"1"]){
        data = [data4.text stringByAppendingString:@" "];
        if (view4.hidden  == YES) {
            [ConfigManager setAlcancesYLimitsCobertura : @""];
        }else
            [ ConfigManager setAlcancesYLimitsCobertura : data ];
    } else{
         [ConfigManager setAlcancesYLimitsCobertura : @""];
    }
    
    if([[showviewLists valueForKey:[lists objectAtIndex:4]] isEqualToString:@"1"]){
        data = [data5.text stringByAppendingString:@" "];
        if (view5.hidden  == YES) {
            [ConfigManager setAlcancesYLimitsComercial : @""];
        }else
            [ConfigManager setAlcancesYLimitsComercial : data];
    } else{
            [ConfigManager setAlcancesYLimitsComercial : @""];
    }
    
    if([[showviewLists valueForKey:[lists objectAtIndex:5]] isEqualToString:@"1"]){
        data = [data6.text stringByAppendingString:@" "];
        if (view6.hidden  == YES) {
            [ConfigManager setAlcancesYLimitsPersonal : @""];
        }else
            [ConfigManager setAlcancesYLimitsPersonal : data ];
    }else{
        [ConfigManager setAlcancesYLimitsPersonal : @""];
    }
    
    if([[showviewLists valueForKey:[lists objectAtIndex:6]] isEqualToString:@"1"]){
        data = [data7.text stringByAppendingString:@" "];
        if (view7.hidden  == YES) {
            [ConfigManager setAlcancesYLimitsDemanda : @""];
        }else
            [ConfigManager setAlcancesYLimitsDemanda : data];
    } else{
        [ConfigManager setAlcancesYLimitsDemanda : @""];
    }
    
    if([[showviewLists valueForKey:[lists objectAtIndex:7]] isEqualToString:@"1"]){
        data = [data8.text stringByAppendingString:@" "];
        if (view8.hidden  == YES) {
            [ConfigManager setAlcancesYLimitsDuracion : @""];
        }else
            [ConfigManager setAlcancesYLimitsDuracion : data];
    }else{
        [ConfigManager setAlcancesYLimitsDuracion : @""];
    }
        
    
    
    if([[showviewLists valueForKey:[lists objectAtIndex:8]] isEqualToString:@"1"]){
        data = [data9.text stringByAppendingString:@" "];
        if (view9.hidden  == YES) {
            [ConfigManager setAlcancesYLimitsSegmen : @""];
        }else
            [ConfigManager setAlcancesYLimitsSegmen : data];
    }else{
        [ConfigManager setAlcancesYLimitsSegmen : @""];
    }
    
    
    if([[showviewLists valueForKey:[lists objectAtIndex:9]] isEqualToString:@"1"]){
        data = [data10.text stringByAppendingString:@" "];
        if (view10.hidden  == YES) {
            [ConfigManager setAlcancesYLimitsTechnologia : @""];
        }else
            [ConfigManager setAlcancesYLimitsTechnologia : data];
    }else{
        [ConfigManager setAlcancesYLimitsTechnologia : @""];
    }
    
    if([[showviewLists valueForKey:[lists objectAtIndex:10]] isEqualToString:@"1"]){
        data = [data11.text stringByAppendingString:@" "];
        if (view11.hidden  == YES) {
            [ConfigManager setAlcancesYLimitsOtro1 : @""];
        }else
            [ConfigManager setAlcancesYLimitsOtro1 : data];
    } else{
        [ConfigManager setAlcancesYLimitsOtro1 : @""];
    }
    
    if([[showviewLists valueForKey:[lists objectAtIndex:11]] isEqualToString:@"1"]){
        data = [data12.text stringByAppendingString:@" "];
        if (view12.hidden  == YES) {
            [ConfigManager setAlcancesYLimitsOtro2 : @""];
        }else
            [ConfigManager 	setAlcancesYLimitsOtro2 : data];
    } else{
        [ConfigManager setAlcancesYLimitsOtro2 : @""];
    }
    
    if([[showviewLists valueForKey:[lists objectAtIndex:12]] isEqualToString:@"1"]){
        data = [data13.text stringByAppendingString:@" "];
        if (view13.hidden  == YES) {
            [ConfigManager setAlcancesYLimitsOtro3 : @""];
        }else
            [ConfigManager setAlcancesYLimitsOtro3 : data];
    } else{
        [ConfigManager setAlcancesYLimitsOtro3 : @""];
    }
}

- (void) viewWillDisappear:(BOOL)animated{
    [self saveConfigfile];
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
    menuView.helpText = [[Attributes getDescription:1] objectAtIndex:0];
    menuView.titleText = self.titleText;
    [self.navigationController pushViewController: menuView animated:YES];
}

@end
