//
//  DBAdapter.m
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "DBAdapter.h"
#import <sqlite3.h>
#import "DataBase_Attributes.h"
#import "ConfigManager.h"

@implementation DBAdapter

+(NSString *) getDbFilePath
{
    NSString * docsPath= NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES)[0];
    return [docsPath stringByAppendingPathComponent:@"db_businesscases"];
}

+ (int) createTable:(NSString*) filePath
{
    sqlite3* db = NULL;
    int rc=0;
    
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        NSLog(@"Failed to open db connection");
    }
    else
    {
        char * query ="create table businesscase (_id integer primary key autoincrement, file_name text not null, titulo text, tema text, objective text, ingross_desc_sort text, ingross_desc_long text, ahorros_desc_sort text, ahorros_desc_long text, egresos_desc_sort text, egresos_desc_long text, costos_desc_sort text, costos_desc_long text, invesion_desc_sort text, invesion_desc_long text, beneficios_desc_sort text, beneficios_desc_long text, impactos_negative_desc_sort text, impactos_negative_desc_long text, riesgos_desc_sort text, riesgos_desc_long text, introduction text, tiempo text, Capacidad_instalada text, Horarios_de_operacion text, Cobertura_geografic text, Comercializacion text, Personal text, Demanda_de_servicio text, Duracion text, Segmentacion text, Technologia text, Otro1 text, Otro2 text, Otro3 text, dependencia1 text, dependencia2 text, dependencia3 text, dependencia4 text, resultados1 text, resultados2 text, resultados3 text, resultados4 text,supestos1 text, supestos2 text, supestos3 text, conclusion text, recommend text, sumarioejecutio text, contengecia_des_larga text, dependencia_des_larga text, resultadoes_desc_larga text, supestos_desc_larga text)";//, checked_element text);";
        
        char * errMsg;
        rc = sqlite3_exec(db, query,NULL,NULL,&errMsg);
        
        if(SQLITE_OK != rc)
        {
            NSLog(@"Failed to create table rc:%d, msg=%s",rc,errMsg);
        }
        sqlite3_close(db);
    }
    return rc;
}

+(int) insertTableData:(NSString*)filePath : (NSMutableArray *)datas{
    sqlite3* db = NULL;
    int rc=0;
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString *columsnames;
        NSString *columdatas;
        
        NSMutableArray *columnNames = [DataBase_Attributes getTableColumnNames];
        columsnames = [columnNames objectAtIndex:0];
        for (int i=1; i<52; i++) {
            columsnames = [[columsnames stringByAppendingString:@","]stringByAppendingString:[columnNames objectAtIndex:i]];
        }
        NSString *query_Columns = [[@"(" stringByAppendingString:columsnames]stringByAppendingString:@")"];
        
        columdatas = [[@"'"stringByAppendingString:[datas objectAtIndex:0]]stringByAppendingString:@"'"];
        for (int i=1; i<52; i++) {
            columdatas = [[columdatas stringByAppendingString:@","]stringByAppendingString:[[@"'"stringByAppendingString:[datas objectAtIndex:i]]stringByAppendingString:@"'"]];
        }
        ;
        NSString *query_columnDatas = [[@"(" stringByAppendingString:columdatas]stringByAppendingString:@")"];
        
        NSString * query  = [[[@"INSERT INTO businesscase " stringByAppendingString:query_Columns]stringByAppendingString:@" VALUES "]stringByAppendingString:query_columnDatas];
        char * errMsg;
        rc = sqlite3_exec(db, [query UTF8String] ,NULL,NULL,&errMsg);
        if(SQLITE_OK != rc)
        {
            NSLog(@"Failed to insert record  rc:%d, msg=%s",rc,errMsg);
        }
        sqlite3_close(db);
    }
    return rc;
}

+(int) deleteTableData:(NSString *)filePath : (NSString *)file_name{
    sqlite3* db = NULL;
    int rc=0;
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString * query  = [NSString
                             stringWithFormat:@"DELETE FROM businesscase where file_name=\"%@\"",file_name];
        char * errMsg;
        rc = sqlite3_exec(db, [query UTF8String] ,NULL,NULL,&errMsg);
        if(SQLITE_OK != rc)
        {
            NSLog(@"Failed to delete record  rc:%d, msg=%s",rc,errMsg);
        }
        sqlite3_close(db);
    }
    return  rc;
}

+ (int)updateFileData:(NSString *) filePath{
    sqlite3* db = NULL;
    int rc=0;
    rc = sqlite3_open_v2([filePath UTF8String], &db, SQLITE_OPEN_READWRITE , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        NSLog(@"Failed to open db connection");
    }
    else
    {
        NSMutableArray *configData = [ConfigManager getConfigDatas];
        NSMutableArray *columns = [DataBase_Attributes getTableColumnNames];
        
        NSString *update_Query = [[[[columns objectAtIndex:0]stringByAppendingString:@" = '"]stringByAppendingString:[configData objectAtIndex:0]]stringByAppendingString:@"'"];
        
        for (int i=1; i<52; i++) {
            update_Query = [[update_Query stringByAppendingString:@","]stringByAppendingString:[[[[columns objectAtIndex:i]stringByAppendingString:@"='"]stringByAppendingString:[configData objectAtIndex:i]]stringByAppendingString:@"'"]];
        }
        
        
        NSString *where = [[[@"WHERE file_name = "stringByAppendingString:@"'"]stringByAppendingString:[ConfigManager getHeading]]stringByAppendingString:@"'"];
        
        NSString *query = [[[@"UPDATE businesscase SET " stringByAppendingString:update_Query]stringByAppendingString:@" "]stringByAppendingString:where];
        
        char * errMsg;
        rc = sqlite3_exec(db, [query UTF8String] ,NULL,NULL,&errMsg);
        if(SQLITE_OK != rc)
        {
            NSLog(@"Failed to updata record  rc:%d, msg=%s",rc,errMsg);
        }
        sqlite3_close(db);
    }
    return  rc;
}

+(NSArray *) getFileName:(NSString*) filePath
{
    NSMutableArray * fileNames =[[NSMutableArray alloc] init];
    sqlite3* db = NULL;
    sqlite3_stmt* stmt =NULL;
    int rc=0;
    rc = sqlite3_open_v2([filePath UTF8String], &db, SQLITE_OPEN_READONLY , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString  * query = @"SELECT file_name FROM businesscase";
        
        rc =sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
        if(rc == SQLITE_OK)
        {
            while (sqlite3_step(stmt) == SQLITE_ROW) //get each row in loop
            {
                NSString * name =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
               
                [fileNames addObject:name];
                NSLog(@"name: %@",name);
            }
            NSLog(@"Done");
            sqlite3_finalize(stmt);
        }
        else
        {
            NSLog(@"Failed to prepare statement with rc:%d",rc);
        }
        sqlite3_close(db);
    }
    return fileNames;
}

+(NSMutableArray *)getFileDatas:(NSString *)filePath : (NSString *) filename{
//    NSMutableArray * fileNames =[[NSMutableArray alloc] init];
    sqlite3* db = NULL;
    sqlite3_stmt* stmt =NULL;
    int rc=0;
    rc = sqlite3_open_v2([filePath UTF8String], &db, SQLITE_OPEN_READONLY , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        NSLog(@"Failed to open db connection");
        return nil;
    }
    else
    {
        NSString  * query = [[@"SELECT * FROM businesscase WHERE file_name= '"stringByAppendingString:filename]stringByAppendingString:@"'"];
        
        NSMutableArray *filedatas = [[NSMutableArray alloc]init];
        
        rc =sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
        if(rc == SQLITE_OK)
        {
            while (sqlite3_step(stmt) == SQLITE_ROW) //get each row in loop
            {
                NSString * file_name =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
                [filedatas addObject:file_name];
                
                NSString * titulo = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
                 [filedatas addObject:titulo];
                
                NSString * tema = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
                 [filedatas addObject:tema];
                
                NSString * objective = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
                 [filedatas addObject:objective];
                
                NSString * ingross_desc_sort = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
                 [filedatas addObject:ingross_desc_sort];
                
                NSString * ingross_desc_long = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 6)];
                 [filedatas addObject:ingross_desc_long];
                
                NSString * ahorros_desc_sort = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 7)];
                 [filedatas addObject:ahorros_desc_sort];
                
                NSString * ahorros_desc_long = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 8)];
                 [filedatas addObject:ahorros_desc_long];
                
                NSString * egresos_desc_sort = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 9)];
                 [filedatas addObject:egresos_desc_sort];
                
                NSString * egresos_desc_long = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 10)];
                 [filedatas addObject:egresos_desc_long];
                
                NSString * costos_desc_sort = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 11)];
                 [filedatas addObject:costos_desc_sort];
                
                NSString * costos_desc_long = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 12)];
                 [filedatas addObject:costos_desc_long];
                
                NSString * invesion_desc_sort = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 13)];
                 [filedatas addObject:invesion_desc_sort];
                
                NSString * invesion_desc_long = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 14)];
                 [filedatas addObject:invesion_desc_long];
                
                NSString * beneficios_desc_sort = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 15)];
                 [filedatas addObject:beneficios_desc_sort];
                
                NSString * beneficios_desc_long = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 16)];
                 [filedatas addObject:beneficios_desc_long];
                
                NSString * impactos_negative_desc_sort = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 17)];
                 [filedatas addObject:impactos_negative_desc_sort];
                
                NSString * impactos_negative_desc_long = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 18)];
                 [filedatas addObject:impactos_negative_desc_long];
                
                NSString * riesgos_desc_sort = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 19)];
                 [filedatas addObject:riesgos_desc_sort];
                
                NSString * riesgos_desc_long = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 20)];
                 [filedatas addObject:riesgos_desc_long];
                
                NSString * introduction = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 21)];
                 [filedatas addObject:introduction];
                
                NSString * tiempo = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 22)];
                 [filedatas addObject:tiempo];
                
                NSString * Capacidad_instalada = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 23)];
                 [filedatas addObject:Capacidad_instalada];
                
                NSString * Horarios_de_operacion = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 24)];
                 [filedatas addObject:Horarios_de_operacion];
                
                NSString * Cobertura_geografic = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 25)];
                 [filedatas addObject:Cobertura_geografic];
                
                NSString * Comercializacion = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 26)];
                 [filedatas addObject:Comercializacion];
                
                NSString * Personal = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 27)];
                 [filedatas addObject:Personal];
                
                NSString * Demanda_de_servicio = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 28)];
                 [filedatas addObject:Demanda_de_servicio];
                
                NSString * Duracion = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 29)];
                 [filedatas addObject:Duracion];
                
                NSString * Segmentacion = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 30)];
                 [filedatas addObject:Segmentacion];
                
                NSString * Technologia = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 31)];
                 [filedatas addObject:Technologia];
                
                NSString * Otro1 = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 32)];
                 [filedatas addObject:Otro1];
                
                NSString * Otro2 = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 33)];
                 [filedatas addObject:Otro2];
                
                NSString * Otro3 = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 34)];
                 [filedatas addObject:Otro3];
                
                NSString * dependencia1 = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 35)];
                 [filedatas addObject:dependencia1];
                
                NSString * dependencia2 = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 36)];
                 [filedatas addObject:dependencia2];
                
                NSString * dependencia3 = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 37)];
                 [filedatas addObject:dependencia3];
                
                NSString * dependencia4 = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 38)];
                [filedatas addObject:dependencia4];
                
                NSString * resultados1 = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 39)];
                 [filedatas addObject:resultados1];
                
                NSString * resultados2 = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 40)];
                 [filedatas addObject:resultados2];
                
                NSString * resultados3 = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 41)];
                 [filedatas addObject:resultados3];
                
                NSString * resultados4 = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 42)];
                 [filedatas addObject:resultados4];
                
                NSString * supestos1 = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 43)];
                 [filedatas addObject:supestos1];
                
                NSString * supestos2 = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 44)];
                 [filedatas addObject:supestos2];
                
                NSString * supestos3 = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 45)];
                 [filedatas addObject:supestos3];
                
                NSString * conclusion = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 46)];
                 [filedatas addObject:conclusion];
                
                NSString * recommend = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 47)];
                 [filedatas addObject:recommend];
                
                NSString * sumarioejecutio = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 48)];
                 [filedatas addObject:sumarioejecutio];
                
                NSString * contengecia_des_larga = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 49)];
                 [filedatas addObject:contengecia_des_larga];
                
                NSString * dependencia_des_larga = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 50)];
                 [filedatas addObject:dependencia_des_larga];
                
                NSString * resultadoes_desc_larga = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 51)];
                 [filedatas addObject:resultadoes_desc_larga];
                
                NSString * supestos_desc_larga = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 52)];
                 [filedatas addObject:supestos_desc_larga];
                
//                NSString * checked_element = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 53)];
//                 [filedatas addObject:checked_element];
                
            }
            NSLog(@"Done");
            sqlite3_finalize(stmt);
        }
        else
        {
            NSLog(@"Failed to prepare statement with rc:%d",rc);
             sqlite3_close(db);
            return nil;
        }
        sqlite3_close(db);
        return filedatas;
    }
}



@end
