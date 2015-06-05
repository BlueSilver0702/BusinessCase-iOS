//
//  ConfigManager.h
//  Business Case
//
//  Created by LeeShengGe on 11/24/14.
//  Copyright (c) 2014 LeeShengGe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigManager : NSObject

+ (void) initConfigFile;
+(NSString *)dataFilePath;

+(NSMutableArray *)getConfigDatas;

+(void) setHeading:(NSString *)heading;
+(NSString *)getHeading;

+(void) setTitle:(NSString *)title;
+(NSString *)getTitle;

+(void) setTema:(NSString *)tema;
+(NSString *)getTema;

+(void) setObjective:(NSString *)objective;
+(NSString *)getObjective;

+(void)setDescriptionShort1:(NSString *)descShort1;
+(NSString *)getDescriptionShort1;

+(void)setDescriptionLarge1:(NSString *)descLarge1;
+(NSString *)getDescriptionLarge1;

+(void)setDescriptionShortAhorros1:(NSString *)descshort1;
+(NSString *)getDescriptionShortAhorros1;

+(void)setDescriptionLargeAhorros1:(NSString *)descLarge1;
+(NSString *)getDescriptionLargeAhorros1;

+(void)setDescriptionShortEgresos1:(NSString *)descShort1;
+(NSString *)getDescriptionShortEgresos1;

+(void)setDescriptionLargeEgresos1:(NSString *)descLarge1;
+(NSString *)getDescriptionLargeEgresos1;

+(void)setDescriptionShortCostos:(NSString *)strDescCorta;
+(NSString *)getDescriptionShortCostos;

+(void)setDescriptionLargeCostos:(NSString *)strDescLarga;
+(NSString *)getDescriptionLargeCostos;

+(void)setDescriptionShortInversion:(NSString *)strDescCorta;
+(NSString *)getDescriptionShortInversion;

+(void)setDescriptionLargeInversion:(NSString *)strDescCorta;
+(NSString *)getDescriptionLargeInversion;

+(void)setDescriptionShortBeneficios:(NSString *)descShortBen;
+(NSString *)getDescriptionShortBeneficios;

+(void)setDescriptionLargeBeneficios:(NSString *)descLargeBen;
+(NSString *)getDescriptionLargeBeneficios;

+(void)setDescriptionShortImpactos:(NSString *)descShortimp;
+(NSString *)getDescriptionShortImpactos;

+(void)setDescriptionLargeImpactos:(NSString *)descLargeimp;
+(NSString *)getDescriptionLargeImpactos;

+(void)setDescriptionShortRiesgos:(NSString *)descShortRig;
+(NSString *)getDescriptionShortRiesgos;

+(void)setDescriptionLargeRiesgos:(NSString *)descLargeRig;
+(NSString *)getDescriptionLargeRiesgos;

+(void)setIntroduction:(NSString *)intro;
+(NSString *)getIntroduction;

+(void)setVariable:(NSString *)variable;
+(NSString *)getVariable;

+(void)setValor:(NSString *)valor;
+(NSString *)getValor;

+(void)setEgrossVariable:(NSString *)egross;
+(NSString *)getEgrossVariable;

+(void)setEgrossValor:(NSString *)valor;
+(NSString *)getEgrossValor;

+(void)setInversionVariable:(NSString *)variable;
+(NSString *)getInversionVariable;

+(void) setInversionValor:(NSString *)valor;
+(NSString *)getInversionValor;

+(void) setAhorrosVariable:(NSString *)egross;
+(NSString *)getAhorrosVariable;

+(void) setAhorrosValor:(NSString *)valor;
+(NSString *)getAhorrosValor;

+(void) setCostosVariable:(NSString *)egross;
+(NSString *)getCostosVariable;

+(void) setCostosValor:(NSString *)valor;
+(NSString *)getCostosValor;

+(void) setAlcancesYLimits:(NSString *)alcances;
+(NSString *)getAlcancesYLimits	;	

+(void) setAlcancesYLimitsCapcidad:(NSString *)alcances;
+(NSString *)getAlcancesYLimitsCapcidad;

+(void) setAlcancesYLimitsHorarios:(NSString *)alcances;
+(NSString *)getAlcancesYLimitsHorarios;

+(void) setAlcancesYLimitsCobertura:(NSString *)cobertura;
+(NSString *)getAlcancesYLimitsCobertura;

+(void) setAlcancesYLimitsComercial:(NSString *)commercial;
+(NSString *)getAlcancesYLimitsComercial;

+(void) setAlcancesYLimitsPersonal:(NSString *)personal;
+(NSString *)getAlcancesYLimitsPersonal;

+(void) setAlcancesYLimitsDemanda:(NSString *)demanda;
+(NSString *)getAlcancesYLimitsDemanda;

+(void) setAlcancesYLimitsDuracion:(NSString *)duracion;
+(NSString *)getAlcancesYLimitsDuracion;

+(void) setAlcancesYLimitsSegmen:(NSString *)segmen;
+(NSString *)getAlcancesYLimitsSegmen;

+(void) setAlcancesYLimitsTechnologia:(NSString *)technologia;
+(NSString *)getAlcancesYLimitsTechnologia;

+(void) setAlcancesYLimitsOtro1:(NSString *)otro1;
+(NSString *)getAlcancesYLimitsOtro1;	

+(void) setAlcancesYLimitsOtro2:(NSString *)otro2;
+(NSString *)getAlcancesYLimitsOtro2;

+(void) setAlcancesYLimitsOtro3:(NSString *)otro3;
+(NSString *)getAlcancesYLimitsOtro3;

+(void) setContingenciaDesLarga:(NSString *)contengenciaDesLarga;
+(NSString *)getContingenciaDesLarga;

+(void) setDependencia1:(NSString *)dependencia1;
+(NSString *)getDependencia1;

+(void) setDependencia2:(NSString *)dependencia2;
+(NSString *)getDependencia2;

+(void) setDependencia3:(NSString *)dependencia3;
+(NSString *)getDependencia3 ;

+(void) setDependencia4:(NSString *)dependencia4;
+(NSString *)getDependencia4;

+(void) setDependenciaDesLarga:(NSString *)DependenciaDeslarga;
+(NSString *)getDependenciaDesLarga;

+(void) setResultadosDescLarga:(NSString *)resultadosDescLarga;
+(NSString *)getResultadosDescLarga;

+(void) setSupuestos1:(NSString *)setsupestos1;
+(NSString *)getSupuestos1;

+(void) setSupuestos2:(NSString *)setsupestos2;
+(NSString *)getSupuestos2;

+(void) setSupuestos3:(NSString *)setsupestos3;
+(NSString *)getSupuestos3;

+(void) setSupuestos4:(NSString *)setsupestos4;
+(NSString *)getSupuestos4;

+(void) setSupuestosDescLarga:(NSString *)supuestos;
+(NSString *)getSupuestosDescLarga;

+(void) setFuntesIngresos:(NSString *)ingresos;
+(NSString *)getFuntesIngresos;

+(void) setConclusion:(NSString *)conclusion;
+(NSString *)getConclusion;

+(void) setRecommendies:(NSString *)recommend;
+(NSString *)getRecommendies;

+(void) setSummary:(NSString *)summary;
+(NSString *)getSummary;

+(void) setResultados1:(NSString *)resultados1;
+(NSString *)getResultados1;

+(void) setResultados2:(NSString *)resultados2;
+(NSString *)getResultados2;

+(void) setResultados3:(NSString *)resultados3;
+(NSString *)getResultados3;

+(void) setResultados4:(NSString *)resultados4;
+(NSString *)getResultados4;

@end
