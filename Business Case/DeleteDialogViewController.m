//
//  DeleteDialogViewController.m
//  Business Case
//
//  Created by LeeShengGe on 11/25/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "DeleteDialogViewController.h"
#import "ViewController.h"
#import "DBAdapter.h"

@interface DeleteDialogViewController ()

@end

@implementation DeleteDialogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Ok_btn.layer.cornerRadius = 3;
    self.Ok_btn.layer.cornerRadius = 3;
    // Do any additional setup after loading the view.
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

- (IBAction)okBtn_Clicked:(id)sender {
     ViewController *tempViewcontroller = (ViewController *) self.parentViewController;
   NSString *selectedDocName = (NSString *) [tempViewcontroller.openViewController.docs objectAtIndex: tempViewcontroller.openViewController.selectedDoc];
   [DBAdapter deleteTableData:[DBAdapter getDbFilePath] :selectedDocName];
    
    tempViewcontroller.deleteDialog_View.hidden = YES;
    tempViewcontroller.openDialog_View.hidden = YES;
}

- (IBAction)cancelBtn_Clicked:(id)sender {
    ViewController *tempViewcontroller = (ViewController *) self.parentViewController;
    tempViewcontroller.deleteDialog_View.hidden = YES;
}
@end
