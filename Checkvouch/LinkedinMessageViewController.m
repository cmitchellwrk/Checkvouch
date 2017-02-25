//
//  LinkedinMessageViewController.m
//  Checka
//
//  Created by Chris Mitchell on 1/23/16.
//  Copyright (c) 2016 Chris Mitchell. All rights reserved.
//

#import "LinkedinMessageViewController.h"


#import "LinkedinViewController.h"

#import "AppDelegate.h"

#import <Firebase/Firebase.h>



@interface LinkedinMessageViewController ()



@property (nonatomic,assign) BOOL working;

@property (nonatomic,weak) IBOutlet UITextView *bodyTextField;




@end

@implementation LinkedinMessageViewController





@synthesize linked_idval;






- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [[self navigationController].navigationBar setTintColor:[UIColor colorWithRed:(245.0/255.0) green:(30.0/255.0) blue:(119.0/255.0) alpha:1.0]];
    
    //add background
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    self.view.contentMode = UIViewContentModeScaleAspectFit;
    
    self.view.backgroundColor = [UIColor clearColor];
    
    
    
    [[self navigationController].navigationBar setBarTintColor:[UIColor colorWithRed:(1.0/255.0) green:(12.0/255.0) blue:(22.0/255.0) alpha:1.0]];
    
    self.navigationController.navigationBar.translucent = YES;
    
    self.working = true;
    
    _bodyTextField.text = @"";
    
    
}





- (IBAction) sync:(id)sender {
    
    
    
    
    
    [LISDKSessionManager createSessionWithAuth:[NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION, LISDK_EMAILADDRESS_PERMISSION, nil]
                                         state:@"some state"
                        showGoToAppStoreDialog:YES
     
                                  successBlock:^(NSString *returnState) {
                                      
                                      
                                      
                                      LISDKSession *session = [[LISDKSessionManager sharedInstance] session];
                                      
                                      
                                      
                                      NSMutableString *text = [[NSMutableString alloc] initWithString:[session.accessToken description]];
                                      [text appendString:[NSString stringWithFormat:@"state=\"%@\"",returnState]];
                                      
                                      
                                      
                                      
                                      
                                      
                                        
                                      
                                      NSString *trythis = @"https://www.linkedin.com/v1/people/~:(id)?format=json";
                                      
                                      
                                      
                                      
                                      [[LISDKAPIHelper sharedInstance] getRequest:trythis
                                       
                                       
                                                                          success:^(LISDKAPIResponse *response) {
                                                                              
                                                                              
                                                                              NSData *objectData = [ response.data dataUsingEncoding:NSUTF8StringEncoding];
                                                                              
                                                                              
                                                                              
                                                                              
                                                                              
                                                                              NSError *jsonError;
                                                                              
                                                                              NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                                                                                                   options:NSJSONReadingMutableContainers
                                                                                                                                     error:&jsonError];
                                                                              
                                                                              NSString *val = [json objectForKey: @"id"];
                                                                              
                                                                              
                                                                              
                                                                              
                                                                              Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
                                                                              
                                                                              
                                                                              
                                                                              
                                                                              
                                                                              
                                                                              NSString *idd = ref.authData.uid;
                                                                              
                                                                              
                                                                              Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
                                                                              
                                                                              
                                                                              [[[ref2  queryOrderedByKey] queryEqualToValue: idd]
                                                                               
                                                                               observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
                                                                                   
                                                                                   
                                                                                   NSString *usrname   = snapshot.value[@"name"];
                                                                                   
                                                                                   NSString *usremail = snapshot.value[@"email"];
                                                                                   
                                                                                   NSString *linkedin = snapshot.value[@"linkedin"];
                                                                                   
                                                                                   NSString *password =  snapshot.value[@"password"];
                                                                                   
                                                                                   NSString *usrphonenum =  snapshot.value[@"phonenumber"];
                                                                                   
                                                                                   NSString *job =  snapshot.value[@"job"];
                                                                                   
                                                                                   
                                                                                   
                                                                                   
                                                                                   Firebase *hopperRef = [ref2 childByAppendingPath: idd];
                                                                                   
                                                                                   NSDictionary *nickname = @{
                                                                                                              @"linkedin_id": val,
                                                                                                              @"password":password,
                                                                                                              @"name": usrname,
                                                                                                              @"email":usremail,
                                                                                                              @"job": job,
                                                                                                              @"linkedin":linkedin,
                                                                                                              @"phonenumber":usrphonenum,
                                                                                                              
                                                                                                              };
                                                                                   
                                                                                   [hopperRef updateChildValues: nickname];
                                                                                   
                                                                         
                                                                                   
                                                                                   
                                                                                   
                                                                                   
                                                                                   
                                                                                   
                                                                                   
                                                                               }];
                                                                              
                                                                              
                                                                              
                                                                              
                                                                              
                                                                              
                                                                              
                                                                          }
                                       
                                                                            error:^(LISDKAPIError *apiError) {
                                                                                
                                                                                self.working = false;
                                                                                
                                                                          
                                                                                
                                                                            }];
                                      
                                      
                                      
                                      [self performSegueWithIdentifier:@"stopLinkedinMessage" sender:self];
                                      
                                      
                                      
                                                                            
                                      //
                                      
                                      
                                  
     
            
                                      
                                      
                                      //
                                      
                                      
                                  }
                                    errorBlock:^(NSError *error) {
                                        
                                        self.working = false;
                                        
                                        
                                        
                                        
                                    }
     
     
     
     
     ];
    
    
    
    
    
    
    
}





- (IBAction) syncTwo:(id)sender {
    
    
    [LISDKSessionManager createSessionWithAuth:[NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION, LISDK_EMAILADDRESS_PERMISSION, nil]
                                         state:@"some state"
                        showGoToAppStoreDialog:YES
     
                                  successBlock:^(NSString *returnState) {
                                      
                                      
                                      
                                      LISDKSession *session = [[LISDKSessionManager sharedInstance] session];
                                      
                                  
                                      
                                      
                                      NSMutableString *text = [[NSMutableString alloc] initWithString:[session.accessToken description]];
                                      [text appendString:[NSString stringWithFormat:@"state=\"%@\"",returnState]];
                                      
                                      
                                      
                                      
                                      
                                      [self performSegueWithIdentifier:@"linkedinSecond" sender:self];
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      //
                                      
                                      
                                  }
                                    errorBlock:^(NSError *error) {
                                        
                                        self.working = false;
                                        
                                        
                                        
                                    }
     
     
     
     
     ];
    
    
    
    
    
    
    
    
}








-(IBAction)Testlisdk{
    
    
    
    
    NSString *trythis = @"https://www.linkedin.com/v1/people/~:(id)?format=json";
    
    
    
    
    NSString *method = @"GET";
    
    [[LISDKAPIHelper sharedInstance] apiRequest:trythis
                                         method:method
                                           body:[_bodyTextField.text dataUsingEncoding:NSUTF8StringEncoding]
     
                                        success:^(LISDKAPIResponse *response) {
                                            
                                            
                                            NSData *objectData = [ response.data dataUsingEncoding:NSUTF8StringEncoding];
                                            
                                            
                                            
                                            
                                            
                                            NSError *jsonError;
                                            
                                            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                                                                 options:NSJSONReadingMutableContainers
                                                                                                   error:&jsonError];
                                            
                                            NSString *val = [json objectForKey: @"id"];
                                            
                                            
                                            Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
                                            
                                            
                                            if (ref.authData) {
                                                
                                                
                                                
                                                NSString *idd = ref.authData.uid;
                                                
                                                
                                                Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
                                                
                                                
                                                [[[ref2  queryOrderedByKey] queryEqualToValue: idd]
                                                 
                                                 observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
                                                     
                                                     
                                                     NSString *usrname   = snapshot.value[@"name"];
                                                     
                                                     NSString *usremail = snapshot.value[@"email"];
                                                     
                                                     NSString *linkedin = snapshot.value[@"linkedin"];
                                                     
                                                     NSString *password =  snapshot.value[@"password"];
                                                     
                                                     NSString *usrphonenum =  snapshot.value[@"phonenumber"];
                                                     
                                                     NSString *job =  snapshot.value[@"job"];
                                                     
                                                     
                                                     
                                                     
                                                     Firebase *hopperRef = [ref2 childByAppendingPath: idd];
                                                     
                                                     NSDictionary *nickname = @{
                                                                                @"linkedin_id":val,
                                                                                @"password":password,
                                                                                @"name":usrname,
                                                                                @"email":usremail,
                                                                                @"job":job,
                                                                                @"linkedin":linkedin,
                                                                                @"phonenumber":usrphonenum,
                                                                                
                                                                                };
                                                     
                                                     [hopperRef updateChildValues: nickname];
                                                     
                                                    
                                                     
                                                     [self performSegueWithIdentifier:@"stopLinkedinMessage" sender:self];
                                                     
                                                     
                                                     
                                                     
                                                     
                                                     
                                                     
                                                     
                                                 }];
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                            }
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                        }
     
                                          error:^(LISDKAPIError *apiError) {
                                              
                                              
                                              
                                              
                                              
                                          }];
    
    
    
    
    
    
    
}








- (IBAction)execute  {
    
    NSString *trythis = @"https://www.linkedin.com/v1/people/~:(id)?format=json";
    
    
    
    
    NSString *method = @"GET";
    
    [[LISDKAPIHelper sharedInstance] apiRequest:trythis
                                         method:method
                                           body:[_bodyTextField.text dataUsingEncoding:NSUTF8StringEncoding]
     
                                        success:^(LISDKAPIResponse *response) {
                                            
                                            
                                            NSData *objectData = [ response.data dataUsingEncoding:NSUTF8StringEncoding];
                                            
                                            
                                            
                                            
                                            
                                            NSError *jsonError;
                                            
                                            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                                                                 options:NSJSONReadingMutableContainers
                                                                                                   error:&jsonError];
                                            
                                            
                                           
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                        }
     
                                          error:^(LISDKAPIError *apiError) {
                                              
                                              
                                              
                                              
                                              
                                          }];
    
    
    
    
    
}


- (IBAction)executeTwo  {
    
   
    
    
    NSString *trythis = @"https://www.linkedin.com/v1/people/~:(id)?format=json";
    
    
    
    
    NSString *method = @"GET";
    
    [[LISDKAPIHelper sharedInstance] apiRequest:trythis
                                         method:method
                                           body:[_bodyTextField.text dataUsingEncoding:NSUTF8StringEncoding]
     
                                        success:^(LISDKAPIResponse *response) {
                                            
                                            
                                            NSData *objectData = [ response.data dataUsingEncoding:NSUTF8StringEncoding];
                                            
                                            
                                            
                                            
                                            
                                            NSError *jsonError;
                                            
                                            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                                                                 options:NSJSONReadingMutableContainers
                                                                                                   error:&jsonError];
                                            
                                            NSString *val = [json objectForKey: @"id"];
                                            
                                            
                                            
                                            Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
                                            
                                            
                                            if (ref.authData) {
                                                
                                                
                                                
                                                NSString *idd = ref.authData.uid;
                                                
                                                
                                                Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
                                                
                                                
                                                [[[ref2  queryOrderedByKey] queryEqualToValue: idd]
                                                 
                                                 observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
                                                     
                                                     
                                                     NSString *usrname   = snapshot.value[@"name"];
                                                     
                                                     NSString *usremail = snapshot.value[@"email"];
                                                     
                                                     NSString *linkedin = snapshot.value[@"linkedin"];
                                                     
                                                     NSString *password =  snapshot.value[@"password"];
                                                     
                                                     NSString *usrphonenum =  snapshot.value[@"phonenumber"];
                                                     
                                                     NSString *job =  snapshot.value[@"job"];
                                                     
                                                     
                                                     
                                                     
                                                     Firebase *hopperRef = [ref2 childByAppendingPath: idd];
                                                     
                                                     NSDictionary *nickname = @{
                                                                                @"linkedin_id":val,
                                                                                @"password":password,
                                                                                @"name":usrname,
                                                                                @"email":usremail,
                                                                                @"job":job,
                                                                                @"linkedin":linkedin,
                                                                                @"phonenumber":usrphonenum,
                                                                                
                                                                                };
                                                     
                                                     [hopperRef updateChildValues: nickname];
                                                     
                                                    
                                                     
                                                     [self performSegueWithIdentifier:@"stopLinkedinMessage" sender:self];
                                                     
                                                     
                                                     
                                                     
                                                     
                                                     
                                                     
                                                     
                                                 }];
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                            }
                                            
                                            
                                            
                                            
                                
                                            
                                            
                                            
                                            
                                        }
     
                                          error:^(LISDKAPIError *apiError) {
                                              
                                              
                                              
                                              
                                              
                                          }];
    
    
    
    
    
    
    
    
    
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender

{
    
    if ([ identifier isEqualToString:@"cancelLinkedin"]) {
        
        if(self.working == FALSE){
            
            return FALSE;
            
        }
        
        
        
    }
    
    return TRUE;
    
    
    
    
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
