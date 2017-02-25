//
//  OpenJobsTableViewController.h
//  Checkvouch
//
//  Created by Chris Mitchell on 7/4/16.
//  Copyright © 2016 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Firebase/Firebase.h>

#import "EnterJobTableViewController.h"

#import "OpenJobsDetailTableViewController.h"


#import "Job.h"


@interface OpenJobsTableViewController : UITableViewController{
    
    
}




@property (nonatomic, strong) NSMutableArray *tableData;

@property (nonatomic, strong) NSMutableDictionary *tableDictionary;



@end
