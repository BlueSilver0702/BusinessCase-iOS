//
//  Confirm1ViewController.h
//  Business Case
//
//  Created by User on 3/11/15.
//  Copyright (c) 2015 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Confirm1ViewController : UIViewController<UIAlertViewDelegate>
{
    NSString *mailFile;
}
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIButton *ok_btn;
@property (weak, nonatomic) IBOutlet UIButton *cancel_btn;
@property (nonatomic) bool isDoc;
@property (nonatomic, retain) NSString *fileName;

- (IBAction)btn1_Clicked:(id)sender;
- (IBAction)btn2_Clicked:(id)sender;

@end
