//
//  DataBase_Attributes.m
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import "DataBase_Attributes.h"

@implementation DataBase_Attributes
@synthesize TABLE_NAME_BUSINESSCASE;
@synthesize DB_NAME;
@synthesize FILE_NAME;
@synthesize INGRESOSDESCSHORT;
@synthesize AHORROSDESCSHORT;
@synthesize EGRESOSDESCSHORT;
@synthesize COSTOSDESCSHORT;
@synthesize INVERSIONDESCSHORT;
@synthesize BENFICIOSDESCSHORT;
@synthesize IMPACTOSNEGATIVEDESCSHORT;
@synthesize RIESGOSDESCSHORT;
@synthesize INGRESOSDESCLONG;
@synthesize AHORROSDESCLONG;
@synthesize EGRESOSDESCLONG;
@synthesize COSTOSDESCLONG;
@synthesize INVERSIONDESCLONG;
@synthesize BENFICIOSDESCLONG;
@synthesize IMPACTOSNEGATIVEDESCLONG;
@synthesize RIESGOSDESCLONG;

@synthesize INTRODUCTION;
@synthesize TITULO;
@synthesize TEMA;
@synthesize OBJECTIVE;
@synthesize TIEMPO;
@synthesize CAPACIDAD;
@synthesize HORARAIOS;
@synthesize COBERTURA;
@synthesize COMERCIAL;
@synthesize PERSONAL;
@synthesize DEMANDA;
@synthesize DURACION;
@synthesize SEGMENTACION;
@synthesize TECHNOLOGIA;
@synthesize OTRO1;
@synthesize OTRO2;
@synthesize OTRO3;

@synthesize DEPENDENDCIA1;
@synthesize DEPENDENDCIA2;
@synthesize DEPENDENDCIA3;
@synthesize DEPENDENDCIA4;
@synthesize RESULTADOS1;
@synthesize RESULTADOS2;
@synthesize RESULTADOS3;
@synthesize RESULTADOS4;

@synthesize DEPENDENCIADESLARGA;
@synthesize CONTENGENCIADESLARGA;
@synthesize RESULTADOSDESCLARGA;
@synthesize SUPESTOS1;
@synthesize SUPESTOS2;
@synthesize SUPESTOS3;
@synthesize SUPESTOS3DESCLARGA;

@synthesize CONCLUSION;
@synthesize RECOMMENDED;
@synthesize SUMARIOEJECUTIO;

@synthesize CHECKEDELEMENT;

@synthesize CREATE_BUSINESSCASE_QUERY;

- (void) initAttributes{
    TABLE_NAME_BUSINESSCASE = @"businesscase";
    DB_NAME = @"db_businesscases";
    FILE_NAME = @"file_name";
    INGRESOSDESCSHORT = @"ingross_desc_sort";
    AHORROSDESCSHORT = @"ahorros_desc_sort";
    EGRESOSDESCSHORT = @"egresos_desc_sort";
    COSTOSDESCSHORT = @"costos_desc_sort";
    INVERSIONDESCSHORT = @"invesion_desc_sort";
    BENFICIOSDESCSHORT = @"beneficios_desc_sort";
    IMPACTOSNEGATIVEDESCSHORT = @"impactos_negative_desc_sort";
    RIESGOSDESCSHORT = @"riesgos_desc_sort";
    INGRESOSDESCLONG = @"ingross_desc_long";
    AHORROSDESCLONG =@"ahorros_desc_long";
    EGRESOSDESCLONG = @"egresos_desc_long";
    COSTOSDESCLONG = @"costos_desc_long";
    INVERSIONDESCLONG = @"invesion_desc_long";
    BENFICIOSDESCLONG = @"beneficios_desc_long";
    IMPACTOSNEGATIVEDESCLONG = @"impactos_negative_desc_long";
    RIESGOSDESCLONG = @"riesgos_desc_long";
    
    
    INTRODUCTION = @"introduction";
    TITULO = @"titulo";
    TEMA = @"tema";
    OBJECTIVE = @"objective";
    TIEMPO = @"tiempo";
    CAPACIDAD = @"Capacidad_instalada";
    HORARAIOS = @"Horarios_de_operacion";
    COBERTURA = @"Cobertura_geografic";
    COMERCIAL = @"Comercializacion";
    PERSONAL = @"Personal";
    DEMANDA = @"Demanda_de_servicio";
    DURACION = @"Duracion";
    SEGMENTACION = @"Segmentacion";
    TECHNOLOGIA = @"Technologia";
    OTRO1 = @"Otro1";
    OTRO2 = @"Otro2";
    OTRO3 = @"Otro3";
    
    DEPENDENDCIA1 = @"dependencia1";
    DEPENDENDCIA2 = @"dependencia2";
    DEPENDENDCIA3 = @"dependencia3";
    DEPENDENDCIA4 = @"dependencia4";
    RESULTADOS1 = @"resultados1";
    RESULTADOS2 = @"resultados2";
    RESULTADOS3 = @"resultados3";
    RESULTADOS4 = @"resultados4";
    
    DEPENDENCIADESLARGA = @"dependencia_des_larga";
    CONTENGENCIADESLARGA = @"contengecia_des_larga";
    RESULTADOSDESCLARGA = @"resultadoes_desc_larga";
    
    SUPESTOS1 = @"supestos1";
    SUPESTOS2 = @"supestos2";
    SUPESTOS3 = @"supestos3";
    SUPESTOS3DESCLARGA = @"supestos_desc_larga";
    
    CONCLUSION = @"conclusion";
    RECOMMENDED = @"recommend";
    SUMARIOEJECUTIO = @"sumarioejecutio";
    
    CHECKEDELEMENT = @"checked_element";
    
    CREATE_BUSINESSCASE_QUERY = "create table businesscase (_id integer primary key autoincrement, file_name text not null, titulo text, tema text, objective text, ingross_desc_sort text, ingross_desc_long text, ahorros_desc_sort text, ahorros_desc_long text, egresos_desc_sort text, egresos_desc_long text, costos_desc_sort text, costos_desc_long text, invesion_desc_sort text, invesion_desc_long text, beneficios_desc_sort text, beneficios_desc_long text, impactos_negative_desc_sort text, impactos_negative_desc_long text, riesgos_desc_sort text, riesgos_desc_long text, introduction text, tiempo text, Capacidad_instalada text, Horarios_de_operacion text, Cobertura_geografic text, Comercializacion text, Personal text, Demanda_de_servicio text, Duracion text, Segmentacion text, Technologia text, Otro1 text, Otro2 text, Otro3 text, dependencia1 text, dependencia2 text, dependencia3 text, dependencia4 text, resultados1 text, resultados2 text, resultados3 text, resultados4 text,supestos1 text, supestos2 text, supestos3 text, conclusion text, recommend text, sumarioejecutio text, contengecia_des_larga text, dependencia_des_larga text, resultadoes_desc_larga text, supestos_desc_larga text, checked_element text);";
    
    
//    NSMutableArray *attributes = [[NSMutableArray alloc]init];
//    [attributes addObject: @"file_name"];
//    [attributes addObject: @"titulo"];
//    [attributes addObject: @"tema"];
//    [attributes addObject:@"objective"];
//    [attributes addObject: @"ingross_desc_sort"];
//    [attributes addObject: @"ingross_desc_long"];
//    [attributes addObject: @"ahorros_desc_sort"];
//    [attributes addObject: @"ahorros_desc_long"];
//    [attributes addObject: @"egresos_desc_sort"];
//    [attributes addObject: @"egresos_desc_long"];
//    [attributes addObject: @"costos_desc_sort"];
//    [attributes addObject: @"costos_desc_long"];
//    [attributes addObject: @"invesion_desc_sort"];
//    [attributes addObject: @"invesion_desc_long"];
//    [attributes addObject: @"beneficios_desc_sort"];
//    [attributes addObject: @"beneficios_desc_long"];
//    [attributes addObject: @"impactos_negative_desc_sort"];
//    [attributes addObject: @"impactos_negative_desc_long"];
//    [attributes addObject: @"riesgos_desc_sort"];
//    [attributes addObject: @"riesgos_desc_long"];
//    [attributes addObject: @"introduction"];
//    [attributes addObject: @"tiempo"];
//    [attributes addObject: @"Capacidad_instalada"];
//    [attributes addObject: @"Horarios_de_operacion"];
//    [attributes addObject: @"Cobertura_geografic"];
//    [attributes addObject: @"Comercializacion"];
//    [attributes addObject: @"Personal"];
//    [attributes addObject: @"Demanda_de_servicio"];
//    [attributes addObject: @"Duracion"];
//    [attributes addObject: @"Segmentacion"];
//    [attributes addObject: @"Technologia"];
//    [attributes addObject: @"Otro1"];
//    [attributes addObject: @"Otro2"];
//    [attributes addObject: @"Otro3"];
//    [attributes addObject: @"dependencia1"];
//    [attributes addObject: @"dependencia2"];
//    [attributes addObject: @"dependencia3"];
//    [attributes addObject: @"dependencia4"];
//    [attributes addObject: @"resultados1"];
//    [attributes addObject: @"resultados2"];
//    [attributes addObject: @"resultados3"];
//    [attributes addObject: @"resultados4"];
//    [attributes addObject: @"supestos1"];
//    [attributes addObject: @"supestos2"];
//    [attributes addObject: @"supestos3"];
//    [attributes addObject: @"conclusion"];
//    [attributes addObject: @"recommend"];
//    [attributes addObject: @"sumarioejecutio"];
//    [attributes addObject: @"contengecia_des_larga"];
//    [attributes addObject: @"dependencia_des_larga"];
//    [attributes addObject: @"resultadoes_desc_larga"];
//    [attributes addObject: @"supestos_desc_larga"];
//    [attributes addObject: @"checked_element"];
    
}

+(NSMutableArray *)getTableColumnNames{
    NSMutableArray *attributes = [[NSMutableArray alloc]init];
    [attributes addObject: @"file_name"];
    [attributes addObject: @"titulo"];
    [attributes addObject: @"tema"];
    [attributes addObject:@"objective"];
    [attributes addObject: @"ingross_desc_sort"];
    [attributes addObject: @"ingross_desc_long"];
    [attributes addObject: @"ahorros_desc_sort"];
    [attributes addObject: @"ahorros_desc_long"];
    [attributes addObject: @"egresos_desc_sort"];
    [attributes addObject: @"egresos_desc_long"];
    [attributes addObject: @"costos_desc_sort"];
    [attributes addObject: @"costos_desc_long"];
    [attributes addObject: @"invesion_desc_sort"];
    [attributes addObject: @"invesion_desc_long"];
    [attributes addObject: @"beneficios_desc_sort"];
    [attributes addObject: @"beneficios_desc_long"];
    [attributes addObject: @"impactos_negative_desc_sort"];
    [attributes addObject: @"impactos_negative_desc_long"];
    [attributes addObject: @"riesgos_desc_sort"];
    [attributes addObject: @"riesgos_desc_long"];
    [attributes addObject: @"introduction"];
    [attributes addObject: @"tiempo"];
    [attributes addObject: @"Capacidad_instalada"];
    [attributes addObject: @"Horarios_de_operacion"];
    [attributes addObject: @"Cobertura_geografic"];
    [attributes addObject: @"Comercializacion"];
    [attributes addObject: @"Personal"];
    [attributes addObject: @"Demanda_de_servicio"];
    [attributes addObject: @"Duracion"];
    [attributes addObject: @"Segmentacion"];
    [attributes addObject: @"Technologia"];
    [attributes addObject: @"Otro1"];
    [attributes addObject: @"Otro2"];
    [attributes addObject: @"Otro3"];
    [attributes addObject: @"dependencia1"];
    [attributes addObject: @"dependencia2"];
    [attributes addObject: @"dependencia3"];
    [attributes addObject: @"dependencia4"];
    [attributes addObject: @"resultados1"];
    [attributes addObject: @"resultados2"];
    [attributes addObject: @"resultados3"];
    [attributes addObject: @"resultados4"];
    [attributes addObject: @"supestos1"];
    [attributes addObject: @"supestos2"];
    [attributes addObject: @"supestos3"];
    [attributes addObject: @"conclusion"];
    [attributes addObject: @"recommend"];
    [attributes addObject: @"sumarioejecutio"];
    [attributes addObject: @"contengecia_des_larga"];
    [attributes addObject: @"dependencia_des_larga"];
    [attributes addObject: @"resultadoes_desc_larga"];
    [attributes addObject: @"supestos_desc_larga"];
//    [attributes addObject: @"checked_element"];
    return attributes;
}

@end
