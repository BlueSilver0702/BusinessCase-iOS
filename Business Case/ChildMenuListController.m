//
//  ChildMenuListController.m
//  Business Case
//
//  Created by LeeShengGe on 11/23/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "ChildMenuListController.h"
#import "Attributes.h"
#import "ChildMenuListCell.h"
#import "EsquenmaGeneralController.h"
#import "BeneficiosFinanceController.h"
#import "FillDetailViewController.h"
#import "IngresosViewController.h"
#import "ContingYViewController.h"
#import "FuenteViewController.h"
#import "ConclusionViewController.h"
#import "HelpViewController.h"

@interface ChildMenuListController ()

@end

@implementation ChildMenuListController
@synthesize childmenu_list, selectedParentMenuNum;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    selectedParentMenuNum = -1;
    childMenuList = [[NSMutableArray alloc]init];
    childMenuList = [Attributes getChildMenuList];
    if (self.isHelp) {
        CGRect oRect = childmenu_list.frame;
        childmenu_list.frame = CGRectMake(oRect.origin.x, oRect.origin.y, oRect.size.width, oRect.size.height+50);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView datasource & delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (selectedParentMenuNum != -1) {
        return [[childMenuList objectAtIndex:selectedParentMenuNum] count];
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ChildMenuListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"child_menu"];
    if (cell == nil) {
        cell  = [[ChildMenuListCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"child_menu"];
    }
  
    cell.childMunuName.text = [[childMenuList objectAtIndex:selectedParentMenuNum]objectAtIndex:indexPath.row];
    if (self.isHelp)
        [cell.rightView setImage:[UIImage imageNamed:@"help_mark.png"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (selectedParentMenuNum != -1) {
        
//        NSString *str = [[Attributes getDescription:2] objectAtIndex:indexPath.row];
        if (self.isHelp /*&& str*/) {
            HelpViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"help_view"];
//            menuView.helpText = str;
            menuView.titleText = [[childMenuList objectAtIndex:selectedParentMenuNum]objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:menuView animated:YES];
            return;
        }
        
        EsquenmaGeneralController *esquenma_controller = [self.storyboard instantiateViewControllerWithIdentifier:@"esqenma_view"];
        esquenma_controller.isHelp = self.isHelp;
        esquenma_controller.titleText = [[childMenuList objectAtIndex:selectedParentMenuNum]objectAtIndex:indexPath.row];
        ContingYViewController *contingYcontroller = [self.storyboard instantiateViewControllerWithIdentifier:@"contingyde_view"];
        contingYcontroller.isHelp = self.isHelp;
        contingYcontroller.titleText = [[childMenuList objectAtIndex:selectedParentMenuNum]objectAtIndex:indexPath.row];
        FuenteViewController *fueneteController = [self.storyboard instantiateViewControllerWithIdentifier:@"fuente_view"];
        fueneteController.isHelp = self.isHelp;
        fueneteController.titleText = [[childMenuList objectAtIndex:selectedParentMenuNum]objectAtIndex:indexPath.row];
        ConclusionViewController *conclusionviewcontroller = [self.storyboard instantiateViewControllerWithIdentifier:@"conculsion_view"];
        conclusionviewcontroller.isHelp = self.isHelp;
        conclusionviewcontroller.titleText = [[childMenuList objectAtIndex:selectedParentMenuNum]objectAtIndex:indexPath.row];
        
        switch (selectedParentMenuNum) {
                
            case 0:
                esquenma_controller.selectedChildMenuNum = indexPath.row;
                esquenma_controller.isHelp = self.isHelp;
                esquenma_controller.titleText = [[childMenuList objectAtIndex:selectedParentMenuNum]objectAtIndex:indexPath.row];
                [self.navigationController pushViewController:esquenma_controller animated:YES];
                break;
            case 1:
                if (indexPath.row == 2) {
                    FillDetailViewController *fillviewController = [self.storyboard instantiateViewControllerWithIdentifier:@"fill_detailview"];
                    fillviewController.isHelp = self.isHelp;
                    fillviewController.titleText = [[childMenuList objectAtIndex:selectedParentMenuNum]objectAtIndex:indexPath.row];
                    fillviewController.i = indexPath.row;
                    fillviewController.parentIndex = 1;
                    [self.navigationController pushViewController:fillviewController animated:YES];
                }else{
                    BeneficiosFinanceController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"beneficios_view"];
                    viewController.isHelp = self.isHelp;
                    viewController.titleText = [[childMenuList objectAtIndex:selectedParentMenuNum]objectAtIndex:indexPath.row];
                    viewController.selectedTitle = 1;
                    viewController.rowSelectedNum = indexPath.row;
                    viewController.rowParentSelectedNum = selectedParentMenuNum;
                    [self.navigationController pushViewController:viewController animated:YES];
                }
                break;
            case  4:
                if (indexPath.row == 2) {
                    IngresosViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ingresos_view"];
                    viewController.isHelp = self.isHelp;
                    viewController.parentIndex = 4;
                    viewController.titleText = [[childMenuList objectAtIndex:selectedParentMenuNum]objectAtIndex:indexPath.row];
                    [self.navigationController pushViewController:viewController animated:YES];
                    viewController.i= indexPath.row;
                }else{
                    BeneficiosFinanceController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"beneficios_view"];
                    viewController.isHelp = self.isHelp;
                    viewController.titleText = [[childMenuList objectAtIndex:selectedParentMenuNum]objectAtIndex:indexPath.row];
                    viewController.selectedTitle = 2;
                    viewController.rowParentSelectedNum = selectedParentMenuNum;
                    viewController.rowSelectedNum = indexPath.row;
                    [self.navigationController pushViewController:viewController animated:YES];
                }
                break;
            case 6:
                [self.navigationController pushViewController:contingYcontroller animated:YES];
                contingYcontroller.selectedRow = indexPath.row;
                break;
            case 9:
                [self.navigationController pushViewController:fueneteController animated:YES];
                fueneteController.selectedRow = indexPath.row;
                break;
            case 10:
                [self.navigationController pushViewController:conclusionviewcontroller animated:YES];
                conclusionviewcontroller.selectedRow = indexPath.row;
                break;
        }
    }
    
}


@end
