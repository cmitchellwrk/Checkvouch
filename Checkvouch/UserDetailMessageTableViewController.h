//
//  UserDetailMessageTableViewController.h
//  Mole
//
//  Created by Chris Mitchell on 10/3/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import <Parse/Parse.h>

//#import <ParseUI/ParseUI.h>


#import <linkedin-sdk/LISDK.h>

#import "MessageUserViewController.h"


#import <Firebase/Firebase.h>

#import "LinkedinViewController.h"



@interface UserDetailMessageTableViewController : UITableViewController


@property (strong, nonatomic) NSString *comp_id;
@property (strong, nonatomic) NSString *comp_userid;

@property (strong, nonatomic) NSString *linkedinid;

@property (strong, nonatomic) NSString *messageusername;


@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *company;
@property (weak, nonatomic) IBOutlet UILabel *companyzipcode;
@property (weak, nonatomic) IBOutlet UILabel *from;
@property (weak, nonatomic) IBOutlet UILabel *to;
@property (weak, nonatomic) IBOutlet UILabel *recommend;
@property (weak, nonatomic) IBOutlet UILabel *occupation;


@property (strong, nonatomic) NSDate *selectedBirthday;
@property (strong, nonatomic) NSDate *selectedBirthdayTwo;



-(IBAction)syncTwo:(id)sender;



-(IBAction)syncFour:(id)sender;



@end
