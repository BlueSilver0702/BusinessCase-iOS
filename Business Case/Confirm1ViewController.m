//
//  Confirm1ViewController.m
//  Business Case
//
//  Created by User on 3/11/15.
//  Copyright (c) 2015 LeeShengGe. All rights reserved.
//

#import "Confirm1ViewController.h"
#import "MenuDocViewController.h"
#import "DocViewController.h"
#import "ConfigManager.h"
#import <AFNetworking/AFNetworking.h>
#import "AFNetworking/AFHTTPRequestOperationManager.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface Confirm1ViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation Confirm1ViewController
@synthesize backgroundView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ok_btn.layer.cornerRadius = 3;
    self.cancel_btn.layer.cornerRadius = 3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btn1_Clicked:(id)sender {

    if ([self.fileName isEqualToString:@""]) return;
    MenuDocViewController *menuView = (MenuDocViewController *)self.parentViewController;
    [menuView confirmViewHidden];
    [menuView loadingShow];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    ///////   exporting file....
    NSMutableArray *configData = [ConfigManager getConfigDatas];
    [configData addObject:[ConfigManager getFuntesIngresos]];
    NSArray *keyArray = [NSArray arrayWithObjects:@"m_Heading",
                         @"m_Title",
                         @"m_Tema",
                         @"m_Objective",
                         @"m_DescriptionShort1",
                         @"m_DescriptionLarge1",
                         @"m_DescriptionShortAhorros1",
                         @"m_DescriptionLargeAhorros1",
                         @"m_DescriptionShortEgresos1",
                         @"m_DescriptionLargeEgresos1",
                         @"m_DescriptionShortCostos",
                         @"m_DescriptionLargeCostos",
                         @"m_DescriptionShortInversion",
                         @"m_DescriptionLargeInversion",
                         @"m_DescriptionShortBeneficios",
                         @"m_DescriptionLargeBeneficios",
                         @"m_DescriptionShortImpactos",
                         @"m_DescriptionLargeImpactos",
                         @"m_DescriptionShortRiesgos",
                         @"m_DescriptionLargeRiesgos",
                         @"m_Introduction",
                         @"m_AlcancesYLimits",
                         @"m_AlcancesYLimitsCapcidad",
                         @"m_AlcancesYLimitsHorarios",
                         @"m_AlcancesYLimitsCobertura",
                         @"m_AlcancesYLimitsComercial",
                         @"m_AlcancesYLimitsPersonal",
                         @"m_AlcancesYLimitsDemanda",
                         @"m_AlcancesYLimitsDuracion",
                         @"m_AlcancesYLimitsSegmen",
                         @"m_AlcancesYLimitsTechnologia",
                         @"m_AlcancesYLimitsOtro1",
                         @"m_AlcancesYLimitsOtro2",
                         @"m_AlcancesYLimitsOtro3",
                         @"m_Dependencia1",
                         @"m_Dependencia2",
                         @"m_Dependencia3",
                         @"m_Dependencia4",
                         @"m_Resultados1",
                         @"m_Resultados2",
                         @"m_Resultados3",
                         @"m_Resultados4",
                         @"m_Supuestos1",
                         @"m_Supuestos2",
                         @"m_Supuestos3",
                         @"m_Conclusion",
                         @"m_Recommendies",
                         @"m_Summary",
                         @"m_ContingenciaDesLarga",
                         @"m_DependenciaDesLarga",
                         @"m_ResultadosDescLarga",
                         @"m_SupuestosDescLarga",
                         @"m_FuntesIngresos",
                         nil];
    
    NSString *var1 = [ConfigManager getVariable];
    NSString *val1 = [ConfigManager getValor];
    NSString *var2 = [ConfigManager getEgrossVariable];
    NSString *val2 = [ConfigManager getEgrossValor];
    NSString *var3 = [ConfigManager getInversionVariable];
    NSString *val3 = [ConfigManager getInversionValor];
    NSString *var4 = [ConfigManager getAhorrosVariable];
    NSString *val4 = [ConfigManager getAhorrosValor];
    NSString *var5 = [ConfigManager getCostosVariable];
    NSString *val5 = [ConfigManager getCostosValor];

    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithObjects:configData forKeys:keyArray];
    NSMutableDictionary *paramExcel = [[NSMutableDictionary alloc] init];
    [paramExcel setValue:var1 forKey:@"var1"];
    [paramExcel setValue:val1 forKey:@"val1"];
    [paramExcel setValue:var2 forKey:@"var2"];
    [paramExcel setValue:val2 forKey:@"val2"];
    [paramExcel setValue:var3 forKey:@"var3"];
    [paramExcel setValue:val3 forKey:@"val3"];
    [paramExcel setValue:var4 forKey:@"var4"];
    [paramExcel setValue:val4 forKey:@"val4"];
    [paramExcel setValue:var5 forKey:@"var5"];
    [paramExcel setValue:val5 forKey:@"val5"];
    [paramExcel setValue:[ConfigManager getDescriptionShortInversion] forKey:@"inversion"];
    [paramExcel setValue:[ConfigManager getDescriptionShortEgresos1] forKey:@"egresos"];
    [paramExcel setValue:[ConfigManager getDescriptionShortCostos] forKey:@"costos"];
    [paramExcel setValue:[ConfigManager getDescriptionShort1] forKey:@"ingresos"];
    [paramExcel setValue:[ConfigManager getDescriptionShortAhorros1] forKey:@"ahorros"];
    
    [parameters setValue:self.isDoc? @"word": @"excel" forKey:@"type"];
    [parameters setValue:self.fileName forKey:@"name"];
    
    [paramExcel setValue:self.isDoc? @"word": @"excel" forKey:@"type"];
    [paramExcel setValue:self.fileName forKey:@"name"];

    NSDictionary *paraData = (NSDictionary *) (self.isDoc? parameters: paramExcel);
    
    [manager GET:@"http://test.rxaprojects.com/index.php" parameters:paraData success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        ///////   start downloading....
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        NSString *resultPath = @"http://test.rxaprojects.com/results/";
        NSURL *URL = [NSURL URLWithString: [[resultPath stringByAppendingString:self.fileName] stringByAppendingString:self.isDoc? @".docx":@".xls"]];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        
        NSURL *originalFileURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        originalFileURL = [originalFileURL URLByAppendingPathComponent:[self.fileName stringByAppendingString:self.isDoc? @".docx":@".xls"]];
        
        [[NSFileManager defaultManager] removeItemAtURL:originalFileURL error:nil];
        
        NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
            NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
            return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
            [menuView loadingHide];
            NSLog(@"File downloaded to: %@", filePath);
            mailFile = [filePath absoluteString];
            DocViewController *docView = [self.storyboard instantiateViewControllerWithIdentifier:@"doc_dialog"];
            docView.downFilePath = [filePath absoluteString];
            docView.fileName = [self.fileName stringByAppendingString:self.isDoc? @".docx":@".xls"];
            [self.navigationController pushViewController:docView animated:YES];
        }];
        [downloadTask resume];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [menuView loadingHide];
        NSLog(@"Error: %@", error);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Couldn't create this file." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
//    MenuDocViewController *menuView = (MenuDocViewController *)self.parentViewController;
//    [menuView confirmViewHidden];
}

- (IBAction)btn2_Clicked:(id)sender {
//    NSString *fileName = [self.fileName stringByAppendingString:self.isDoc? @".docx":@".xls"];
    if ([self.fileName isEqualToString:@""]) return;
    MenuDocViewController *menuView = (MenuDocViewController *)self.parentViewController;
    [menuView confirmViewHidden];
    [menuView loadingShow];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    ///////   exporting file....
    NSMutableArray *configData = [ConfigManager getConfigDatas];
    [configData addObject:[ConfigManager getFuntesIngresos]];
    NSArray *keyArray = [NSArray arrayWithObjects:@"m_Heading",
                         @"m_Title",
                         @"m_Tema",
                         @"m_Objective",
                         @"m_DescriptionShort1",
                         @"m_DescriptionLarge1",
                         @"m_DescriptionShortAhorros1",
                         @"m_DescriptionLargeAhorros1",
                         @"m_DescriptionShortEgresos1",
                         @"m_DescriptionLargeEgresos1",
                         @"m_DescriptionShortCostos",
                         @"m_DescriptionLargeCostos",
                         @"m_DescriptionShortInversion",
                         @"m_DescriptionLargeInversion",
                         @"m_DescriptionShortBeneficios",
                         @"m_DescriptionLargeBeneficios",
                         @"m_DescriptionShortImpactos",
                         @"m_DescriptionLargeImpactos",
                         @"m_DescriptionShortRiesgos",
                         @"m_DescriptionLargeRiesgos",
                         @"m_Introduction",
                         @"m_AlcancesYLimits",
                         @"m_AlcancesYLimitsCapcidad",
                         @"m_AlcancesYLimitsHorarios",
                         @"m_AlcancesYLimitsCobertura",
                         @"m_AlcancesYLimitsComercial",
                         @"m_AlcancesYLimitsPersonal",
                         @"m_AlcancesYLimitsDemanda",
                         @"m_AlcancesYLimitsDuracion",
                         @"m_AlcancesYLimitsSegmen",
                         @"m_AlcancesYLimitsTechnologia",
                         @"m_AlcancesYLimitsOtro1",
                         @"m_AlcancesYLimitsOtro2",
                         @"m_AlcancesYLimitsOtro3",
                         @"m_Dependencia1",
                         @"m_Dependencia2",
                         @"m_Dependencia3",
                         @"m_Dependencia4",
                         @"m_Resultados1",
                         @"m_Resultados2",
                         @"m_Resultados3",
                         @"m_Resultados4",
                         @"m_Supuestos1",
                         @"m_Supuestos2",
                         @"m_Supuestos3",
                         @"m_Conclusion",
                         @"m_Recommendies",
                         @"m_Summary",
                         @"m_ContingenciaDesLarga",
                         @"m_DependenciaDesLarga",
                         @"m_ResultadosDescLarga",
                         @"m_SupuestosDescLarga",
                         @"m_FuntesIngresos",
                         nil];
    
    NSString *var1 = [ConfigManager getVariable];
    NSString *val1 = [ConfigManager getValor];
    NSString *var2 = [ConfigManager getEgrossVariable];
    NSString *val2 = [ConfigManager getEgrossValor];
    NSString *var3 = [ConfigManager getInversionVariable];
    NSString *val3 = [ConfigManager getInversionValor];
    NSString *var4 = [ConfigManager getAhorrosVariable];
    NSString *val4 = [ConfigManager getAhorrosValor];
    NSString *var5 = [ConfigManager getCostosVariable];
    NSString *val5 = [ConfigManager getCostosValor];
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithObjects:configData forKeys:keyArray];
    NSMutableDictionary *paramExcel = [[NSMutableDictionary alloc] init];
    [paramExcel setValue:var1 forKey:@"var1"];
    [paramExcel setValue:val1 forKey:@"val1"];
    [paramExcel setValue:var2 forKey:@"var2"];
    [paramExcel setValue:val2 forKey:@"val2"];
    [paramExcel setValue:var3 forKey:@"var3"];
    [paramExcel setValue:val3 forKey:@"val3"];
    [paramExcel setValue:var4 forKey:@"var4"];
    [paramExcel setValue:val4 forKey:@"val4"];
    [paramExcel setValue:var5 forKey:@"var5"];
    [paramExcel setValue:val5 forKey:@"val5"];
    [paramExcel setValue:[ConfigManager getDescriptionShortInversion] forKey:@"inversion"];
    [paramExcel setValue:[ConfigManager getDescriptionShortEgresos1] forKey:@"egresos"];
    [paramExcel setValue:[ConfigManager getDescriptionShortCostos] forKey:@"costos"];
    [paramExcel setValue:[ConfigManager getDescriptionShort1] forKey:@"ingresos"];
    [paramExcel setValue:[ConfigManager getDescriptionShortAhorros1] forKey:@"ahorros"];
    
    [parameters setValue:self.isDoc? @"word": @"excel" forKey:@"type"];
    [parameters setValue:self.fileName forKey:@"name"];
    
    [paramExcel setValue:self.isDoc? @"word": @"excel" forKey:@"type"];
    [paramExcel setValue:self.fileName forKey:@"name"];
    
    NSDictionary *paraData = (NSDictionary *) (self.isDoc? parameters: paramExcel);
    
    [manager GET:@"http://test.rxaprojects.com/index.php" parameters:paraData success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        ///////   start downloading....
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        NSString *resultPath = @"http://test.rxaprojects.com/results/";
        NSURL *URL = [NSURL URLWithString: [[resultPath stringByAppendingString:self.fileName] stringByAppendingString:self.isDoc? @".docx":@".xls"]];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        
        NSURL *originalFileURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        originalFileURL = [originalFileURL URLByAppendingPathComponent:[self.fileName stringByAppendingString:self.isDoc? @".docx":@".xls"]];
        
        [[NSFileManager defaultManager] removeItemAtURL:originalFileURL error:nil];
        
        NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
            NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
            return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
            [menuView loadingHide];
            NSLog(@"File downloaded to: %@", filePath);
            mailFile = [filePath absoluteString];
//            NSString *emailTitle = @"Great Photo and Doc";
//            NSString *messageBody = @"Hey, check this out!";
//            NSArray *toRecipents = [NSArray arrayWithObject:@"support@appcoda.com"];
            
            MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
            mailer.mailComposeDelegate = self;
            
            if ([MFMailComposeViewController canSendMail]) {
                NSData *mailData = [NSData dataWithContentsOfURL:filePath];
                NSString *mailString = [self.fileName stringByAppendingString:self.isDoc? @".docx":@".xls"];
                NSString *mailType = self.isDoc?@"text:x-generic":@"application/vnd.ms-excel";
                [mailer setSubject:@"BusinessCase Attachment File"];
//                [mailer setToRecipients:[NSArray arrayWithObjects:@"info@hotmail.com", nil]];
//                [mailer setMessageBody:@"Body" isHTML:NO];
                [mailer addAttachmentData: mailData
                                 mimeType:mailType
                                 fileName:mailString];
                
                [self presentModalViewController:mailer animated:YES];
            }
        }];
        [downloadTask resume];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [menuView loadingHide];
        NSLog(@"Error: %@", error);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Couldn't create this file." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void) newFileToDb : (NSString *)doc_Name{
    // if there is no DB.
//    if (![[NSFileManager defaultManager] fileExistsAtPath:[DBAdapter getDbFilePath]]) {
//        [DBAdapter createTable:[DBAdapter getDbFilePath]];
//    }
//    
//    [ConfigManager initConfigFile];
//    [ConfigManager setHeading:doc_Name];
//    
//    NSMutableArray *insertdata = [[NSMutableArray alloc]init];
//    
//    NSString *heading  = [ConfigManager getHeading];
//    
//    [insertdata addObject : [ConfigManager getHeading]];
//    for (int i=1; i<=54; i++) {
//        [insertdata addObject:@""];
//    }
    
    //Insert Doc data in table of DB.
//    [DBAdapter insertTableData:[DBAdapter getDbFilePath] :insertdata];
}

@end
