//
//  ProfileDetailTableViewController.h
//  Mole
//
//  Created by Chris Mitchell on 2/15/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <Firebase/Firebase.h>




@interface ProfileDetailTableViewController : UITableViewController


@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UITextField *occupationField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *linkedinField;



@end
