//
//  DocViewController.h
//  Business Case
//
//  Created by User on 3/16/15.
//  Copyright (c) 2015 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DocViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *menu_title;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSString *downFilePath;
@property (nonatomic, retain) NSString *fileName;

- (IBAction)backBtn_Clicked:(id)sender;

@end
