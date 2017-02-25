//
//  AddCoTableViewController.h
//  Mole
//
//  Created by Chris Mitchell on 3/15/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <Firebase/Firebase.h>

#import <CoreLocation/CoreLocation.h>
#import <AddressBookUI/AddressBookUI.h>




@interface AddCoTableViewController : UITableViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>


{

    
}




@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *zipcodeField;
@property (weak, nonatomic) IBOutlet UITextField *recommendField;


@property (weak, nonatomic) IBOutlet UITextField *textFieldHowLong;
@property (weak, nonatomic) IBOutlet UITextField *textFieldWhatYear;




- (IBAction)pickerDateChanged:(UIDatePicker *)sender;



- (IBAction)pickerDateChangedTwo:(UIDatePicker *)sender;




- (IBAction)saveButton:(id)sender;







@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel;


@property (weak, nonatomic) IBOutlet UILabel *birthdayLabelTwo;



@property (strong, nonatomic) NSDate *selectedBirthday;


@property (strong, nonatomic) NSDate *selectedBirthdayTwo;





@end
