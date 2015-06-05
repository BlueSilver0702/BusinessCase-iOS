//
//  BeneficiosFinanceController.m
//  Business Case
//
//  Created by LeeShengGe on 11/23/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "BeneficiosFinanceController.h"
#import "BeneficiosFinancierosCell.h"
#import "FillDetailViewController.h"
#import "IngresosViewController.h"
#import "Attributes.h"
#import "HelpViewController.h"

@interface BeneficiosFinanceController ()

@end

@implementation BeneficiosFinanceController

@synthesize rowSelectedNum;
@synthesize beneficiosFinanceLists;
@synthesize selectedTitle;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    rowSelectedNum = -1;
    titles = [[NSMutableArray alloc]init];
    if (selectedTitle == 1) {
  
        NSArray *firstTitleList = [NSArray arrayWithObjects:@"Ingresos",@"Ahorros", nil];
        NSArray *secondTitleList = [NSArray arrayWithObjects:@"Egresos Normales", @"Costos Normales", nil];
        NSArray *fourTitleList = [NSArray arrayWithObjects:@"Beneficios", @"Impactos Negativos", nil];
        [titles addObject:firstTitleList];;
        [titles addObject:secondTitleList];
        [titles addObject:@"nil"];
        [titles addObject:fourTitleList];
    }
    
    if (selectedTitle == 2) {
        NSArray *firstTitleList = [NSArray arrayWithObjects:@"Ingresos",@"Ahorros", nil];
        NSArray *secondTitleList = [NSArray arrayWithObjects:@"Egresos Normales", @"Costos Normales", nil];
        [titles addObject:firstTitleList];;
        [titles addObject:secondTitleList];
        [titles addObject:@"nil"];
    }
    
    if (self.isHelp) {
        CGRect oRect = self.beneficiosFinanceLists.frame;
        self.beneficiosFinanceLists.frame = CGRectMake(oRect.origin.x, oRect.origin.y-50, oRect.size.width, oRect.size.height+50);
        self.toolView.hidden = YES;
    }
    
    self.titleLabel.text = self.titleText;
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
    if(rowSelectedNum == -1){
        return  0;
    }else
        return  2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BeneficiosFinancierosCell *cell = [tableView dequeueReusableCellWithIdentifier:@"beneficios_financieros_cell"];
    if (cell == nil) {
        cell  = [[BeneficiosFinancierosCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"beneficios_financieros_cell"];
    }

    NSString *title = [[titles objectAtIndex:rowSelectedNum] objectAtIndex:indexPath.row];
    cell.subTitle.text = title;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    if (selectedTitle == 1) {
        FillDetailViewController *fillviewController = [self.storyboard instantiateViewControllerWithIdentifier:@"fill_detailview"];
        fillviewController.isHelp = self.isHelp;
        fillviewController.titleText = [[titles objectAtIndex:rowSelectedNum] objectAtIndex:indexPath.row];
//        [self presentModalViewController:fillviewController animated:YES];
        
        fillviewController.i = rowSelectedNum;
        fillviewController.j = indexPath.row;
        fillviewController.parentIndex = self.rowParentSelectedNum;
        
        [self.navigationController pushViewController:fillviewController animated:YES];
        
        
    }
    
    if (selectedTitle == 2) {
        IngresosViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ingresos_view"];
        viewController.isHelp = self.isHelp;
        viewController.titleText = [[titles objectAtIndex:rowSelectedNum] objectAtIndex:indexPath.row];
//        [self presentModalViewController:viewController animated:YES];
        viewController.parentIndex = self.rowParentSelectedNum;
        viewController.i = rowSelectedNum;
        viewController.j = indexPath.row;
        
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

- (IBAction)back_Clicked:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)home_Clicked:(id)sender {
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
