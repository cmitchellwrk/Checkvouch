//
//  SearchFilterTableViewController.h
//  Mole
//
//  Created by Chris Mitchell on 4/4/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Company.h"


@protocol DTEditDelegate <NSObject>

-(void)returnToHomeAfterSavingData:(NSString*)infoString ZipandName:(NSString*)infostringtwo;

@end


 
 
 
 



@protocol DTEditDelegateThree <NSObject>


-(void)returnToHomeAfterSavingDataThree:(NSDate*)infoString Two:(NSDate*)infostringtwo;




@end







@interface SearchFilterTableViewController :  UITableViewController



@property (strong, nonatomic) NSString *comp_two;


@property (nonatomic, weak) id <DTEditDelegate> delegate;






@property (nonatomic, weak) id <DTEditDelegateThree> delegatethree;





@end
