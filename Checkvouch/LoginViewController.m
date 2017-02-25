//
//  LoginViewController.m
//  Mole
//
//  Created by Chris Mitchell on 2/1/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import "LoginViewController.h"



#import "ProfileTableViewController.h"

#import "MasterViewController.h"



@interface LoginViewController ()




@end

@implementation LoginViewController




@synthesize userNameTextField, passwordTextField;

@synthesize currentuserVariable;


bool isKeyboardVisible = FALSE;







- (void) keyboardAppeared{
    if (isKeyboardVisible == FALSE) {
        isKeyboardVisible = true;
        
        
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //add background
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"piVms8T.jpg"]];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    self.view.contentMode = UIViewContentModeScaleAspectFit;
    
   
    
    
    
    
    self.loginUsername.backgroundColor = [UIColor clearColor];
    
    
    self.loginUsername.layer.cornerRadius=8.0f;
    self.loginUsername.layer.masksToBounds=YES;
    self.loginUsername.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.loginUsername.layer.borderWidth= 1.0f;
    
    self.loginPassword.backgroundColor = [UIColor clearColor];
    
    
    self.loginPassword.layer.cornerRadius=8.0f;
    self.loginPassword.layer.masksToBounds=YES;
    self.loginPassword.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.loginPassword.layer.borderWidth= 1.0f;
    
    
    
    
   }


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}









- (IBAction)cancel:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelInput"]) {
        
        
    } }








- (IBAction)cancelProfile: (UIStoryboardSegue *)segue  {
    
    
    if ([[segue identifier] isEqualToString:@"cancelProfile"]) {
        
       
        
      
        
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
        
        
        if (ref.authData) {
            
            
            
            NSString *idd = ref.authData.uid;
            
            
            Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
            
            
            
            
            [[[ref2  queryOrderedByKey] queryEqualToValue:@"workplaces"]
             
             observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
                 
                 
                 
                 
                 
                 
                 
                 for (FDataSnapshot* childSnap in snapshot.children) {
                     
                     
                     
                     if (   [ childSnap.value[@"userid"] isEqualToString: idd]   ){
                         
                         
                         
                         NSString *objectidd=   childSnap.value[@"workplaceid"];
                         
                         
                         Firebase *ref5 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users/workplaces" ];
                         
                         
                         Firebase *usersRef = [ref5 childByAppendingPath: objectidd];
                         
                    
                         
                         [usersRef setValue:   NULL];
                         
                         
                         
                     }
                     
                
                     
                 }
                 
                 
                 
             }];
            
            
            
            
            
            
                 
                 
            
                 
            
            Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
            
            
            [[[ref  queryOrderedByKey] queryEqualToValue: idd]
             
             observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
                 
                 
                 
                 
                 
                 
                 NSString *useremail  = snapshot.value[@"email"];
                 
                 
                 NSString *userpassword =  snapshot.value[@"password"];
                 
                 Firebase *ref22 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
                 
                 
                 [ref22 removeUser:useremail password:userpassword
                  
                  
              withCompletionBlock:^(NSError *error) {
                  
                  if (error) {
                      
                   
                      
                  } else {
                      
                      
                      
                  }
                  
              }];
                 
                 
                 
                 
             }];
            
            
            
            
            
            
            
            Firebase *ref6 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
            
            
            Firebase *usersRef6 = [ref6 childByAppendingPath: idd];
            
            
            
            
            [usersRef6 setValue:   NULL];
            
            
            
            
            
            
            
                 
                 
                 
           
            
            
            
        } else {
            
            
            
            [self performSegueWithIdentifier:@"CancelLogout" sender:self];
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
    }
    
}




- (IBAction)logoutfirebase:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"logoutfirebase"]) {
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
        
        [ref unauth];
        
        
        
        
    } }




- (IBAction)loginButtonFire:(id)sender {
    
   
    
    //Step 1: Create a UIAlertController
    
    
    UIAlertController *myAlertController = [UIAlertController alertControllerWithTitle:@" "
                                                                               message: @"Processing your request"
                                                                        preferredStyle:UIAlertControllerStyleAlert                   ];
    
    //Step 2: Create a UIAlertAction that can be added to the alert
    
    //Step 4: Present the alert to the user
    [self presentViewController:myAlertController animated:YES completion:nil];
    
    
    
    
    
    
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    [ref authUser: self.loginUsername.text  password: self.loginPassword.text
     
     
withCompletionBlock:^(NSError *error, FAuthData *authData) {
    
    
    if (error) {
       
        // an error occurred while attempting login
        
        
        
        
        // The login failed. Check error to see why.
      
      
        
        
        [myAlertController dismissViewControllerAnimated:YES completion:nil];
        
        
        
      
        //Step 1: Create a UIAlertController
        UIAlertController *myAlertController2 = [UIAlertController alertControllerWithTitle:@"Please try again"
                                                                                   message: @"The username and password you entered are invalid."
                                                                            preferredStyle:UIAlertControllerStyleAlert                   ];
        
        //Step 2: Create a UIAlertAction that can be added to the alert
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"Ok"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 //Do some thing here, eg dismiss the alertwindow
                                 [myAlertController2 dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        
        //Step 3: Add the UIAlertAction ok that we just created to our AlertController
        [myAlertController2 addAction: ok];
        
        //Step 4: Present the alert to the user
        [self presentViewController:myAlertController2 animated:YES completion:nil];
        
        
        
        
        
        
    } else {
       
        // user is logged in, check authData for data
        
       
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
        
        
        if (ref.authData) {
            
            
            
            
        
        }
        
        
        [myAlertController dismissViewControllerAnimated:YES completion:nil];
        
        
        
        
        
        [self performSegueWithIdentifier:@"LoginSegue" sender:sender];
        
        self.loginUsername.text = nil;
        self.loginPassword.text = nil;
        
        
        
    }
}];
    
        
        
        
    
}








- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}



- (void)viewDidDisappear:(BOOL)animated
{
    
    [super viewDidDisappear:animated];
    
    
    self.loginUsername.text = nil;
    self.loginPassword.text = nil;
    
       
}




// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
   
    
    
    if ([[segue identifier] isEqualToString:@"LoginSegue"]) {
        
      
        
        MasterViewController *destViewController = segue.destinationViewController;
        destViewController.teststring3 = self.currentuserVariable;
        
    
        
        
    }
    
    
    
    
}


@end
