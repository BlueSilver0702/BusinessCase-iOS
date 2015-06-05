//
//  MenuListViewCell.h
//  Business Case
//
//  Created by LeeShengGe on 11/23/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuListViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *menuImage;
@property (weak, nonatomic) IBOutlet UILabel *menuName;
@property (weak, nonatomic) IBOutlet UILabel *menuSubName;
@property (weak, nonatomic) IBOutlet UIImageView *rightImage;
@end
