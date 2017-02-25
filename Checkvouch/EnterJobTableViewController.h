//
//  EnterJobTableViewController.h
//  Checkvouch
//
//  Created by Chris Mitchell on 7/3/16.
//  Copyright © 2016 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <Firebase/Firebase.h>



@interface EnterJobTableViewController : UITableViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>


@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UITextField *textField4;


@property (weak, nonatomic) IBOutlet UITextField *textField5;
@property (weak, nonatomic) IBOutlet UITextField *textField6;
@property (weak, nonatomic) IBOutlet UITextField *textField7;
@property (weak, nonatomic) IBOutlet UITextField *textField8;



@property (weak, nonatomic) IBOutlet UITextView *descr;




- (IBAction)saveButton:(id)sender;




@end
