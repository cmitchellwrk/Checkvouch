//
//  MainMessagesUserProfileTableViewController.h
//  Mole
//
//  Created by Chris Mitchell on 11/1/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>



#import <linkedin-sdk/LISDK.h>


#import <Firebase/Firebase.h>
#import "LinkedinViewController.h"




@interface MainMessagesUserProfileTableViewController : UITableViewController{
    
    
    
    
}



@property (weak, nonatomic) IBOutlet UILabel *username;

@property (weak, nonatomic) IBOutlet UILabel *email;

@property (weak, nonatomic) IBOutlet UILabel *occupation;

@property (weak, nonatomic) IBOutlet UILabel *linkedin;

@property (strong, nonatomic) NSString *messageusername;

@property (strong, nonatomic) NSString *messageuserid;


@property (strong, nonatomic) NSString *linkedin_idd;

@end
