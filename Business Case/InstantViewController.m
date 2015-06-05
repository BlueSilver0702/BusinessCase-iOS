//
//  InstantViewController.m
//  Business Case
//
//  Created by LeeShengGe on 11/23/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "InstantViewController.h"
#import "Attributes.h"
#import "ViewController.h"
#import "EsquenmaGeneralController.h"
#import "FillDetailViewController.h"
#import "IntrodutionViewController.h"
#import "IngresosViewController.h"
#import "AlcancesYLimitesViewController.h"
#import "ContingYViewController.h"
#import "SupuestosViewController.h"
#import "FuenteViewController.h"
#import "ConclusionViewController.h"
#import "SumarioViewController.h"

@interface InstantViewController ()

@end

@implementation InstantViewController
@synthesize background_View, scrollView, example_text;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ok_btn.layer.cornerRadius = 3;
    
    [self initContents];
}

- (void) initContents{
    example_text.layer.borderColor = (__bridge CGColorRef)([UIColor blackColor]);
    if (self.descText == nil || [self.descText isEqualToString:@""]) {
        example_text.text = [Attributes getWellcomeText];
    } else {
        example_text.text = self.descText;
    }

    CGSize maximumLabelSize = CGSizeMake(example_text.frame.size.width, FLT_MAX);
    CGSize aboutHeight = [example_text.text sizeWithFont:example_text.font constrainedToSize:maximumLabelSize lineBreakMode:example_text.lineBreakMode];
    [example_text setFrame:CGRectMake(example_text.frame.origin.x, example_text.frame.origin.y, maximumLabelSize.width, aboutHeight.height)];
    
    [scrollView setScrollEnabled:YES];
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, example_text.frame.size.height+14.0)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)okBtn_Clicked:(id)sender {
    
    if ([self.parentViewController isKindOfClass:[ViewController class]]) {
        ViewController *parentviewController = (ViewController *)self.parentViewController;
        parentviewController.instantView.hidden = YES;
    } else if ([self.parentViewController isKindOfClass:[EsquenmaGeneralController class]]) {
        EsquenmaGeneralController *parentviewController = (EsquenmaGeneralController *)self.parentViewController;
        parentviewController.instantView.hidden = YES;
    } else if ([self.parentViewController isKindOfClass:[FillDetailViewController class]]) {
        FillDetailViewController *parentviewController = (FillDetailViewController *)self.parentViewController;
        parentviewController.instantView.hidden = YES;
    } else if ([self.parentViewController isKindOfClass:[IntrodutionViewController class]]) {
        IntrodutionViewController *parentviewController = (IntrodutionViewController *)self.parentViewController;
        parentviewController.instantView.hidden = YES;
    } else if ([self.parentViewController isKindOfClass:[IngresosViewController class]]) {
        IngresosViewController *parentviewController = (IngresosViewController *)self.parentViewController;
        parentviewController.instantView.hidden = YES;
    } else if ([self.parentViewController isKindOfClass:[AlcancesYLimitesViewController class]]) {
        AlcancesYLimitesViewController *parentviewController = (AlcancesYLimitesViewController *)self.parentViewController;
        parentviewController.instantView.hidden = YES;
    } else if ([self.parentViewController isKindOfClass:[ContingYViewController class]]) {
        ContingYViewController *parentviewController = (ContingYViewController *)self.parentViewController;
        parentviewController.instantView.hidden = YES;
    } else if ([self.parentViewController isKindOfClass:[SupuestosViewController class]]) {
        SupuestosViewController *parentviewController = (SupuestosViewController *)self.parentViewController;
        parentviewController.instantView.hidden = YES;
    } else if ([self.parentViewController isKindOfClass:[FuenteViewController class]]) {
        FuenteViewController *parentviewController = (FuenteViewController *)self.parentViewController;
        parentviewController.instantView.hidden = YES;
    } else if ([self.parentViewController isKindOfClass:[ConclusionViewController class]]) {
        ConclusionViewController *parentviewController = (ConclusionViewController *)self.parentViewController;
        parentviewController.instantView.hidden = YES;
    } else if ([self.parentViewController isKindOfClass:[SumarioViewController class]]) {
        SumarioViewController *parentviewController = (SumarioViewController *)self.parentViewController;
        parentviewController.instantView.hidden = YES;
    } else {
        
    }
    
}
@end
