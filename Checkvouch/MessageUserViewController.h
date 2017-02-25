//
//  MessageUserViewController.h
//  Mole
//
//  Created by Chris Mitchell on 10/4/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import <Parse/Parse.h>

#import <QuartzCore/QuartzCore.h>





@interface MessageUserViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {

       
    
}


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSArray *friends;


 @property (strong, nonatomic) NSString *messageto_username;


@property (strong, nonatomic) NSTimer *myTimer;

@end
