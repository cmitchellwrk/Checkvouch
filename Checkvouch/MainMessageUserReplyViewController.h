//
//  MainMessageUserReplyViewController.h
//  Mole
//
//  Created by Chris Mitchell on 10/31/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMessageUserReplyViewController : UIViewController



@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSArray *friends;


@property (strong, nonatomic) NSString *messageto_username;

@property int valueInDollars;

@property (strong, nonatomic) NSTimer *myTimer;

@property (strong, nonatomic) NSString *message_currentusername;

@end
