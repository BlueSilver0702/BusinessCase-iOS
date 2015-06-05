//
//  ConfigManager.m
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "ConfigManager.h"
#import "ConfigAtrributes.h"

@implementation ConfigManager

+ (void) initConfigFile {
    NSString *config_path = [self dataFilePath];
    NSMutableDictionary *config_dic;
//    if (config_path == nil) {
       config_dic = [[NSMutableDictionary alloc] init];
//    } else{
//        config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
//    }
//    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] init];
    [config_dic writeToFile:config_path atomically:YES];
}

+(NSString *)dataFilePath {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [path objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"config_parent"];
}

+(NSMutableArray *)getConfigDatas{
    NSMutableArray *datas = [[NSMutableArray alloc]init];
    
    [datas addObject:[self getHeading]];
    [datas addObject:[self getTitle]];
    [datas addObject:[self getTema]];
    [datas addObject:[self getObjective]];
    
    [datas addObject:[self getDescriptionShort1]];
    [datas addObject:[self getDescriptionLarge1]];
    [datas addObject:[self getDescriptionShortAhorros1]];
    [datas addObject:[self getDescriptionLargeAhorros1]];
    [datas addObject:[self getDescriptionShortEgresos1]];
    [datas addObject:[self getDescriptionLargeEgresos1]];
    [datas addObject:[self getDescriptionShortCostos]];
    [datas addObject:[self getDescriptionLargeCostos]];
    [datas addObject:[self getDescriptionShortInversion]];
    [datas addObject:[self getDescriptionLargeInversion]];
    [datas addObject:[self getDescriptionShortBeneficios]];
    [datas addObject:[self getDescriptionLargeBeneficios]];
    [datas addObject:[self getDescriptionShortImpactos]];
    [datas addObject:[self getDescriptionLargeImpactos]];
    [datas addObject:[self getDescriptionShortRiesgos]];
    [datas addObject:[self getDescriptionLargeRiesgos]];
    [datas addObject:[self getIntroduction]];
    
     [datas addObject:[self getAlcancesYLimits]];
     [datas addObject:[self getAlcancesYLimitsCapcidad]];
     [datas addObject:[self getAlcancesYLimitsHorarios]];
     [datas addObject:[self getAlcancesYLimitsCobertura]];
     [datas addObject:[self getAlcancesYLimitsComercial]];
     [datas addObject:[self getAlcancesYLimitsPersonal]];
     [datas addObject:[self getAlcancesYLimitsDemanda]];
     [datas addObject:[self getAlcancesYLimitsDuracion]];
     [datas addObject:[self getAlcancesYLimitsSegmen]];
     [datas addObject:[self getAlcancesYLimitsTechnologia]];
     [datas addObject:[self getAlcancesYLimitsOtro1]];
     [datas addObject:[self getAlcancesYLimitsOtro2]];
     [datas addObject:[self getAlcancesYLimitsOtro3]];
    
     [datas addObject:[self getDependencia1]];
     [datas addObject:[self getDependencia2]];
     [datas addObject:[self getDependencia3]];
     [datas addObject:[self getDependencia4]];
     [datas addObject:[self getResultados1]];
     [datas addObject:[self getResultados2]];
     [datas addObject:[self getResultados3]];
     [datas addObject:[self getResultados4]];
     [datas addObject:[self getSupuestos1]];
     [datas addObject:[self getSupuestos2]];
     [datas addObject:[self getSupuestos3]];
     [datas addObject:[self getConclusion]];
     [datas addObject:[self getRecommendies]];
     [datas addObject:[self getSummary]];
     [datas addObject:[self getContingenciaDesLarga]];
     [datas addObject:[self getDependenciaDesLarga]];
     [datas addObject:[self getResultadosDescLarga]];
     [datas addObject:[self getSupuestosDescLarga]];
//     [datas addObject:[self getcheckedElement]];
    
    return datas;
}

+(void) setHeading:(NSString *)heading{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:heading forKey:obj.HEADING];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getHeading{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    if ([config_dic valueForKey:obj.HEADING] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.HEADING];
    }
}

+(void) setTitle:(NSString *)title{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    [config_dic setObject:title forKey:obj.TITLE];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getTitle{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.TITLE] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.TITLE];
    }
}

+(void) setTema:(NSString *)tema{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    [config_dic setObject:tema forKey:obj.TEMA];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getTema{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    if ([config_dic valueForKey:obj.TEMA] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.TEMA];
    }
}

+(void) setObjective:(NSString *)objective{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:objective forKey:obj.OBJECTIVE];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getObjective{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.OBJECTIVE] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.OBJECTIVE];
    }
}

+(void)setDescriptionShort1:(NSString *)descShort1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:descShort1  forKey:obj.SORTDESCRIPTION1];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDescriptionShort1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.SORTDESCRIPTION1] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.SORTDESCRIPTION1];
    }
}

+(void)setDescriptionLarge1:(NSString *)descLarge1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:descLarge1  forKey:obj.LARGEDESCRIPTION1];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDescriptionLarge1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.LARGEDESCRIPTION1] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.LARGEDESCRIPTION1];
    }
}

+(void)setDescriptionShortAhorros1:(NSString *)descshort1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:descshort1  forKey:obj.SORTDESCRIPTIONAH1];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDescriptionShortAhorros1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.SORTDESCRIPTIONAH1] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.SORTDESCRIPTIONAH1];
    }
}


+(void)setDescriptionLargeAhorros1:(NSString *)descLarge1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:descLarge1  forKey:obj.LARGEDESCRIPTIONAH1];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDescriptionLargeAhorros1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.LARGEDESCRIPTIONAH1] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.LARGEDESCRIPTIONAH1];
    }
}

+(void)setDescriptionShortEgresos1:(NSString *)descShort1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:descShort1  forKey:obj.SORTDESCRIPTIONEGROS1];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDescriptionShortEgresos1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.SORTDESCRIPTIONEGROS1] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.SORTDESCRIPTIONEGROS1];
    }
}

+(void)setDescriptionLargeEgresos1:(NSString *)descLarge1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:descLarge1  forKey:obj.LARGEDESCRIPTIONEGROS1];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDescriptionLargeEgresos1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.LARGEDESCRIPTIONEGROS1] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.LARGEDESCRIPTIONEGROS1];
    }
}





+(void)setDescriptionShortCostos:(NSString *)strDescCorta{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:strDescCorta  forKey:obj.SORTDESCRIPTIONEGROS2];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDescriptionShortCostos{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.SORTDESCRIPTIONEGROS2] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.SORTDESCRIPTIONEGROS2];
    }
}




+(void)setDescriptionLargeCostos:(NSString *)strDescLarga{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:strDescLarga  forKey:obj.LARGEDESCRIPTIONEGROS2];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDescriptionLargeCostos{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.LARGEDESCRIPTIONEGROS2] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.LARGEDESCRIPTIONEGROS2];
    }
}





+(void)setDescriptionShortInversion:(NSString *)strDescCorta{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:strDescCorta  forKey:obj.SORTDESCRIPTIONEGROS3];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDescriptionShortInversion{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.SORTDESCRIPTIONEGROS3] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.SORTDESCRIPTIONEGROS3];
    }
}

+(void)setDescriptionLargeInversion:(NSString *)descLargeInv{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:descLargeInv  forKey:obj.LARGEDESCRIPTIONEGROS3];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDescriptionLargeInversion{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.LARGEDESCRIPTIONEGROS3] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.LARGEDESCRIPTIONEGROS3];
    }
}




+(void)setDescriptionLargeBeneficios:(NSString *)descLargeBen{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:descLargeBen  forKey:obj.LARGEDESCRIPTIONEGROS4];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDescriptionLargeBeneficios{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.LARGEDESCRIPTIONEGROS4] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.LARGEDESCRIPTIONEGROS4];
    }
}



+(void)setDescriptionShortBeneficios:(NSString *)descShortBen{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:descShortBen  forKey:obj.SORTDESCRIPTIONEGROS4];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDescriptionShortBeneficios{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.SORTDESCRIPTIONEGROS4] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.SORTDESCRIPTIONEGROS4];
    }
}




+(void)setDescriptionShortImpactos:(NSString *)descShortimp{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:descShortimp  forKey:obj.SORTDESCRIPTIONAH2];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDescriptionShortImpactos{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.SORTDESCRIPTIONAH2] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.SORTDESCRIPTIONAH2];
    }
}




+(void)setDescriptionLargeImpactos:(NSString *)descLargeimp{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:descLargeimp  forKey:obj.LARGEDESCRIPTIONAH2];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDescriptionLargeImpactos{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.LARGEDESCRIPTIONAH2] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.LARGEDESCRIPTIONAH2];
    }
}



+(void)setDescriptionShortRiesgos:(NSString *)descShortRig{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:descShortRig  forKey:obj.SORTDESCRIPTIONAH3];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDescriptionShortRiesgos{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.SORTDESCRIPTIONAH3] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.SORTDESCRIPTIONAH3];
    }
}



+(void)setDescriptionLargeRiesgos:(NSString *)descLargeRig{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:descLargeRig  forKey:obj.LARGEDESCRIPTIONAH3];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDescriptionLargeRiesgos{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.LARGEDESCRIPTIONAH3] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.LARGEDESCRIPTIONAH3];
    }
    
}

+(void)setIntroduction:(NSString *)intro{
        NSString *config_path = [self dataFilePath];
        if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
            [self initConfigFile];
        }
        NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
        
        ConfigAtrributes *obj = [ConfigAtrributes getClass];
        [obj initAttributes];
        
        [config_dic setObject:intro  forKey:obj.INTRODUCTION];
        
        [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getIntroduction{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.INTRODUCTION] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.INTRODUCTION];
    }
}


+(void)setVariable:(NSString *)variable{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:variable  forKey:obj.SORTDESCRIPTION2];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getVariable{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.SORTDESCRIPTION2] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.SORTDESCRIPTION2];
    }
}

+(void)setValor:(NSString *)valor{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:valor  forKey:obj.LARGEDESCRIPTION2];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getValor{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.LARGEDESCRIPTION2] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.LARGEDESCRIPTION2];
    }
}


+(void)setEgrossVariable:(NSString *)egross{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:egross  forKey:obj.EGROSESVARIABLE];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getEgrossVariable{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.EGROSESVARIABLE] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.EGROSESVARIABLE];
    }
}

+(void)setEgrossValor:(NSString *)valor{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:valor  forKey:obj.SORTDESCRIPTIONAH4];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getEgrossValor{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.SORTDESCRIPTIONAH4] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.SORTDESCRIPTIONAH4];
    }
}


+(void)setInversionVariable:(NSString *)variable{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:variable  forKey:obj.LARGEDESCRIPTION3];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getInversionVariable{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.LARGEDESCRIPTION3] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.LARGEDESCRIPTION3];
    }
}

+(void) setInversionValor:(NSString *)valor{
        NSString *config_path = [self dataFilePath];
        if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
            [self initConfigFile];
        }
        NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
        
        ConfigAtrributes *obj = [ConfigAtrributes getClass];
        [obj initAttributes];
        
        [config_dic setObject:valor  forKey:obj.LARGEDESCRIPTION4];
        
        [config_dic writeToFile:config_path atomically:NO];
    }
    
+(NSString *)getInversionValor{
        NSString *config_path = [self dataFilePath];
        if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
            [self initConfigFile];
        }
        NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
        
        ConfigAtrributes *obj = [ConfigAtrributes getClass];
        [obj initAttributes];
        
        if ([config_dic valueForKey:obj.LARGEDESCRIPTION4] == nil) {
            return @"";
        }else{
            return (NSString *)[config_dic valueForKey:obj.LARGEDESCRIPTION4];
        }
}

+(void) setAhorrosVariable:(NSString *)egross{
        NSString *config_path = [self dataFilePath];
        if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
            [self initConfigFile];
        }
        NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
        
        ConfigAtrributes *obj = [ConfigAtrributes getClass];
        [obj initAttributes];
        
        [config_dic setObject:egross  forKey:obj.AHORROSVARIABLE];
        
        [config_dic writeToFile:config_path atomically:NO];
    }
    
+(NSString *)getAhorrosVariable{
        NSString *config_path = [self dataFilePath];
        if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
            [self initConfigFile];
        }
        NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
        
        ConfigAtrributes *obj = [ConfigAtrributes getClass];
        [obj initAttributes];
        
        if ([config_dic valueForKey:obj.AHORROSVARIABLE] == nil) {
            return @"";
        }else{
            return (NSString *)[config_dic valueForKey:obj.AHORROSVARIABLE];
        }
}


+(void) setAhorrosValor:(NSString *)valor{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:valor  forKey:obj.AHORROSVALUE];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getAhorrosValor{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.AHORROSVALUE] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.AHORROSVALUE];
    }
}


+(void) setCostosVariable:(NSString *)egross{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:egross  forKey:obj.COSTOSVARIABLE];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getCostosVariable{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.COSTOSVARIABLE] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.COSTOSVARIABLE];
    }
}

+(void) setCostosValor:(NSString *)valor{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:valor  forKey:obj.COSTOSVALUE];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getCostosValor{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.COSTOSVALUE] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.COSTOSVALUE];
    }
}



+(void) setAlcancesYLimits:(NSString *)alcances{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:alcances	  forKey:obj.ALCANCESYLIMIT];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getAlcancesYLimits	{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.ALCANCESYLIMIT] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.ALCANCESYLIMIT];
    }
}


+(void) setAlcancesYLimitsCapcidad:(NSString *)alcances{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:alcances	  forKey:obj.ALCANCESYLIMITCAPCACIDAD];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getAlcancesYLimitsCapcidad	{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.ALCANCESYLIMITCAPCACIDAD] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.ALCANCESYLIMITCAPCACIDAD];
    }
}

+(void) setAlcancesYLimitsHorarios:(NSString *)alcances{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:alcances	  forKey:obj.ALCANCESYLIMITHORARIOS];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getAlcancesYLimitsHorarios	{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.ALCANCESYLIMITHORARIOS] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.ALCANCESYLIMITHORARIOS];
    }
}



+(void) setAlcancesYLimitsCobertura:(NSString *)cobertura{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:cobertura	  forKey:obj.ALCANCESYLIMITCOBERTURA];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getAlcancesYLimitsCobertura	{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.ALCANCESYLIMITCOBERTURA] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.ALCANCESYLIMITCOBERTURA];
    }
}



+(void) setAlcancesYLimitsComercial:(NSString *)commercial{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:commercial	  forKey:obj.ALCANCESYLIMITCOMERCIAL];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getAlcancesYLimitsComercial	{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.ALCANCESYLIMITCOMERCIAL] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.ALCANCESYLIMITCOMERCIAL];
    }
}


+(void) setAlcancesYLimitsPersonal:(NSString *)personal{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:personal	  forKey:obj.ALCANCESYLIMITPERSONAL];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getAlcancesYLimitsPersonal	{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.ALCANCESYLIMITPERSONAL] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.ALCANCESYLIMITPERSONAL];
    }
}


+(void) setAlcancesYLimitsDemanda:(NSString *)demanda{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:demanda	  forKey:obj.ALCANCESYLIMITDEMANDA];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getAlcancesYLimitsDemanda	{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.ALCANCESYLIMITDEMANDA] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.ALCANCESYLIMITDEMANDA];
    }
}


+(void) setAlcancesYLimitsDuracion:(NSString *)duracion{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:duracion	  forKey:obj.ALCANCESYLIMITDURACION];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getAlcancesYLimitsDuracion	{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.ALCANCESYLIMITDURACION] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.ALCANCESYLIMITDURACION];
    }
}


+(void) setAlcancesYLimitsSegmen:(NSString *)segmen{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:segmen	  forKey:obj.ALCANCESYLIMITSEGMEN];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getAlcancesYLimitsSegmen	{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.ALCANCESYLIMITSEGMEN] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.ALCANCESYLIMITSEGMEN];
    }
}

+(void) setAlcancesYLimitsTechnologia:(NSString *)technologia{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:technologia	  forKey:obj.ALCANCESYLIMITTECHNOLOGIA];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getAlcancesYLimitsTechnologia	{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.ALCANCESYLIMITTECHNOLOGIA] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.ALCANCESYLIMITTECHNOLOGIA];
    }
}

+(void) setAlcancesYLimitsOtro1:(NSString *)otro1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:otro1	  forKey:obj.ALCANCESYLIMITOTRO1];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getAlcancesYLimitsOtro1	{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.ALCANCESYLIMITOTRO1] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.ALCANCESYLIMITOTRO1];
    }
}

+(void) setAlcancesYLimitsOtro2:(NSString *)otro2{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:otro2	  forKey:obj.ALCANCESYLIMITOTRO2];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getAlcancesYLimitsOtro2	{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.ALCANCESYLIMITOTRO2] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.ALCANCESYLIMITOTRO2];
    }
}


+(void) setAlcancesYLimitsOtro3:(NSString *)otro3{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:otro3	  forKey:obj.ALCANCESYLIMITOTRO3];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getAlcancesYLimitsOtro3	{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.ALCANCESYLIMITOTRO3] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.ALCANCESYLIMITOTRO3];
    }
}


+(void) setContingenciaDesLarga:(NSString *)contengenciaDesLarga{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:contengenciaDesLarga	  forKey:obj.CONTENGENCIADESLARGA];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getContingenciaDesLarga	{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.CONTENGENCIADESLARGA] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.CONTENGENCIADESLARGA];
    }
}

+(void) setDependencia1:(NSString *)dependencia1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:dependencia1	  forKey:obj.DEPENDENCIA1];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDependencia1	{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.DEPENDENCIA1] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.DEPENDENCIA1];
    }
}

+(void) setDependencia2:(NSString *)dependencia2{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:dependencia2	  forKey:obj.DEPENDENCIA2];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDependencia2 {
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.DEPENDENCIA2] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.DEPENDENCIA2];
    }
}

+(void) setDependencia3:(NSString *)dependencia3{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:dependencia3	  forKey:obj.DEPENDENCIA3];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDependencia3 {
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.DEPENDENCIA3] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.DEPENDENCIA3];
    }
}

+(void) setDependencia4:(NSString *)dependencia4{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:dependencia4	  forKey:obj.DEPENDENCIA4];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDependencia4 {
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.DEPENDENCIA4] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.DEPENDENCIA4];
    }
}

+(void) setDependenciaDesLarga:(NSString *)DependenciaDeslarga{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:DependenciaDeslarga	  forKey:obj.DEPENDENCIADESLARGA];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getDependenciaDesLarga {
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.DEPENDENCIADESLARGA] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.DEPENDENCIADESLARGA];
    }
}


+(void) setResultadosDescLarga:(NSString *)resultadosDescLarga{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:resultadosDescLarga	  forKey:obj.RESULTADOSDESCLARGA];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getResultadosDescLarga {
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.RESULTADOSDESCLARGA] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.RESULTADOSDESCLARGA];
    }
}

+(void) setRecommendies:(NSString *)recommend{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:recommend	  forKey:obj.RECOMENDED];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getRecommendies {
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.RECOMENDED] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.RECOMENDED];
    }
}


+(void) setSupuestos1:(NSString *)setsupestos1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:setsupestos1  forKey:obj.SUPUESTOS1];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getSupuestos1 {
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.SUPUESTOS1] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.SUPUESTOS1];
    }
}

+(void) setSupuestos2:(NSString *)setsupestos2{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:setsupestos2  forKey:obj.SUPUESTOS2];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getSupuestos2 {
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.SUPUESTOS2] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.SUPUESTOS2];
    }
}

+(void) setSupuestos3:(NSString *)setsupestos3{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:setsupestos3  forKey:obj.SUPUESTOS3];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getSupuestos3 {
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.SUPUESTOS3] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.SUPUESTOS3];
    }
}

+(void) setSupuestos4:(NSString *)setsupestos4{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:setsupestos4  forKey:obj.SUPUESTOS4];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getSupuestos4{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.SUPUESTOS4] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.SUPUESTOS4];
    }
}

+(void) setSupuestosDescLarga:(NSString *)supuestos{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:supuestos  forKey:obj.SUPUESTOSDESCLARGA];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getSupuestosDescLarga{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.SUPUESTOSDESCLARGA] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.SUPUESTOSDESCLARGA];
    }
}


+(void) setFuntesIngresos:(NSString *)ingresos{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:ingresos  forKey:obj.FUNTESINGRESOS];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getFuntesIngresos{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.FUNTESINGRESOS] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.FUNTESINGRESOS	];
    }
}

+(void) setConclusion:(NSString *)conclusion{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:conclusion  forKey:obj.CONCLUSION];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getConclusion{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.CONCLUSION] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.CONCLUSION	];
    }
}

+(void) setSummary:(NSString *)summary{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:summary  forKey:obj.SUMMARY];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getSummary{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.SUMMARY] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.SUMMARY];
    }
}

+(void) setResultados1:(NSString *)resultados1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:resultados1  forKey:obj.RESULTADOS1];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getResultados1{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.RESULTADOS1] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.RESULTADOS1];
    }
}

+(void) setResultados2:(NSString *)resultados2{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:resultados2  forKey:obj.RESULTADOS2];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getResultados2{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.RESULTADOS2] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.RESULTADOS2];
    }
}

+(void) setResultados3:(NSString *)resultados3{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:resultados3  forKey:obj.RESULTADOS3];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getResultados3{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.RESULTADOS3] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.RESULTADOS3];
    }
}

+(void) setResultados4:(NSString *)resultados4{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    [config_dic setObject:resultados4  forKey:obj.RESULTADOS4];
    
    [config_dic writeToFile:config_path atomically:NO];
}

+(NSString *)getResultados4{
    NSString *config_path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:config_path]) {
        [self initConfigFile];
    }
    NSMutableDictionary *config_dic = [[NSMutableDictionary alloc] initWithContentsOfFile:config_path];
    
    ConfigAtrributes *obj = [ConfigAtrributes getClass];
    [obj initAttributes];
    
    if ([config_dic valueForKey:obj.RESULTADOS4] == nil) {
        return @"";
    }else{
        return (NSString *)[config_dic valueForKey:obj.RESULTADOS4];
    }
}

@end
