//
//  SearchMasFTableViewController.h
//  Checka
//
//  Created by Chris Mitchell on 2/20/16.
//  Copyright (c) 2016 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "Company.h"



#import "UserDetailMessageTableViewController.h"

#import <Firebase/Firebase.h>


#import "Company.h"


#import "MasterViewController.h"

#import "CoDetailTableViewController.h"


#import "CoEditTableViewController.h"

#import "AddCoTableViewController.h"






@interface SearchMasFTableViewController : UITableViewController{
    
    
    NSMutableArray *json;
    
    
 
    
}

@property (nonatomic, strong) NSMutableArray *tableData;





@property (nonatomic, strong) NSMutableDictionary *tableDictionary;




@property (strong, nonatomic) NSString *comp_name;

@property (strong, nonatomic) NSString *comp_zip;
@property (strong, nonatomic) NSString *comp_datefrom;
@property (strong, nonatomic) NSString *comp_dateto;


@property (strong, nonatomic) NSDate *comp_datefrom_two;
@property (strong, nonatomic) NSDate *comp_dateto_two;


@property (strong, nonatomic) NSString *lastview;

@property (strong, nonatomic) NSString *paidornot;



@end
