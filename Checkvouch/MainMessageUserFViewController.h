//
//  MainMessageUserFViewController.h
//  Checka
//
//  Created by Chris Mitchell on 3/6/16.
//  Copyright (c) 2016 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMessageUserFViewController : UIViewController{
    
    
    
    
    
}



@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSArray *friends;


@property (strong, nonatomic) NSString *messageto_username;

@property int valueInDollars;

@property (strong, nonatomic) NSTimer *myTimer;



@property (strong, nonatomic) NSString *currentuser_username;




@end
