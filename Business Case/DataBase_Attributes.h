//
//  DataBase_Attributes.h
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBase_Attributes : NSObject

@property (weak, nonatomic)NSString *TABLE_NAME_BUSINESSCASE;
@property (weak, nonatomic)NSString *DB_NAME;
@property (weak, nonatomic)NSString *FILE_NAME;
@property (weak, nonatomic)NSString *INGRESOSDESCSHORT;
@property (weak, nonatomic)NSString *AHORROSDESCSHORT;
@property (weak, nonatomic)NSString *EGRESOSDESCSHORT;
@property (weak, nonatomic)NSString *COSTOSDESCSHORT;
@property (weak, nonatomic)NSString *INVERSIONDESCSHORT;
@property (weak, nonatomic)NSString *BENFICIOSDESCSHORT;
@property (weak, nonatomic)NSString *IMPACTOSNEGATIVEDESCSHORT;
@property (weak, nonatomic)NSString *RIESGOSDESCSHORT;
@property (weak, nonatomic)NSString *INGRESOSDESCLONG;
@property (weak, nonatomic)NSString *AHORROSDESCLONG;
@property (weak, nonatomic)NSString *EGRESOSDESCLONG;
@property (weak, nonatomic)NSString *COSTOSDESCLONG;
@property (weak, nonatomic)NSString *INVERSIONDESCLONG;
@property (weak, nonatomic)NSString *BENFICIOSDESCLONG;
@property (weak, nonatomic)NSString *IMPACTOSNEGATIVEDESCLONG;
@property (weak, nonatomic)NSString *RIESGOSDESCLONG;

@property (weak, nonatomic)NSString *INTRODUCTION;
@property (weak, nonatomic)NSString *TITULO;
@property (weak, nonatomic)NSString *TEMA;
@property (weak, nonatomic)NSString *OBJECTIVE;
@property (weak, nonatomic)NSString *TIEMPO;
@property (weak, nonatomic)NSString *CAPACIDAD;
@property (weak, nonatomic)NSString *HORARAIOS;
@property (weak, nonatomic)NSString *COBERTURA;
@property (weak, nonatomic)NSString *COMERCIAL;
@property (weak, nonatomic)NSString *PERSONAL;
@property (weak, nonatomic)NSString *DEMANDA;
@property (weak, nonatomic)NSString *DURACION;
@property (weak, nonatomic)NSString *SEGMENTACION;
@property (weak, nonatomic)NSString *TECHNOLOGIA;
@property (weak, nonatomic)NSString *OTRO1;
@property (weak, nonatomic)NSString *OTRO2;
@property (weak, nonatomic)NSString *OTRO3;

@property (weak, nonatomic)NSString *DEPENDENDCIA1;
@property (weak, nonatomic)NSString *DEPENDENDCIA2;
@property (weak, nonatomic)NSString *DEPENDENDCIA3;
@property (weak, nonatomic)NSString *DEPENDENDCIA4;
@property (weak, nonatomic)NSString *RESULTADOS1;
@property (weak, nonatomic)NSString *RESULTADOS2;
@property (weak, nonatomic)NSString *RESULTADOS3;
@property (weak, nonatomic)NSString *RESULTADOS4;

@property (weak, nonatomic)NSString *DEPENDENCIADESLARGA;
@property (weak, nonatomic)NSString *CONTENGENCIADESLARGA;
@property (weak, nonatomic)NSString *RESULTADOSDESCLARGA;

@property (weak, nonatomic)NSString *SUPESTOS1;
@property (weak, nonatomic)NSString *SUPESTOS2;
@property (weak, nonatomic)NSString *SUPESTOS3;
@property (weak, nonatomic)NSString *SUPESTOS3DESCLARGA;

@property (weak, nonatomic)NSString *CONCLUSION;
@property (weak, nonatomic)NSString *RECOMMENDED;
@property (weak, nonatomic)NSString *SUMARIOEJECUTIO;

@property (weak, nonatomic)NSString *CHECKEDELEMENT;

@property char *CREATE_BUSINESSCASE_QUERY;

+(NSMutableArray *)getTableColumnNames;

@end

