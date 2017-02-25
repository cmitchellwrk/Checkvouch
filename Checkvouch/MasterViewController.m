//
//  MasterViewController.m
//  Mole
//
//  Created by Chris Mitchell on 2/22/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import "ProfileTableViewController.h"

#import "MasterViewController.h"

#import "MainMessagesFTableViewController.h"



#import <Firebase/Firebase.h>






@interface MasterViewController ()



@end

@implementation MasterViewController



@synthesize teststring3;




- (IBAction)cancelJobTabs:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelJobTabs"]) {
        
        
        
    } }








- (IBAction)cancelTwo:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelInputTwo"]) {
        
        
        
            } }







- (IBAction)cancelThree:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelInputThree"]) {
        
        
        
    } }







- (IBAction)cancelMainMessages:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelMainMessages"]) {
        
        
        
        
        
        
    } }






- (IBAction)cancelTutorial:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelTutorial"]) {
        
        
        
        
        
        
    } }



- (IBAction)cancelFeedback:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelFeedback"]) {
        
        
        
        
        
        
    } }




- (IBAction)cancelFeedbackEnter:(UIStoryboardSegue *)segue {
    
    if ([[segue identifier] isEqualToString:@"cancelFeedbackEnter"]) {
        
        ContactUsViewController *editController = [segue sourceViewController];
        
       
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
        
        
        if (ref.authData) {
            
            // [self configureViewTwo];
            
            
            // user authenticated
         //   NSLog(@"%@", ref.authData);
            
            
            
            NSString *idd = ref.authData.uid;
            
            
            Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
            
            
            [[[ref  queryOrderedByKey] queryEqualToValue: idd]
             
             observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
                 
                 
               //  NSString *objid =   snapshot.value[@"userid"];
                 
                 NSString *usernme = snapshot.value[@"name"];
                 
                 
                 
                 Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com" ];
                 
                 
                 Firebase *postRef = [ref2 childByAppendingPath: @"feedback"];
                 
                 
                 Firebase *post1Ref = [postRef childByAutoId];
                 
                 NSString *postId = post1Ref.key;
                 
                 
                 NSDictionary *nickname = @{
                                            
                                            @"UserId": idd,
                                            
                                            @"Username": usernme,
                                            
                                            @"comments": editController.feedback.text,
                                            
                                            @"objectid": postId,
                                            
                                            
                                            
                                            };
                 
                 
                 
                 
                 [post1Ref setValue: nickname];
                 
                 
                 
             }];
            
            
            
        } else {
            
            
            
            [self performSegueWithIdentifier:@"CancelLogout" sender:self];
            
            
            // No user is signed in
            
            
        }
        
        
        
        
        
        
        
    } }





- (void)viewDidLoad {
    [super viewDidLoad];
    
    //add background
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"piVms8T.jpg"]];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    self.view.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view setTranslatesAutoresizingMaskIntoConstraints:YES];
    
   // Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
      
    
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    if ([[segue identifier] isEqualToString:@"ProfileSegue"]) {
        
       
        
        
        UINavigationController *navController = [segue destinationViewController];
        ProfileTableViewController *SITViewController = (ProfileTableViewController *)([navController viewControllers][0]);
       
        SITViewController.teststring2 = teststring3;
        
        
    } else if ( [[segue identifier] isEqualToString:@"CompanySegue"]   ){
        
        
      //  UINavigationController *navController = [segue destinationViewController];
      //  CoPTableViewController *SITViewController = (CoPTableViewController *)([navController viewControllers][0]);
       
        
        // SITViewController.teststring2 = teststring3;
        
        
        
    }  else if ( [[segue identifier] isEqualToString:@"SearchSegue"]   ){
        
        
       // UINavigationController *navController = [segue destinationViewController];
      //  SearchMasTableViewController *SITViewController = (SearchMasTableViewController *)([navController viewControllers][0]);
        
        
        
        
    }  else if ( [[segue identifier] isEqualToString:@"MainMessages"]   ){
        
        
       //  UINavigationController *navController = [segue destinationViewController];
      //    MainMessagesFTableViewController *SITViewController = (MainMessagesFTableViewController *)([navController viewControllers][0]);
        
      //  SITViewController.queryusername = self.teststring3;
        
        
      //  NSLog(@"%@", self.teststring3);
        
        
        
    }
    
    
    
    
    
    
    
}


@end
