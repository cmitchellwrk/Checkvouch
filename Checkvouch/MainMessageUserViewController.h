//
//  MainMessageUserViewController.h
//  Mole
//
//  Created by Chris Mitchell on 10/23/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>





@interface MainMessageUserViewController : UIViewController{
    
  
    
    
    
    
}


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSArray *friends;


@property (strong, nonatomic) NSString *messageto_username;

@property int valueInDollars;

@property (strong, nonatomic) NSTimer *myTimer;





@end
