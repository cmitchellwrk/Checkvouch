//
//  PasswordResetViewController.m
//  Mole
//
//  Created by Chris Mitchell on 11/1/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import "PasswordResetViewController.h"



@interface PasswordResetViewController ()



@end



@implementation PasswordResetViewController



@synthesize  passwordTextField;




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[self navigationController].navigationBar setTintColor:[UIColor colorWithRed:(245.0/255.0) green:(30.0/255.0) blue:(119.0/255.0) alpha:1.0]];
    
    
    [[self navigationController].navigationBar setBarTintColor:[UIColor colorWithRed:(1.0/255.0) green:(12.0/255.0) blue:(22.0/255.0) alpha:1.0]];
    
    self.navigationController.navigationBar.translucent = NO;
    
   
    
    
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    self.view.contentMode = UIViewContentModeScaleAspectFit;
    
    
    self.passwordTextField.backgroundColor = [UIColor clearColor];
    
    
    self.passwordTextField.layer.cornerRadius=8.0f;
    self.passwordTextField.layer.masksToBounds=YES;
    self.passwordTextField.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.passwordTextField.layer.borderWidth= 1.0f;
    
    
    
    
    
    // Do any additional setup after loading the view.
}




- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)passwordButton:(id)sender {
    
    
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    if (ref.authData) {
        
        
        
        NSString *idd = ref.authData.uid;
        
        
        Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
        
        
        [[[ref2  queryOrderedByKey] queryEqualToValue: idd]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             
             NSString *useremail = snapshot.value[@"email"];
             
            
             Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
             
             
             [ref resetPasswordForUser: useremail withCompletionBlock:^(NSError *error) {
                 
                 if (error) {
                     
                     // There was an error processing the request
                     
                 } else {
                     
                     // Password reset sent successfully
                     
                 }
             }];
             
             
             
             
         }];
        
        
        
    } else {
        
        
        
        [self performSegueWithIdentifier:@"CancelLogout" sender:self];
        
        
        // No user is signed in
        
        
    }
    
    
    
    
      

    self.passwordTextField.text = nil;
    
    


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
