//
//  AlcancesYLimitesViewController.m
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "AlcancesYLimitesViewController.h"
#import "AlcancesCheckedElementsViewController.h"
#import "AlcancesYLimitesViewCell.h"
#import "ConfigManager.h"
#import "DBAdapter.h"
#import "Attributes.h"
#import "HelpViewController.h"
#import "InstantViewController.h"

@interface AlcancesYLimitesViewController ()

@end

@implementation AlcancesYLimitesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.saveBtn.layer.cornerRadius = 3;
    // Do any additional setup after loading the view.
    checkBtn_cliked = NO;
    lists  = [[NSArray alloc] initWithObjects:@"Tiempo",@"Capacidad instalada",@"Horarios de operacion",@"Cobertura geografic",@"Productos y servicios a comercializar",@"Moneda",@"Distribución",@"Almacenamiento",@"Edificaciones",@"Capital Requerido",@"Otro1",@"Otro2",@"Otro3", nil];
        
    selectedRows = [[NSMutableDictionary alloc]initWithCapacity:13];
    for (NSInteger i = 0 ; i<[lists count]; i++) {
        [selectedRows setValue:@"0" forKey:[lists objectAtIndex:i]];
    }
    
    [self initData];
    
    if (self.isHelp) {
        CGRect oRect = self.tableView.frame;
        self.self.tableView.frame = CGRectMake(oRect.origin.x, oRect.origin.y-50, oRect.size.width, oRect.size.height+50);
        self.toolView.hidden = YES;
    }
    
    InstantViewController *instantController = [self. storyboard instantiateViewControllerWithIdentifier:@"instant_view"];
    instantController.descText = [[Attributes getHelp:5] objectAtIndex:0];
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

-(void) initData{
    if (![[ConfigManager getAlcancesYLimits] isEqualToString:@""]) {
        [selectedRows setValue:@"1" forKey:[lists objectAtIndex:0]];
    }
    if (![[ConfigManager getAlcancesYLimitsCapcidad] isEqualToString:@""]) {
        [selectedRows setValue:@"1" forKey:[lists objectAtIndex:1]];
    }
    if (![[ConfigManager getAlcancesYLimitsHorarios] isEqualToString:@""]) {
        [selectedRows setValue:@"1" forKey:[lists objectAtIndex:2]];
    }
    if (![[ConfigManager getAlcancesYLimitsCobertura] isEqualToString:@""]) {
        [selectedRows setValue:@"1" forKey:[lists objectAtIndex:3]];
    }
    if (![[ConfigManager getAlcancesYLimitsComercial] isEqualToString:@""]) {
        [selectedRows setValue:@"1" forKey:[lists objectAtIndex:4]];
    }
    if (![[ConfigManager getAlcancesYLimitsPersonal] isEqualToString:@""]) {
        [selectedRows setValue:@"1" forKey:[lists objectAtIndex:5]];
    }
    if (![[ConfigManager getAlcancesYLimitsDemanda] isEqualToString:@""]) {
        [selectedRows setValue:@"1" forKey:[lists objectAtIndex:6]];
    }
    if (![[ConfigManager getAlcancesYLimitsDuracion] isEqualToString:@""]) {
        [selectedRows setValue:@"1" forKey:[lists objectAtIndex:7]];
    }
    
    if (![[ConfigManager getAlcancesYLimitsSegmen] isEqualToString:@""]) {
        [selectedRows setValue:@"1" forKey:[lists objectAtIndex:8]];
    }
    
    if (![[ConfigManager getAlcancesYLimitsTechnologia] isEqualToString:@""]) {
        [selectedRows setValue:@"1" forKey:[lists objectAtIndex:9]];
    }
    
    if (![[ConfigManager getAlcancesYLimitsOtro1] isEqualToString:@""]) {
        [selectedRows setValue:@"1" forKey:[lists objectAtIndex:10]];
    }
    if (![[ConfigManager getAlcancesYLimitsOtro2] isEqualToString:@""]) {
        [selectedRows setValue:@"1" forKey:[lists objectAtIndex:11]];
    }
    
    if (![[ConfigManager getAlcancesYLimitsOtro3] isEqualToString:@""]) {
        [selectedRows setValue:@"1" forKey:[lists objectAtIndex:12]];
    }
}

#pragma mark UITableView Delegate and DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return [lists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AlcancesYLimitesViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"alcances_cell"];
    if (cell == nil) {
        cell = [[AlcancesYLimitesViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"alcances_cell"];
    }
    cell.doclist_names.text = [lists objectAtIndex:indexPath.row];
    if ([[selectedRows objectForKey:[lists objectAtIndex:indexPath.row]]isEqualToString:@"1"]) {
        cell.checkBtn.selected = YES;
//        [selectedRows setValue:@"1"  forKey:[lists objectAtIndex:indexPath.row]];
    }else{
        cell.checkBtn.selected = NO;
//        [selectedRows setValue:@"0"  forKey:[lists objectAtIndex:indexPath.row]];
    }
    cell.checkBtn.tag = indexPath.row;
    return cell;
}



- (IBAction)backBtn_Clicked:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)nextBtn_Clicked:(id)sender {
    AlcancesCheckedElementsViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"alcances_checked_view"];
    viewController.isHelp = self.isHelp;
    viewController.titleText = self.titleText;
    viewController.showviewLists = selectedRows;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)homeBtn_Clicked:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Confirm!" message:@"¿Estás seguro que deseas cerrar tu Business Case?" delegate:self cancelButtonTitle:@"No" otherButtonTitles: nil];
    [alert addButtonWithTitle:@"Si"];
    [alert show];
}

- (IBAction)checkBtn_Clicked:(UIButton *)sender {
    if (sender.selected == YES) {
        sender.selected = NO;
        [selectedRows setValue:@"0" forKey:[lists objectAtIndex:sender.tag]];
    } else{
        sender.selected = YES;
        [selectedRows setValue:@"1" forKey:[lists objectAtIndex:sender.tag]];
    }
    
    
//    if (!checkBtn_cliked) {
//        checkBtn_cliked = YES;
//        sender.selected = YES;
//    }else{
//        checkBtn_cliked = NO;
//        sender.selected = NO;
//    }
}
#pragma mark UIAlertViewDelegate
-(void) alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1 ) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)helpBtnClick:(id)sender {
    HelpViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"help_view"];
    menuView.helpText = [[Attributes getDescription:5] objectAtIndex:0];
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
