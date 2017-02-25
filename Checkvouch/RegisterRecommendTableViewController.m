//
//  RegisterRecommendTableViewController.m
//  Checkvouch
//
//  Created by Chris Mitchell on 7/22/16.
//  Copyright © 2016 Chris Mitchell. All rights reserved.
//

#import "RegisterRecommendTableViewController.h"



@interface RegisterRecommendTableViewController ()




@property NSDateFormatter *dateFormatter;



@property NSDateFormatter *dateFormatterTwo;





@end

@implementation RegisterRecommendTableViewController




@synthesize nameField = _nameField;
@synthesize cityField = _cityField;
@synthesize stateField = _stateField;
@synthesize zipcodeField = _zipcodeField;
@synthesize recommendField = _recommendField;




@synthesize  comp_username;
@synthesize  comp_password;
@synthesize  comp_zipcode;
@synthesize  comp_phonenumber;
@synthesize  comp_email;

@synthesize comp_datecreated2;




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.allowsSelection = NO;
    
    
    [[self navigationController].navigationBar setBarTintColor:[UIColor colorWithRed:(1.0/255.0) green:(12.0/255.0) blue:(22.0/255.0) alpha:1.0]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    self.nameField.backgroundColor = [UIColor clearColor];
    
    
    self.nameField.layer.cornerRadius=8.0f;
    self.nameField.layer.masksToBounds=YES;
    self.nameField.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.nameField.layer.borderWidth= 1.0f;
    
    self.cityField.backgroundColor = [UIColor clearColor];
    
    
    self.cityField.layer.cornerRadius=8.0f;
    self.cityField.layer.masksToBounds=YES;
    self.cityField.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.cityField.layer.borderWidth= 1.0f;
    
    
    self.stateField.backgroundColor = [UIColor clearColor];
    
    
    self.stateField.layer.cornerRadius=8.0f;
    self.stateField.layer.masksToBounds=YES;
    self.stateField.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.stateField.layer.borderWidth= 1.0f;
    
    self.zipcodeField.backgroundColor = [UIColor clearColor];
    
    
    self.zipcodeField.layer.cornerRadius=8.0f;
    self.zipcodeField.layer.masksToBounds=YES;
    self.zipcodeField.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.zipcodeField.layer.borderWidth= 1.0f;
    
    
    self.recommendField.backgroundColor = [UIColor clearColor];
    
    
    self.recommendField.layer.cornerRadius=8.0f;
    self.recommendField.layer.masksToBounds=YES;
    self.recommendField.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.recommendField.layer.borderWidth= 1.0f;
    
    

    
    self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    
    
    self.tableView.backgroundView = tempImageView;
    
    
    self.view.backgroundColor = [UIColor clearColor];
    
    
    [self.datePicker setValue:[UIColor whiteColor] forKey:@"textColor"];
    
    [self.datePickerTwo setValue:[UIColor whiteColor] forKey:@"textColor"];
    
    
    
    
    
    
    
    [self setupBirthdayLabel];
    
    
    
    
    
    
    
    
    
}



- (IBAction)cancelTutorial:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelTutorial"]) {
        
        
        
        
        
        
    } }





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







- (IBAction)saveButton:(id)sender {
    

    
    
    
    
    
    if([ self.nameField.text length] < 3)
        
    {
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid  company name"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
        
        
    }else if ( [ self.stateField.text length] < 2 ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid US state"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
        
        
    }else if ( [ self.zipcodeField.text length] < 5  ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid US zipcode"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
        
    }else if ( [ self.recommendField.text length] < 2  ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter the recommend field either yes or no"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
        
        
    }else if (self.selectedBirthday == nil ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid from date - the date you started"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
       
        
        
    }else if (self.selectedBirthdayTwo == nil ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid to date - the date you left"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
       
        
        
    } else{
        
        
        
        
        
        NSString *coname = self.nameField.text;
        NSString *coname2 = [coname lowercaseString];
        
        NSString *cocity = self.cityField.text;
        NSString *cocity2 = [cocity lowercaseString];
        
        NSString *costate = self.stateField.text;
        NSString *costate2 = [costate lowercaseString];
        
        NSString *cozipcode = self.zipcodeField.text;
        
        
        NSString *corecommend = self.recommendField.text;
        NSString *corecommend2 = [corecommend lowercaseString];
        
        
        NSDate *datetwo = self.selectedBirthday;
        NSDate *datethree = self.selectedBirthdayTwo;
        
        
        
    
        
        
        NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
        
        
        [dateFormat1 setDateFormat:@"MM-dd-yyyy"];
        
        
        
        NSString *strToday = [dateFormat1  stringFromDate:datetwo];
        NSString *strTodayTwo = [dateFormat1  stringFromDate:datethree];
        
        
        
        NSDate *todaydate = [dateFormat1 dateFromString:strToday];// date with yyyy-MM-dd format
        
        NSDate *todaydateTwo = [dateFormat1 dateFromString:strTodayTwo];// date with yyyy-MM-dd format
        
        
        
        NSTimeInterval since1970 = [todaydate timeIntervalSince1970]; // January 1st 1970
        
        double result_from = since1970 * 1000;
        
        NSNumber *mylongitudeObject = [NSNumber numberWithDouble:result_from];
        
        
        NSTimeInterval since1970_to = [todaydateTwo timeIntervalSince1970]; // January 1st 1970
        
        double result_to = since1970_to * 1000;
        
        NSNumber *mylongitudeObjecttwo = [NSNumber numberWithDouble:result_to];
        
        
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users"];
        
        
        
        if (ref.authData) {
            
            
            NSString *test = ref.authData.uid;
            
            
        
    
           
            
            Firebase *postRef = [ref childByAppendingPath: @"workplaces"];
            
            
            Firebase *post1Ref = [postRef childByAutoId];
            
            NSString *postId = post1Ref.key;
            
            
            NSDictionary *nickname = @{
                                       
                                       @"name": coname2,
                                       @"city": cocity2,
                                       @"recommend": corecommend2,
                                       @"state": costate2,
                                       @"zipcode":cozipcode,
                                       @"from":mylongitudeObject,
                                       @"to":mylongitudeObjecttwo,
                                       @"userid":test,
                                       @"workplaceid":postId,
                                       
                                       
                                       
                                       };
            
            
            [post1Ref setValue: nickname];
            
            
            
            
            
            
            
            
            
            
        } else {
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
                 
                [self performSegueWithIdentifier:@"saveCoRegisterFinal" sender:self];
                 
                 
                 
             
   

        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}












- (void)setupBirthdayLabel {
    
    
    
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    
    self.dateFormatterTwo = [[NSDateFormatter alloc] init];
    
    
    [self.dateFormatter setDateFormat:@"MM-dd-yyyy"];
    
    [self.dateFormatterTwo setDateFormat:@"MM-dd-yyyy"];
    
    
    
    
    
    [self.dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    
    [self.dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    
    [self.dateFormatterTwo setDateStyle:NSDateFormatterMediumStyle];
    
    
    [self.dateFormatterTwo setTimeStyle:NSDateFormatterNoStyle];
    
    
    
    
    
    
    NSDate *defaultDate = [NSDate date];
    
    
  
    
    
    self.birthdayLabel.text = [self.dateFormatter stringFromDate:defaultDate];
    
    self.birthdayLabel.textColor = [ UIColor whiteColor];
    
    self.birthdayLabelTwo.text = [self.dateFormatter stringFromDate:defaultDate];
    self.birthdayLabelTwo.textColor = [UIColor whiteColor];
    
    
    
    
    
    
    
}




#pragma mark - Action methods

- (IBAction)pickerDateChanged:(UIDatePicker *)sender {
    
    self.birthdayLabel.text =  [self.dateFormatter stringFromDate:sender.date];
    
    
    
    
    self.selectedBirthday = sender.date;
    
    
    
}


- (IBAction)pickerDateChangedTwo:(UIDatePicker *)sender {
    
    
    self.birthdayLabelTwo.text =  [self.dateFormatter stringFromDate:sender.date];
    
    
        
    
    self.selectedBirthdayTwo = sender.date;
    
    
    
    
    
    
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}





- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}








#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
//#warning Incomplete implementation, return the number of sections
    
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
//#warning Incomplete implementation, return the number of rows
    
    
    return 11;
}



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
 
 
*/



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/



/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
}


@end
