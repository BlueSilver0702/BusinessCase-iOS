//
//  ViewController.m
//  Business Case
//
//  Created by LeeShengGe on 11/21/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "ViewController.h"
#import "OpenDialogController.h"
#import "NewDialogController.h"
#import "InstantViewController.h"
#import "DeleteDialogViewController.h"
#import "DBAdapter.h"

@interface ViewController ()

@end

@implementation ViewController

UIView *openDialogView;
UIView *newDialogView;
UIView *instantDialogView;

//OpenDialogController *openViewController;

@synthesize openViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.openDialog_View.hidden = YES;
    self.dialogNew_View.hidden = YES;
    self.instantView.hidden = YES;
    self.deleteDialog_View.hidden = YES;
    [self addNewDialogView];
    [self addViewOnOpenDialog];
    [self addInstantView];
    [self addDeleteDialogView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openViewHidden{
     self.openDialog_View.hidden = YES;
}

- (void)newViewHidden{
    self.dialogNew_View.hidden = YES;
    [self.dialogNew_View endEditing:YES];
}

- (void) instantViewHidden{
    self.instantView.hidden = YES;
    }

-(void) deleteDialogHidden{
    self.deleteDialog_View.hidden = YES;
    self.openDialog_View.hidden = YES;
}

- (void) addInstantView{
    InstantViewController *instantController = [self. storyboard instantiateViewControllerWithIdentifier:@"instant_view"];
    instantDialogView = instantController.view;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(instantViewHidden)];
    [instantController.background_View addGestureRecognizer:tap];
    
    [self addChildViewController:instantController];
    [self.instantView addSubview:instantDialogView];
}

- (void) addNewDialogView{
    NewDialogController *newViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"new_dialog"];
    newDialogView = newViewController.view;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(newViewHidden)];
    [newViewController.backgroundView addGestureRecognizer:tap];
    
    [self addChildViewController:newViewController];
    [self.dialogNew_View addSubview:newViewController.view];
}

-(void) addDeleteDialogView{
    DeleteDialogViewController *deleteViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"delete_dialog"];
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(deleteDialogHidden)];
    [deleteViewController.view addGestureRecognizer:tap];
    
    [self addChildViewController:deleteViewController];
    [self.deleteDialog_View addSubview:deleteViewController.view];
}


- (void) addViewOnOpenDialog{
    
    openViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"open_dialog"];
    openDialogView = [openViewController.view viewWithTag:111];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openViewHidden)];
    [openViewController.background_View addGestureRecognizer:tap];

    [self addChildViewController:openViewController];
    [self.openDialog_View addSubview:openDialogView];
}

- (IBAction)open_Clicked:(id)sender {
    NSArray *filenames = [self getFileName];
    if (filenames.count == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"There is no file saved." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    
    }
    if ([[self getFileName] count]>0) {
        openViewController.docs = filenames;
        [openViewController.docList reloadData];
        
        self.openDialog_View.hidden = NO;
        self.openDialog_View.alpha = 0;
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^
         {
             self.openDialog_View.alpha= 1;
         }
                         completion:nil];
    } else{
        
    }
}

-(NSArray *)getFileName{
    NSArray *fileNames = [[NSArray alloc]init];
    fileNames = [DBAdapter getFileName:[DBAdapter getDbFilePath]];
    return fileNames;
}

- (IBAction)new_Clicked:(id)sender {
    self.dialogNew_View.hidden = NO;
    self.dialogNew_View.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^
     {
         self.dialogNew_View.alpha = 1;
     }
                     completion:nil];
}

- (IBAction)instant_Clicked:(id)sender {
    self.instantView.hidden = NO;
    
    self.instantView.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^
     {
         self.instantView.alpha = 1;
     }
                     completion:nil];
}

- (IBAction)train_Clicked:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.turnkeyhydraulics.co.za/hydraulic-services/"]];
}

- (IBAction)faq_Clicked:(id)sender {
    
}

@end
