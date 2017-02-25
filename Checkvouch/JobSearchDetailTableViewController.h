//
//  JobSearchDetailTableViewController.h
//  Checkvouch
//
//  Created by Chris Mitchell on 7/9/16.
//  Copyright © 2016 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "Job.h"

#import <Firebase/Firebase.h>

@interface JobSearchDetailTableViewController : UITableViewController{
    
    
    
    
    
    
}





@property (strong, nonatomic) id detailItem;


@property (weak, nonatomic) IBOutlet UILabel *catagoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *zipcodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *salaryLabel;



@property (weak, nonatomic) IBOutlet UILabel *descriptLabel;

@property (weak, nonatomic) IBOutlet UITextView *descriptLabelTwo;


@property (strong, nonatomic) NSString *job_id;
@property (strong, nonatomic) NSString *postfrom_id;



@end
