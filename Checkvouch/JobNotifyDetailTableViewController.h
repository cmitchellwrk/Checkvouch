//
//  JobNotifyDetailTableViewController.h
//  Checkvouch
//
//  Created by Chris Mitchell on 7/10/16.
//  Copyright © 2016 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <Firebase/Firebase.h>

#import "JobNotifyMessageViewController.h"


#import <linkedin-sdk/LISDK.h>

#import "LinkedinViewController.h"


@interface JobNotifyDetailTableViewController : UITableViewController

@property (strong, nonatomic) NSString *linkedinid;

    
@property (strong, nonatomic) NSString *jobwant_replyid;


@property (strong, nonatomic) NSString *jobnotifyid;

@property (strong, nonatomic) NSString *postfrom_id;


@property (strong, nonatomic) NSString *postfrom_id_username;

@property (strong, nonatomic) NSString *placeholder_currentusername;


@property (weak, nonatomic) IBOutlet UILabel *postfromidLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeholdercurrentusernameLabel;




@property (weak, nonatomic) IBOutlet UILabel *catagoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *zipcodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *salaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptLabel;







@end
