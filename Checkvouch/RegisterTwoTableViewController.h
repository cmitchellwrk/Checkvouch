//
//  RegisterTwoTableViewController.h
//  Checkvouch
//
//  Created by Chris Mitchell on 11/9/16.
//  Copyright © 2016 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>



#import <Firebase/Firebase.h>


#import <CoreLocation/CoreLocation.h>
#import <AddressBookUI/AddressBookUI.h>




@interface RegisterTwoTableViewController : UITableViewController <UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

  {
    
    
    
    
}



@property (nonatomic, retain) IBOutlet UITextField *usernameFieldTwo;
@property (nonatomic, retain) IBOutlet UITextField *passwordFieldTwo;
@property (nonatomic, retain) IBOutlet UITextField *emailFieldTwo;
@property (nonatomic, retain) IBOutlet UITextField *phonenumberFieldTwo;



@property (strong, nonatomic) NSNumber *comp_datecreated1;



-(BOOL)SignUpFireBool:(id)sender;






@end
