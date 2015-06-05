//
//  MenuDocViewController.m
//  Business Case
//
//  Created by LeeShengGe on 11/23/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "MenuDocViewController.h"
#import "Attributes.h"
#import "MenuListViewCell.h"
#import "NewDialogController.h"
#import "OpenDialogController.h"
#import "IntrodutionViewController.h"
#import "FillDetailViewController.h"
#import "AlcancesYLimitesViewController.h"
#import "ContingYViewController.h"
#import "SupuestosViewController.h"
#import "SumarioViewController.h"
#import "HelpViewController.h"
#import "Confirm1ViewController.h"
#import "DBAdapter.h"

@interface MenuDocViewController ()

@end

@implementation MenuDocViewController

@synthesize openDocDialogView, DialogView_NewDoc, childMenuView, confirmDialogView;
UIView *openDialogView;
UIView *confDialogView;

NSArray *menuImageLists;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    openDocDialogView.hidden = YES;
    [self addView_openDialog];
    DialogView_NewDoc.hidden = YES;
    [self addView_newDialog];
    childMenuView.hidden = YES;
    [self addView_childMenu];
    confirmDialogView.hidden = YES;
    [self addView_confirmDialog];
    
    if (self.isHelp) {
        CGRect oRect = self.parentMenu_List.frame;
        self.parentMenu_List.frame = CGRectMake(oRect.origin.x, oRect.origin.y-50, oRect.size.width, oRect.size.height+50);
        oRect = childMenuView.frame;
        childMenuView.frame = CGRectMake(oRect.origin.x, oRect.origin.y-50, oRect.size.width, oRect.size.height+50);
        self.toolView.hidden = YES;
    }
    
    menuList  = [[NSMutableArray alloc]init];
    menuList = [Attributes getParentMenuList];
    menuImageLists = [NSArray arrayWithObjects:@"menu1.png", @"menu2.png", @"menu3.png", @"menu4.png", @"menu5.png", @"menu6.png", @"menu7.png", @"menu8.png", @"menu9.png", @"menu10.png", @"menu11.png", @"menu12.png", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) addView_childMenu{
    childMenuController = [self.storyboard instantiateViewControllerWithIdentifier:@"child_menu"];
    //UITableView  *view = childMenuController.view;
    childMenuController.isHelp = self.isHelp;
    [self addChildViewController:childMenuController];
    [childMenuView addSubview:childMenuController.view];
}

- (void) addView_openDialog{
    self.openViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"open_dialog"];
    self.openViewController.isOld = YES;
    openDialogView = [self.openViewController.view viewWithTag:111];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openViewHidden)];
    [self.openViewController.background_View addGestureRecognizer:tap];
    
    [self addChildViewController:self.openViewController];
    [self.openDocDialogView addSubview:openDialogView];
    
    NSArray *filenames = [[NSArray alloc]init];
    filenames = [DBAdapter getFileName:[DBAdapter getDbFilePath]];
    
    self.openViewController.docs = filenames;
    [self.openViewController.docList reloadData];

}

- (void) addView_confirmDialog{
    self.confirmViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"confirm1_dialog"];
    self.confirmViewController.fileName = self.filename;
    confDialogView = [self.confirmViewController.view viewWithTag:111];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(confirmViewHidden)];
    [self.confirmViewController.backgroundView addGestureRecognizer:tap];
    
    [self addChildViewController:self.confirmViewController];
    [self.confirmDialogView addSubview:confDialogView];
}

-(void) openViewHidden{
    self.openDocDialogView.hidden = YES;
}

- (void) addView_newDialog{
    NewDialogController *newViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"new_dialog"];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(newViewHidden)];
    [newViewController.backgroundView addGestureRecognizer:tap];
    
    [self addChildViewController:newViewController];
    [self.DialogView_NewDoc addSubview:newViewController.view];

}

-(void) newViewHidden{
    self.DialogView_NewDoc.hidden =  YES;
}

-(void) confirmViewHidden{
    self.confirmDialogView.hidden =  YES;
}

#pragma mark UITableViewDelegate & DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [menuList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MenuListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menulist_cell"];
    if (cell == nil) {
        cell  = [[MenuListViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"menulist_cell"];
    }
    UIImage *image = [UIImage imageNamed:[menuImageLists objectAtIndex:indexPath.row]];
    
    [cell.menuImage setImage:image];
    if (self.isHelp)
        [cell.rightImage setImage:[UIImage imageNamed:@"help_mark.png"]];
    cell.menuName.text = [menuList objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSObject *value = [[Attributes getChildMenuList] objectAtIndex:indexPath.row];
//    NSMutableArray *muArr = [Attributes getDescription:0];
//    NSString *str = [muArr objectAtIndex:indexPath.row];
    if (self.isHelp /*&& ![str isEqualToString:@""]*/) {
        HelpViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"help_view"];
//        menuView.helpText = str;
        menuView.titleText = [menuList objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:menuView animated:YES];
        return;
    }
    
    if ([(NSString *)value isEqual:@"nil"]) {
        if (indexPath.row == 2) {
            IntrodutionViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"introdution_view"];
            viewController.isHelp = self.isHelp;
            viewController.titleText = [menuList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:viewController animated:YES];
//            [self presentModalViewController:viewController animated:YES];
        }
        if (indexPath.row == 3) {
            FillDetailViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"fill_detailview"];
            viewController.isHelp = self.isHelp;
            viewController.titleText = [menuList objectAtIndex:indexPath.row];
            viewController.parentIndex = 3;
            [self.navigationController pushViewController:viewController animated:YES];
            viewController.riesgos = indexPath.row;
//            [self presentModalViewController:viewController animated:YES];
        }
        if (indexPath.row == 5) {
            AlcancesYLimitesViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"alcancesy_view"];
            viewController.isHelp = self.isHelp;
            viewController.titleText = [menuList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:viewController animated:YES];
//            [self presentModalViewController:viewController animated:YES];
        }
        if (indexPath.row == 7) {
            ContingYViewController *contingYcontroller = [self.storyboard instantiateViewControllerWithIdentifier:@"contingyde_view"];
            contingYcontroller.isHelp = self.isHelp;
            contingYcontroller.titleText = [menuList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:contingYcontroller animated:YES];
            
            contingYcontroller.resulta = 999;
            
//            [self presentModalViewController:contingYcontroller animated:YES];
        }
        if (indexPath.row == 8) {
            SupuestosViewController *supuestosController = [self.storyboard instantiateViewControllerWithIdentifier:@"supuestos_view"];
            supuestosController.isHelp = self.isHelp;
            supuestosController.titleText = [menuList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:supuestosController animated:YES];
//            [self presentModalViewController:supuestosController animated:YES];
        }
        if (indexPath.row == 11) {
            SumarioViewController *sumarioController = [self.storyboard instantiateViewControllerWithIdentifier:@"sumario_view"];
            sumarioController.isHelp = self.isHelp;
            sumarioController.titleText = [menuList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:sumarioController animated:YES];
//            [self presentModalViewController:sumarioController animated:YES];
        }
        return;
    } else {
        childMenuController.selectedParentMenuNum = indexPath.row;
        [childMenuController.childmenu_list reloadData];
        
        childMenuView.hidden = NO;
        self.childMenuView.frame  = CGRectMake(320, childMenuView.frame.origin.y, 320,childMenuView.frame.size.height);
        [UIView animateWithDuration:.4 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.childMenuView.frame  = CGRectMake(0, childMenuView.frame.origin.y, 320,childMenuView.frame.size.height);
            self.parentMenu_List.frame = CGRectMake(-320, self.parentMenu_List.frame.origin.y, 320,self.parentMenu_List.frame.size.height);
            self.menu_title.text = [menuList objectAtIndex:indexPath.row];
        } completion:nil];
    }
}

- (IBAction)backBtn_Clicked:(id)sender {
    
    if (childMenuController.selectedParentMenuNum != -1) {
        [UIView animateWithDuration:.4 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.childMenuView.frame  = CGRectMake(320, childMenuView.frame.origin.y, 320, childMenuView.frame.size.height);
            self.parentMenu_List.frame = CGRectMake(0, self.parentMenu_List.frame.origin.y, 320,self.parentMenu_List.frame.size.height);
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            } completion:^(BOOL finished) {
                self.childMenuView.hidden = YES;
                childMenuController.selectedParentMenuNum = -1;
                self.menu_title.text = @"Contenido";
            }];
        }];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
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

- (IBAction)newDoc_btn:(id)sender {
    DialogView_NewDoc.hidden = NO;
    DialogView_NewDoc.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^
     {
         DialogView_NewDoc.alpha = 1;
     }
                     completion:nil];
}

- (IBAction)openDoc_btn:(id)sender {

    self.openDocDialogView.hidden = NO;
    self.openDocDialogView.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^
     {
         self.openDocDialogView.alpha= 1;
     }
    completion:nil];

}

- (IBAction)saveDoc_btn:(id)sender {
    UIAlertView *al_view = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"This file successfully saved!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [al_view show];
}

- (IBAction)wordDoc_btn:(id)sender {
    confirmDialogView.hidden = NO;
    self.isDoc = YES;
    self.confirmViewController.isDoc = YES;
    confirmDialogView.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^
     {
         confirmDialogView.alpha = 1;
     }
                     completion:nil];
}

- (IBAction)excelDoc_btn:(id)sender {
    confirmDialogView.hidden = NO;
    self.isDoc = NO;
    self.confirmViewController.isDoc = NO;
    confirmDialogView.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^
     {
         confirmDialogView.alpha = 1;
     }
                     completion:nil];
}

- (IBAction)heipDoc_btn:(id)sender {
    MenuDocViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"menu_navigation"];
    menuView.isHelp = YES;
    menuView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    UINavigationController *navView = [[UINavigationController alloc] initWithRootViewController:menuView];
    navView.navigationBarHidden = YES;
    [self presentViewController:navView animated:YES completion:nil];
}

-(void) loadingShow {
    self.loading.hidden = NO;
}

-(void) loadingHide {
    self.loading.hidden = YES;
}

@end
