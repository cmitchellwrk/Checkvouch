//
//  SearchDateTableViewController.h
//  Mole
//
//  Created by Chris Mitchell on 5/24/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>









@protocol VCAddPersonDelegateDate <NSObject>

- (void)savePersonDetailsTwo:(NSDate *)person Date:(NSDate *)persontwo;




@end







@interface SearchDateTableViewController : UITableViewController <UITextFieldDelegate>


 
@property  (weak, nonatomic) id<VCAddPersonDelegateDate> delegatedate;







- (IBAction)cancelPressed:(UIBarButtonItem *)sender;


- (IBAction)savePressed:(UIBarButtonItem *)sender;




- (IBAction)pickerDateChanged:(UIDatePicker *)sender;



- (IBAction)pickerDateChangedTwo:(UIDatePicker *)sender;






@property (weak, nonatomic) IBOutlet UITableViewCell *datePickerCell;


@property (weak, nonatomic) IBOutlet UITableViewCell *datePickerCellTwo;


@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerTwo;


@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel;


@property (weak, nonatomic) IBOutlet UILabel *birthdayLabelTwo;




@property (strong, nonatomic) NSDate *selectedBirthday;


@property (strong, nonatomic) NSDate *selectedBirthdayTwo;



@end
