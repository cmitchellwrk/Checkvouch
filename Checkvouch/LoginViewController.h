//
//  LoginViewController.h
//  Mole
//
//  Created by Chris Mitchell on 2/1/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>



//#import <Parse/Parse.h>


#import "LinkedinViewController.h"


#import "DeleteProfileViewController.h"


#import <Firebase/Firebase.h>





@interface LoginViewController : UIViewController{
    
    
    NSURLConnection *postConnection;
    
    
    
    
}



@property (weak, nonatomic) IBOutlet UITextField *loginUsername;

@property (weak, nonatomic) IBOutlet UITextField *loginPassword;


- (IBAction)loginButtonFire:(id)sender;






@property (nonatomic, strong) NSString *currentuserVariable;


@property (nonatomic, retain) IBOutlet UITextField *userNameTextField;
@property (nonatomic, retain) IBOutlet UITextField *passwordTextField;



- (IBAction)cancel:(UIStoryboardSegue *)sender;




@end
