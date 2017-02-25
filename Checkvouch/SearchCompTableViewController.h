//
//  SearchCompTableViewController.h
//  Mole
//
//  Created by Chris Mitchell on 4/5/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Company.h"



#import <Firebase/Firebase.h>




//delegate function to send the name and zipcode to the searchfiltertableviewcontroller
@protocol StateSelectionDelegate <NSObject>


-(void) selectedState:(NSString *)state Two:(NSString*)statetwo;


@end




@interface SearchCompTableViewController : UITableViewController  {
    
    
    
    
    
    
    NSURLConnection *postConnection;
    
    NSMutableArray *json;
    
    
    
    
    
    
    
}



@property (nonatomic, strong) NSString *teststring2;


@property  (strong, nonatomic)  NSString *comp_three;







@property (nonatomic, strong) NSMutableArray *tableData;



@property (nonatomic, strong) NSMutableArray *tableDataFirst;



@property (nonatomic, strong) NSMutableArray *tableDataThird;



@property (nonatomic, strong) UILocalizedIndexedCollation *collation;


@property (nonatomic, strong) NSMutableArray *outerArray;


@property (nonatomic, strong) NSMutableArray *arraytwo;


@property (nonatomic, strong) NSArray *indexTitlesArray;


@property (nonatomic, weak) id<StateSelectionDelegate> delegate;



@end
