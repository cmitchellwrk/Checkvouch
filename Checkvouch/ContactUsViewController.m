//
//  ContactUsViewController.m
//  Mole
//
//  Created by Chris Mitchell on 11/14/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import "ContactUsViewController.h"

@interface ContactUsViewController ()





@end

@implementation ContactUsViewController



- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    
       
    [[self navigationController].navigationBar setTintColor:[UIColor colorWithRed:(245.0/255.0) green:(30.0/255.0) blue:(119.0/255.0) alpha:1.0]];
    
    
    [[self navigationController].navigationBar setBarTintColor:[UIColor colorWithRed:(1.0/255.0) green:(12.0/255.0) blue:(22.0/255.0) alpha:1.0]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    //add background
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    self.view.contentMode = UIViewContentModeScaleAspectFit;
    
    self.feedback.backgroundColor = [UIColor clearColor];
    
    
    self.feedback.layer.cornerRadius=8.0f;
    self.feedback.layer.masksToBounds=YES;
    self.feedback.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.feedback.layer.borderWidth= 1.0f;
    // Do any additional setup after loading the view.
    
    
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}




- (IBAction)loginButton:(id)sender {
    
    
    
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    if (ref.authData) {
        
       
        
        
        
        NSString *idd = ref.authData.uid;
        
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
        
        
        [[[ref  queryOrderedByKey] queryEqualToValue: idd]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             NSString *objid =   snapshot.value[@"userid"];
             
             NSString *usernme = snapshot.value[@"name"];
                                  
             
             
             Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com" ];
             
             
             Firebase *postRef = [ref2 childByAppendingPath: @"feedback"];
             
             
             Firebase *post1Ref = [postRef childByAutoId];
             
             NSString *postId = post1Ref.key;
             
             
             NSDictionary *nickname = @{
                                        
                                        @"UserId": objid,
                                        
                                        @"Username": usernme,
                                            
                                        @"comments": self.feedback.text,
                                        
                                        @"objectid": postId,
                                        
                                        
                                        
                                        };
             
             
             
             
             [post1Ref setValue: nickname];
             
            
             
         }];
        
        
        
    } else {
        
        
        
        [self performSegueWithIdentifier:@"CancelLogout" sender:self];
        
        
        // No user is signed in
        
        
    }
    
    
    
    
    
    
    
    
    
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - Navigation

/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([[segue identifier] isEqualToString:@"backToSource"])
    
    {
        
        
        
 
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
 


    
}

 
 */


@end
