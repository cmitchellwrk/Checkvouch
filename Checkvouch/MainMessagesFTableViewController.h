//
//  MainMessagesFTableViewController.h
//  Checka
//
//  Created by Chris Mitchell on 3/3/16.
//  Copyright (c) 2016 Chris Mitchell. All rights reserved.
//



#import <UIKit/UIKit.h>




#import <Firebase/Firebase.h>





@interface MainMessagesFTableViewController : UITableViewController


@property (strong, nonatomic) NSString *queryusername;



@property (nonatomic, strong) NSArray *allUsers;


@property (nonatomic, strong) NSMutableArray *friends;


@property (nonatomic, strong) NSMutableArray *unique;




@property (strong, nonatomic) NSString *messageusername;



@property (nonatomic, strong) UIButton *myButton;



@end
