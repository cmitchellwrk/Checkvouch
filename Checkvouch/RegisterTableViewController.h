//
//  RegisterTableViewController.h
//  Mole
//
//  Created by Chris Mitchell on 2/1/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "LinkedinViewController.h"



#import <Firebase/Firebase.h>

#import "RegisterRecommendTableViewController.h"

#import "RegisterTwoTableViewController.h"



@interface RegisterTableViewController : UITableViewController{
    
    
    NSURLConnection *postConnection;
    
    
    
}





@property (nonatomic, retain) IBOutlet UITextField *usernameField;
@property (nonatomic, retain) IBOutlet UITextField *passwordField;
@property (nonatomic, retain) IBOutlet UITextField *emailField;
@property (nonatomic, retain) IBOutlet UITextField *phonenumberField;





@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *zipcodeField;
@property (weak, nonatomic) IBOutlet UITextField *recommendField;




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








-(BOOL)SignUpFireBool:(id)sender;




-(IBAction)SignUpFire:(id)sender;




@property (nonatomic, strong) NSString *linked_idval2;


@property (nonatomic, strong) NSString *linked_idval3;



@property (strong, nonatomic) NSNumber *comp_datecreated1;


@end
