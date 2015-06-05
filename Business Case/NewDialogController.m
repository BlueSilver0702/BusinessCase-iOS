//
//  NewDialogController.m
//  Business Case
//
//  Created by LeeShengGe on 11/23/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "NewDialogController.h"
#import "MenuDocViewController.h"
#import "ViewController.h"
#import "DBAdapter.h"
#import "ConfigManager.h"

@interface NewDialogController ()

@end

@implementation NewDialogController
@synthesize backgroundView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ok_btn.layer.cornerRadius = 3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)creat_Clicked:(id)sender {
    NSString *docName =  self.docName_New.text;
    if (![docName isEqualToString:@""]) {
        
        [self newFileToDb:docName];
    
        if ([self.parentViewController isKindOfClass: [ViewController class]]) {
            ViewController * tempViewController = (ViewController *)self.parentViewController;
            [tempViewController.dialogNew_View setHidden:YES];
        } else if ([self.parentViewController isKindOfClass: [MenuDocViewController class]]) {
            MenuDocViewController * tempViewController = (MenuDocViewController *)self.parentViewController;
            tempViewController.filename = docName;
            [tempViewController.DialogView_NewDoc setHidden:YES];
        }
        
        MenuDocViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"menu_navigation"];
        menuView.filename = docName;
        UINavigationController *navView = [[UINavigationController alloc] initWithRootViewController:menuView];
        navView.navigationBarHidden = YES;
        [self presentViewController:navView animated:YES completion:nil];
    }
}

- (void) newFileToDb : (NSString *)doc_Name{
   // if there is no DB.
    if (![[NSFileManager defaultManager] fileExistsAtPath:[DBAdapter getDbFilePath]]) {
        [DBAdapter createTable:[DBAdapter getDbFilePath]];
    }
    
    [ConfigManager initConfigFile];
    [ConfigManager setHeading:doc_Name];
    
    NSMutableArray *insertdata = [[NSMutableArray alloc]init];
    
    NSString *heading  = [ConfigManager getHeading];
    
    [insertdata addObject : [ConfigManager getHeading]];
    for (int i=1; i<=54; i++) {
        [insertdata addObject:@""];
    }
    
    //Insert Doc data in table of DB.
    [DBAdapter insertTableData:[DBAdapter getDbFilePath] :insertdata];
}

@end
