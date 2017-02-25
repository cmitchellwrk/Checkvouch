//
//  CoPFTableViewController.h
//  Checka
//
//  Created by Chris Mitchell on 2/12/16.
//  Copyright (c) 2016 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <Firebase/Firebase.h>


#import "Company.h"


#import "MasterViewController.h"

#import "CoDetailTableViewController.h"


#import "CoEditTableViewController.h"

#import "AddCoTableViewController.h"




@interface CoPFTableViewController : UITableViewController{
    
    
    
    
}


@property (nonatomic, strong) NSMutableArray *tableData;

@property (nonatomic, strong) NSMutableDictionary *tableDictionary;




@end
