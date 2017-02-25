//
//  LinkedinMessageViewController.h
//  Checka
//
//  Created by Chris Mitchell on 1/23/16.
//  Copyright (c) 2016 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>




#import <linkedin-sdk/LISDK.h>

#import "RegisterTableViewController.h"

#import "LoginViewController.h"


#import <Firebase/Firebase.h>



@interface LinkedinMessageViewController : UIViewController







@property (nonatomic, strong) NSString *linked_idval;



-(IBAction)sync:(id)sender;


-(IBAction)syncTwo:(id)sender;


 -(IBAction)executeTwo;




@end
