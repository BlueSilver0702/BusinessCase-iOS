//
//  ConfigAtrributes.m
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "ConfigAtrributes.h"

@implementation ConfigAtrributes

@synthesize HEADING;
@synthesize TITLE;
@synthesize TEMA;
@synthesize OBJECTIVE;
@synthesize SORTDESCRIPTION1;
@synthesize LARGEDESCRIPTION1;
@synthesize SORTDESCRIPTIONAH1;
@synthesize LARGEDESCRIPTIONAH1;
@synthesize SORTDESCRIPTIONEGROS1;
@synthesize LARGEDESCRIPTIONEGROS1;
@synthesize LARGEDESCRIPTIONEGROS2;
@synthesize SORTDESCRIPTIONEGROS2;
@synthesize SORTDESCRIPTIONEGROS3;
@synthesize LARGEDESCRIPTIONEGROS3;
@synthesize LARGEDESCRIPTIONEGROS4;
@synthesize SORTDESCRIPTIONEGROS4;
@synthesize SORTDESCRIPTIONAH2;
@synthesize LARGEDESCRIPTIONAH2;
@synthesize SORTDESCRIPTIONAH3;
@synthesize LARGEDESCRIPTIONAH3;
@synthesize INTRODUCTION;
@synthesize SORTDESCRIPTION2;
@synthesize LARGEDESCRIPTION2;
@synthesize EGROSESVARIABLE;
@synthesize SORTDESCRIPTIONAH4;
@synthesize LARGEDESCRIPTION3;
@synthesize LARGEDESCRIPTION4;
@synthesize AHORROSVARIABLE;
@synthesize AHORROSVALUE;
@synthesize  COSTOSVARIABLE;
@synthesize COSTOSVALUE;
@synthesize ALCANCESYLIMIT;
@synthesize ALCANCESYLIMITCAPCACIDAD;
@synthesize ALCANCESYLIMITHORARIOS;
@synthesize ALCANCESYLIMITCOBERTURA;
@synthesize ALCANCESYLIMITCOMERCIAL;
@synthesize ALCANCESYLIMITPERSONAL;
@synthesize ALCANCESYLIMITDEMANDA;
@synthesize ALCANCESYLIMITDURACION;
@synthesize ALCANCESYLIMITSEGMEN;
@synthesize ALCANCESYLIMITTECHNOLOGIA;
@synthesize 	ALCANCESYLIMITOTRO1;
@synthesize ALCANCESYLIMITOTRO2;
@synthesize ALCANCESYLIMITOTRO3;
@synthesize CONTENGENCIADESLARGA;
@synthesize DEPENDENCIA1;
@synthesize DEPENDENCIA2;
@synthesize DEPENDENCIA3;
@synthesize DEPENDENCIA4;
@synthesize DEPENDENCIADESLARGA;
@synthesize RESULTADOSDESCLARGA;
@synthesize SUPUESTOS1;
@synthesize SUPUESTOS2;
@synthesize SUPUESTOS3;
@synthesize SUPUESTOS4;
@synthesize SUPUESTOSDESCLARGA;
@synthesize FUNTESINGRESOS;
@synthesize CONCLUSION;
@synthesize RECOMENDED;
@synthesize SUMMARY;
@synthesize RESULTADOS1;
@synthesize RESULTADOS2;
@synthesize RESULTADOS3;
@synthesize RESULTADOS4;

- (void) initAttributes{
    HEADING = @"heading";
    TITLE = @"title";
    TEMA = @"tema";
    OBJECTIVE = @"objective";
    SORTDESCRIPTION1 = @"sortDescription1";
    LARGEDESCRIPTION1 = @"large Description1";
    SORTDESCRIPTIONAH1 = @"sortDescriptionah1";
    LARGEDESCRIPTIONAH1 = @"large Descriptionah1";
    SORTDESCRIPTIONEGROS1 = @"sortDescriptionegr1";
    LARGEDESCRIPTIONEGROS1 = @"large Descriptionegr1";
    LARGEDESCRIPTIONEGROS2 = @"large Descriptionegr2";
    SORTDESCRIPTIONEGROS2 = @"sortDescriptionegr2";
    SORTDESCRIPTIONEGROS3 = @"sortDescriptionegr3";
    LARGEDESCRIPTIONEGROS3 = @"large Descriptionegr3";
    LARGEDESCRIPTIONEGROS4 = @"large Descriptionegr4";
    SORTDESCRIPTIONEGROS4 = @"sortDescriptionegr4";
    SORTDESCRIPTIONAH2 = @"sortDescription2ah";
    LARGEDESCRIPTIONAH2 = @"large Descriptionah2";
    SORTDESCRIPTIONAH3 = @"sortDescriptionah3";
    LARGEDESCRIPTIONAH3 = @"large Descriptionah3";
    INTRODUCTION = @"introduction";
    SORTDESCRIPTION2 = @"sortDescription2";
    LARGEDESCRIPTION2 = @"large Description2";
    EGROSESVARIABLE = @"sortegroses_variable";
    SORTDESCRIPTIONAH4 = @"sortDescriptionah4";
    LARGEDESCRIPTION3 = @"large Description3";
    LARGEDESCRIPTION4 = @"large Description4";
    AHORROSVARIABLE = @"ahross variable";
    AHORROSVALUE = @"ahross value";
    COSTOSVARIABLE = @"costos variable";
    COSTOSVALUE = @"costos value";
    ALCANCESYLIMIT = @"alceances";
    ALCANCESYLIMITCAPCACIDAD = @"alceances capacidad";
    ALCANCESYLIMITHORARIOS = @"alceances horarios";
    ALCANCESYLIMITCOBERTURA = @"alcanes cobertura";
    ALCANCESYLIMITCOMERCIAL = @"alcances comercial";
    ALCANCESYLIMITPERSONAL = @"alcances personal";
    ALCANCESYLIMITDEMANDA = @"alcances demanda";
    ALCANCESYLIMITDURACION = @"alcances duracion";
    ALCANCESYLIMITSEGMEN = @"alcances segment";
    ALCANCESYLIMITTECHNOLOGIA = @"alcances technnologia";
    ALCANCESYLIMITOTRO1 = @"alcances otro1";
    ALCANCESYLIMITOTRO2 = @"alcances otra2";
    ALCANCESYLIMITOTRO3 = @"alcances otra3";
    CONTENGENCIADESLARGA = @"contengecia_des_larga";
    DEPENDENCIA1 = @"dependencia1";
    DEPENDENCIA2 = @"dependencia2";
    DEPENDENCIA3 = @"dependencia3";
    DEPENDENCIA4 = @"dependencia4";
    DEPENDENCIADESLARGA = @"dependencia_des_larga";
    RESULTADOSDESCLARGA =  @"resultadoes_desc_larga";
    SUPUESTOS1 = @"supuestos1";
    SUPUESTOS2 = @"supuestos2";
    SUPUESTOS3 = @"supuestos3";
    SUPUESTOS4 = @"supuestos4";
    SUPUESTOSDESCLARGA = @"supuestos_desc_larga";
    FUNTESINGRESOS = @"funtes_ingresos";
    CONCLUSION = @"conclusion";
    RECOMENDED = @"recommended";
    SUMMARY = @"summary";
    RESULTADOS1 = @"resultados1";
    RESULTADOS2 = @"resultados2";
    RESULTADOS3 = @"resultados3";
    RESULTADOS4 = @"resultados4";
    
}

+(ConfigAtrributes *)getClass{
    ConfigAtrributes *obj = [[ConfigAtrributes alloc]init];
    return obj;
}
@end

