//
//  JobNotifyMessageViewController.h
//  Checkvouch
//
//  Created by Chris Mitchell on 7/10/16.
//  Copyright © 2016 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobNotifyMessageViewController : UIViewController





@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSArray *friends;


@property (strong, nonatomic) NSString *messageto_username;

@property int valueInDollars;

@property (strong, nonatomic) NSTimer *myTimer;

@property (strong, nonatomic) NSString *message_currentusername;







@end
