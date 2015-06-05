//
//  Attributes.h
//  Business Case
//
//  Created by LeeShengGe on 11/23/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Attributes : NSObject

+(NSMutableArray *)getParentMenuList;
+(NSString *)getWellcomeText;
+(NSMutableArray *)getChildMenuList;
+(NSMutableArray *)getDescription:(NSInteger)cat;
+(NSMutableArray *)getHelp:(NSInteger) cat;

@end
