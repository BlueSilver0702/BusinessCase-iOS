//
//  ConfigAtrributes.h
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigAtrributes : NSObject

@property (weak, nonatomic) NSString *HEADING;
@property (weak, nonatomic) NSString *TITLE;
@property (weak, nonatomic) NSString *TEMA;
@property (weak, nonatomic) NSString *OBJECTIVE;
@property (weak, nonatomic) NSString *SORTDESCRIPTION1;
@property (weak, nonatomic) NSString *LARGEDESCRIPTION1;
@property (weak, nonatomic) NSString *SORTDESCRIPTIONAH1;
@property (weak, nonatomic) NSString *LARGEDESCRIPTIONAH1;
@property (weak, nonatomic) NSString *SORTDESCRIPTIONEGROS1;
@property (weak, nonatomic) NSString *LARGEDESCRIPTIONEGROS1;
@property (weak, nonatomic) NSString *LARGEDESCRIPTIONEGROS2;
@property (weak, nonatomic) NSString *SORTDESCRIPTIONEGROS2;
@property (weak, nonatomic) NSString *SORTDESCRIPTIONEGROS3;
@property (weak, nonatomic) NSString *LARGEDESCRIPTIONEGROS3;
@property (weak, nonatomic) NSString *LARGEDESCRIPTIONEGROS4;
@property (weak, nonatomic) NSString *SORTDESCRIPTIONEGROS4;
@property (weak, nonatomic) NSString *SORTDESCRIPTIONAH2;
@property (weak, nonatomic) NSString *LARGEDESCRIPTIONAH2;
@property (weak, nonatomic) NSString *SORTDESCRIPTIONAH3;
@property (weak, nonatomic) NSString *LARGEDESCRIPTIONAH3;
@property (weak, nonatomic) NSString *INTRODUCTION;
@property (weak, nonatomic) NSString *SORTDESCRIPTION2;
@property (weak, nonatomic) NSString *LARGEDESCRIPTION2;
@property (weak, nonatomic) NSString *EGROSESVARIABLE;
@property (weak, nonatomic) NSString *SORTDESCRIPTIONAH4;
@property (weak, nonatomic) NSString *LARGEDESCRIPTION3;
@property (weak, nonatomic) NSString *LARGEDESCRIPTION4;
@property (weak, nonatomic) NSString *AHORROSVARIABLE;
@property (weak, nonatomic) NSString *AHORROSVALUE;
@property (weak, nonatomic) NSString *COSTOSVARIABLE;
@property (weak, nonatomic) NSString *COSTOSVALUE;
@property (weak, nonatomic) NSString *ALCANCESYLIMIT;
@property (weak, nonatomic) NSString *ALCANCESYLIMITCAPCACIDAD;
@property (weak, nonatomic) NSString *ALCANCESYLIMITHORARIOS;
@property (weak, nonatomic) NSString *ALCANCESYLIMITCOBERTURA;
@property (weak, nonatomic) NSString *ALCANCESYLIMITCOMERCIAL;
@property (weak, nonatomic) NSString *ALCANCESYLIMITPERSONAL;
@property (weak, nonatomic) NSString *ALCANCESYLIMITDEMANDA;
@property (weak, nonatomic) NSString *ALCANCESYLIMITDURACION;
@property (weak, nonatomic) NSString *ALCANCESYLIMITSEGMEN;
@property (weak, nonatomic) NSString *ALCANCESYLIMITTECHNOLOGIA;
@property (weak, nonatomic) NSString *ALCANCESYLIMITOTRO1;
@property (weak, nonatomic) NSString *ALCANCESYLIMITOTRO2;
@property (weak, nonatomic) NSString *ALCANCESYLIMITOTRO3;
@property (weak, nonatomic) NSString *CONTENGENCIADESLARGA;
@property (weak, nonatomic) NSString *DEPENDENCIA1;
@property (weak, nonatomic) NSString *DEPENDENCIA2;
@property (weak, nonatomic) NSString *DEPENDENCIA3;
@property (weak, nonatomic) NSString *DEPENDENCIA4;
@property (weak, nonatomic) NSString *DEPENDENCIADESLARGA;
@property (weak, nonatomic) NSString *RESULTADOSDESCLARGA;
@property (weak, nonatomic) NSString *SUPUESTOS1;
@property (weak, nonatomic) NSString *SUPUESTOS2;
@property (weak, nonatomic) NSString *SUPUESTOS3;
@property (weak, nonatomic) NSString *SUPUESTOS4;
@property (weak, nonatomic) NSString *SUPUESTOSDESCLARGA;
@property (weak, nonatomic) NSString *FUNTESINGRESOS;
@property (weak, nonatomic) NSString *CONCLUSION;
@property (weak, nonatomic) NSString *RECOMENDED;
@property (weak, nonatomic) NSString *SUMMARY;
@property (weak, nonatomic) NSString *RESULTADOS1;
@property (weak, nonatomic) NSString *RESULTADOS2;
@property (weak, nonatomic) NSString *RESULTADOS3;
@property (weak, nonatomic) NSString *RESULTADOS4;

- (void) initAttributes;
+(ConfigAtrributes *)getClass;
@end
