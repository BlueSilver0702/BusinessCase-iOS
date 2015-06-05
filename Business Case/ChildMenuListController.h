//
//  ChildMenuListController.h
//  Business Case
//
//  Created by LeeShengGe on 11/23/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChildMenuListController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray  *childMenuList;
}

@property (weak, nonatomic) IBOutlet UITableView *childmenu_list;
@property NSInteger selectedParentMenuNum;
@property (nonatomic)BOOL isHelp;
@end
