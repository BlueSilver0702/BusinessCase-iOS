//
//  Faq1ViewController.m
//  Business Case
//
//  Created by User on 3/3/15.
//  Copyright (c) 2015 LeeShengGe. All rights reserved.
//

#import "Faq1ViewController.h"

@interface Faq1ViewController ()

@end

@implementation Faq1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back_Click:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)b1_Click:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://BCase.com/"]];
}

- (IBAction)b2_Click:(id)sender {
    UIAlertView *alView = [[UIAlertView alloc] initWithTitle:@"Choose an Email Client" message:@"No applications can perform this action." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alView show];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
