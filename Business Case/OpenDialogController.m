//
//  OpenDialogController.m
//  Business Case
//
//  Created by LeeShengGe on 11/22/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "OpenDialogController.h"
#import "OpenDialogViewCell.h"
#import "MenuDocViewController.h"
#import "ViewController.h"
#import "DBAdapter.h"
#import "ConfigManager.h"

@interface OpenDialogController ()

@end

@implementation OpenDialogController

@synthesize background_View;
@synthesize open_btn, delet_btn;
@synthesize docs;
@synthesize selectedDoc;
@synthesize docList;

- (void)viewDidLoad {
    [super viewDidLoad];
    open_btn.layer.cornerRadius = 3;
    delet_btn.layer.cornerRadius = 3;
    // Do any additional setup after loading the view.
  
    selectedDoc = -1;
    
    docs =[[NSArray alloc]init];
   // [self getDocNames];
    //[docs addObjectsFromArray:@[@"dir", @"file"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource & UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [docs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OpenDialogViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"opendialog_cell"];
    if (cell == nil) {
        cell  = [[OpenDialogViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"opendialog_cell"];
    }
    cell.doc_Name.text = [docs objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selectedDoc = indexPath.row;
}

- (IBAction)openDoc_Clicked:(id)sender {
    if (selectedDoc != -1) {
        
        [self getDocDatas];
        
        if (self.isOld) {
            MenuDocViewController * tempViewController = (MenuDocViewController *)self.parentViewController;
            [tempViewController.openDocDialogView setHidden:YES];
            MenuDocViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"menu_navigation"];
            menuView.filename = [docs objectAtIndex:selectedDoc];
//            UINavigationController *navView = [[UINavigationController alloc] initWithRootViewController:menuView];
//            navView.navigationBarHidden = YES;
            [self.navigationController pushViewController:menuView animated:YES];
        } else {
            ViewController * tempViewController = (ViewController *)self.parentViewController;
            [tempViewController.openDialog_View setHidden:YES];
            MenuDocViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"menu_navigation"];
            menuView.filename = [docs objectAtIndex:selectedDoc];
            UINavigationController *navView = [[UINavigationController alloc] initWithRootViewController:menuView];
            navView.navigationBarHidden = YES;
            [self presentViewController:navView animated:YES completion:nil];
        }
    }
}

- (IBAction)deleteDoc_Clicked:(id)sender {
    if (selectedDoc != -1) {
        ViewController *tempViewController = (ViewController *)self.parentViewController;
        tempViewController.deleteDialog_View.hidden = NO;
        tempViewController.deleteDialog_View.alpha = 0;
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^
                  {
                      tempViewController.deleteDialog_View.alpha = 1;
                  }
                                  completion:nil];
    
    }
}

-(void) getDocNames{
    
}

-(void)  getDocDatas{
    //db open.
    //fetch data from db.
    //write data to config file.
    
    
    
    NSString *selectedDocName = @"";
    if (self.isOld) {
        MenuDocViewController *tempViewcontroller = (MenuDocViewController *) self.parentViewController;
        selectedDocName = (NSString *) [tempViewcontroller.openViewController.docs objectAtIndex: tempViewcontroller.openViewController.selectedDoc];
    } else {
        ViewController *tempViewcontroller = (ViewController *) self.parentViewController;
        selectedDocName = (NSString *) [tempViewcontroller.openViewController.docs objectAtIndex: tempViewcontroller.openViewController.selectedDoc];
    }
    
    [ConfigManager initConfigFile];
    
    NSMutableArray * filedata = [DBAdapter getFileDatas : [DBAdapter getDbFilePath] : selectedDocName];
    
    [ConfigManager setHeading:[filedata objectAtIndex:0]];
    [ConfigManager setTitle:[filedata objectAtIndex:1]];
    [ConfigManager setTema:[filedata objectAtIndex:2]];
    [ConfigManager setObjective:[filedata objectAtIndex:3]];
    [ConfigManager setDescriptionShort1:[filedata objectAtIndex:4]];
    [ConfigManager setDescriptionLarge1:[filedata objectAtIndex:5]];
    [ConfigManager setDescriptionShortAhorros1:[filedata objectAtIndex:6]];
    [ConfigManager setDescriptionLargeAhorros1:[filedata objectAtIndex:7]];
    [ConfigManager setDescriptionShortEgresos1:[filedata objectAtIndex:8]];
    [ConfigManager setDescriptionLargeEgresos1:[filedata objectAtIndex:9]];
    [ConfigManager setDescriptionShortCostos:[filedata objectAtIndex:10]];
    [ConfigManager setDescriptionLargeCostos:[filedata objectAtIndex:11]];
    [ConfigManager setDescriptionShortInversion:[filedata objectAtIndex:12]];
    [ConfigManager setDescriptionLargeInversion:[filedata objectAtIndex:13]];
    [ConfigManager setDescriptionShortBeneficios:[filedata objectAtIndex:14]];
    [ConfigManager setDescriptionLargeBeneficios:[filedata objectAtIndex:15]];
    [ConfigManager setDescriptionShortImpactos:[filedata objectAtIndex:16]];
    [ConfigManager setDescriptionLargeImpactos:[filedata objectAtIndex:17]];
    [ConfigManager setDescriptionShortRiesgos:[filedata objectAtIndex:18]];
    [ConfigManager setDescriptionLargeRiesgos:[filedata objectAtIndex:19]];
    [ConfigManager setIntroduction:[filedata objectAtIndex:20]];
    
    [ConfigManager setAlcancesYLimits:[filedata objectAtIndex:21]];
    [ConfigManager setAlcancesYLimitsCapcidad:[filedata objectAtIndex:22]];
    [ConfigManager setAlcancesYLimitsHorarios:[filedata objectAtIndex:23]];
    [ConfigManager setAlcancesYLimitsCobertura:[filedata objectAtIndex:24]];
    [ConfigManager setAlcancesYLimitsComercial:[filedata objectAtIndex:25]];
    [ConfigManager setAlcancesYLimitsPersonal:[filedata objectAtIndex:26]];
    [ConfigManager setAlcancesYLimitsDemanda:[filedata objectAtIndex:27]];
    [ConfigManager setAlcancesYLimitsDuracion:[filedata objectAtIndex:28]];
    [ConfigManager setAlcancesYLimitsSegmen:[filedata objectAtIndex:29]];
    [ConfigManager setAlcancesYLimitsTechnologia:[filedata objectAtIndex:30]];
    [ConfigManager setAlcancesYLimitsOtro1:[filedata objectAtIndex:31]];
    [ConfigManager setAlcancesYLimitsOtro2:[filedata objectAtIndex:32]];
    [ConfigManager setAlcancesYLimitsOtro3:[filedata objectAtIndex:33]];
    
    [ConfigManager setDependencia1:[filedata objectAtIndex:34]];
    [ConfigManager setDependencia2:[filedata objectAtIndex:35]];
    [ConfigManager setDependencia3:[filedata objectAtIndex:36]];
    [ConfigManager setDependencia4:[filedata objectAtIndex:37]];
    
    [ConfigManager setResultados1:[filedata objectAtIndex:38]];
    [ConfigManager setResultados2:[filedata objectAtIndex:39]];
    [ConfigManager setResultados3:[filedata objectAtIndex:40]];
    [ConfigManager setResultados4:[filedata objectAtIndex:41]];
    
    [ConfigManager setSupuestos1:[filedata objectAtIndex:42]];
    [ConfigManager setSupuestos2:[filedata objectAtIndex:43]];
    [ConfigManager setSupuestos3:[filedata objectAtIndex:44]];
    
    [ConfigManager setConclusion:[filedata objectAtIndex:45]];
    [ConfigManager setRecommendies:[filedata objectAtIndex:46]];
    [ConfigManager setSummary:[filedata objectAtIndex:47]];
    [ConfigManager setContingenciaDesLarga:[filedata objectAtIndex:48]];
    [ConfigManager setDependenciaDesLarga:[filedata objectAtIndex:49]];
    [ConfigManager setResultadosDescLarga:[filedata objectAtIndex:50]];
    [ConfigManager setSupuestosDescLarga:[filedata objectAtIndex:51]];
    
}

@end
