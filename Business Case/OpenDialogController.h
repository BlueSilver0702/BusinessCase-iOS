//
//  OpenDialogController.h
//  Business Case
//
//  Created by LeeShengGe on 11/22/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpenDialogController : UIViewController<UITableViewDataSource, UITableViewDataSource>{
    
    
}
@property NSInteger selectedDoc;
@property (weak, nonatomic) IBOutlet UIView *background_View;
@property (weak, nonatomic) IBOutlet UIButton *open_btn;
@property (weak, nonatomic) IBOutlet UIButton *delet_btn;
@property (weak, nonatomic) IBOutlet UITableView *docList;

@property (nonatomic) bool isOld;

@property NSArray *docs;

- (IBAction)openDoc_Clicked:(id)sender;
- (IBAction)deleteDoc_Clicked:(id)sender;
@end
