//
//  DBAdapter.h
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBAdapter : NSObject

+(NSString *) getDbFilePath;
+ (int) createTable:(NSString*) filePath;
+(int) insertTableData:(NSString*)filePath : (NSMutableArray *)datas;
+(NSArray *) getFileName:(NSString*) filePath;
+(int) deleteTableData:(NSString *)filePath : (NSString *)file_name;
+(NSMutableArray *)getFileDatas:(NSString *)filePath : (NSString *) filename;
+(int)updateFileData:(NSString *) filePath;
@end
