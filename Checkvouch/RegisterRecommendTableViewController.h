//
//  RegisterRecommendTableViewController.h
//  Checkvouch
//
//  Created by Chris Mitchell on 7/22/16.
//  Copyright © 2016 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <Firebase/Firebase.h>



@interface RegisterRecommendTableViewController : UITableViewController





@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *zipcodeField;
@property (weak, nonatomic) IBOutlet UITextField *recommendField;





@property (strong, nonatomic) NSString *comp_username;
@property (strong, nonatomic) NSString *comp_password;
@property (strong, nonatomic) NSString *comp_zipcode;
@property (strong, nonatomic) NSString *comp_phonenumber;
@property (strong, nonatomic) NSString *comp_email;



@property (strong, nonatomic) NSNumber* comp_datecreated2;





- (IBAction)pickerDateChanged:(UIDatePicker *)sender;



- (IBAction)pickerDateChangedTwo:(UIDatePicker *)sender;




- (IBAction)saveButton:(id)sender;





@property (weak, nonatomic) IBOutlet UITableViewCell *datePickerCell;


@property (weak, nonatomic) IBOutlet UITableViewCell *datePickerCellTwo;


@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerTwo;


@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel;


@property (weak, nonatomic) IBOutlet UILabel *birthdayLabelTwo;



@property (strong, nonatomic) NSDate *selectedBirthday;


@property (strong, nonatomic) NSDate *selectedBirthdayTwo;




@end
