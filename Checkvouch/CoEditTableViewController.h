//
//  CoEditTableViewController.h
//  Mole
//
//  Created by Chris Mitchell on 3/15/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <CoreLocation/CoreLocation.h>
#import <AddressBookUI/AddressBookUI.h>


#import <CoreLocation/CoreLocation.h>
#import <AddressBookUI/AddressBookUI.h>





@protocol DTEditDelegateDate <NSObject>


-(void)returnToHomeAfterSavingDate:(NSString*)infoString;





@end







@interface CoEditTableViewController : UITableViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

{
    
    
    
}







@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *zipcodeField;
@property (weak, nonatomic) IBOutlet UITextField *recommendField;
@property (weak, nonatomic) IBOutlet UITextField *fromField;
@property (weak, nonatomic) IBOutlet UITextField *toField;


@property (weak, nonatomic) IBOutlet UITextField *ovalField;




- (IBAction)datePickerChanged:(UIDatePicker *)sender;



- (IBAction)datePickerChangedTwo:(UIDatePicker *)sender;




@property (weak, nonatomic) IBOutlet UITableViewCell *datePickerCell;



@property (weak, nonatomic) IBOutlet UITableViewCell *datePickerCellTwo;


@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerFrom;



@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerTo;


@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabelTo;


@property (weak, nonatomic) IBOutlet NSDate  *dateone;

@property (weak, nonatomic) IBOutlet NSDate  *datetwo;





- (IBAction)saveButton:(id)sender;







@property (nonatomic, weak) id <DTEditDelegateDate> delegate;



@end
