//
//  RegisterTableViewController.m
//  Mole
//
//  Created by Chris Mitchell on 2/1/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import "RegisterTableViewController.h"





@interface RegisterTableViewController ()

@property (nonatomic) int count;



@property NSDateFormatter *dateFormatter;



@property NSDateFormatter *dateFormatterTwo;



@end



@implementation RegisterTableViewController




@synthesize comp_datecreated1;


@synthesize usernameField = _usernameField;
@synthesize passwordField = _passwordField;
@synthesize emailField =    _emailField;
@synthesize phonenumberField = _phonenumberField;




@synthesize nameField = _nameField;
@synthesize cityField = _cityField;
@synthesize stateField = _stateField;
@synthesize zipcodeField = _zipcodeField;
@synthesize recommendField = _recommendField;





@synthesize linked_idval2;



@synthesize linked_idval3;






- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.allowsSelection = NO;
    
    self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    
    
    self.tableView.backgroundView = tempImageView;
    
   
    
    self.view.backgroundColor = [UIColor clearColor];
    
    
    
    
    
    [[self navigationController].navigationBar setBarTintColor:[UIColor colorWithRed:(1.0/255.0) green:(12.0/255.0) blue:(22.0/255.0) alpha:1.0]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.usernameField.backgroundColor = [UIColor clearColor];
    
    
    self.usernameField.layer.cornerRadius=8.0f;
    self.usernameField.layer.masksToBounds=YES;
    self.usernameField.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.usernameField.layer.borderWidth= 1.0f;
    
    self.passwordField.backgroundColor = [UIColor clearColor];
    
    
    self.passwordField .layer.cornerRadius=8.0f;
    self.passwordField .layer.masksToBounds=YES;
    self.passwordField .layer.borderColor=[[UIColor whiteColor]CGColor];
    self.passwordField .layer.borderWidth= 1.0f;
    
    
    self.emailField.backgroundColor = [UIColor clearColor];
    
    
    self.emailField.layer.cornerRadius=8.0f;
    self.emailField.layer.masksToBounds=YES;
    self.emailField.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.emailField.layer.borderWidth= 1.0f;
    
    self.phonenumberField.backgroundColor = [UIColor clearColor];
    
    
    self.phonenumberField.layer.cornerRadius=8.0f;
    self.phonenumberField.layer.masksToBounds=YES;
    self.phonenumberField.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.phonenumberField.layer.borderWidth= 1.0f;
    
    
    
    [self setupBirthdayLabel];
    
    
    
    
    self.count = 0;
    
    
    
    
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
    
    
    
    
    
    
    [self.datePicker setValue:[UIColor whiteColor] forKey:@"textColor"];
    
    [self.datePickerTwo setValue:[UIColor whiteColor] forKey:@"textColor"];
    
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.tableView addGestureRecognizer:gestureRecognizer];
    
    
}


- (void)hideKeyboard
{
    [self.view endEditing:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
    
    
}



-(BOOL) validateEmail:(NSString*) emailString

{
    NSString *regExPattern = @"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$";
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
    
   
    
    if (regExMatches == 0) {
        return NO;
    }
    else
        return YES;
}











- (IBAction)SignUpFire: (id) sender {
    
    
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Processing" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles: nil];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    indicator.frame=CGRectMake(20, 50, 36, 36);
    
    [indicator startAnimating];
    
    [alertView setValue:indicator forKey:@"accessoryView"];
    [alertView show];
    
    
    
    //create user account
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    
    [ref createUser:_emailField.text  password:_passwordField.text
     
withValueCompletionBlock:^(NSError *error, NSDictionary *result)
     
     
     
     
     {
         
        
         
         
         
         
         if (error != nil) {
             
             // an error occurred while attempting login
             switch(error.code) {
                     
                     
                 case FAuthenticationErrorEmailTaken:
                     
                 {
                     
                     UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Email is already taken"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                     [AV show];
                     
                     [alertView dismissWithClickedButtonIndex:0 animated:YES];
                     
                     
                 }
                     
                     
                     // Handle invalid user
                     break;
                     
                 case FAuthenticationErrorInvalidEmail:
                     
                     
                 {
                     
                     UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Email is invalid"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                     [AV show];
                     
                     [alertView dismissWithClickedButtonIndex:0 animated:YES];
                     
                     
                 }
                     
                     
                     
                     
                     // Handle invalid email
                     
                     
                     
                     break;
                     
                     
                 case FAuthenticationErrorInvalidPassword:
                     
                 {
                     
                     UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Password is invalid"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                     [AV show];
                     
                     [alertView dismissWithClickedButtonIndex:0 animated:YES];
                     
                     
                 }
                     
                     
                     // Handle invalid password
                     break;
                     
                     
                 default:
                     
                     break;
                     
                     
             }
             
             
             
             
             
             
         } else{
             
             
             
             
             
             
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
                 
                 
                 
                 Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users"];
                 
                 
                 
                 if (ref2.authData) {
                     
                     
                     NSString *test = ref2.authData.uid;
                     
                     
                     
                     
                     
                     
                     Firebase *postRef = [ref2 childByAppendingPath: @"workplaces"];
                     
                     
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
                 
                 
                 
                 
                 
                 
             }

             
             
             
    
             
             
             self.count++;
             
            
             
             
             
             NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
             
             [dateformate setDateFormat:@"MM-dd-yyyy"];
             
             NSString *date_String  =[dateformate stringFromDate:[NSDate date]];
             
             
             
             NSDate *todaydate = [dateformate dateFromString: date_String];// date with yyyy-MM-dd format
             
             
             NSTimeInterval since1970 = [todaydate timeIntervalSince1970]; // January 1st 1970
             
             double result_from = since1970 * 1000;
             
             NSNumber *mylongitudeObject = [NSNumber numberWithDouble:result_from];
             
             
             self.comp_datecreated1 = mylongitudeObject;
             
             
             
             
             [ref authUser:_emailField.text password:_passwordField.text
              
              
       withCompletionBlock:^(NSError *error, FAuthData *authData) {
           
           
           if (error) {
               
               
           } else {
               
               NSDictionary *newUser = @{
                                         @"password": _passwordField.text,
                                         @"name": _usernameField.text,
                                         @"email": _emailField.text ,
                                         @"job":@" ",
                                         @"linkedin":@" ",
                                         @"linkedin_id":@"",
                                         @"phonenumber": _phonenumberField.text,
                                         @"datecreated": mylongitudeObject,
                                         
                                         
                                         };
               
               [[[ref childByAppendingPath:@"users"]
                 childByAppendingPath:authData.uid] setValue:newUser];
            
               
              [alertView dismissWithClickedButtonIndex:0 animated:YES];
            
               
               [self performSegueWithIdentifier:@"RegisterSegue" sender:sender];
            
            
           }
           
           
       }];
             
            
             
         }
       
         
         
     }];
    
    
    
    

    
    
    
}






- (IBAction)SignUpFireRegTwo: (id) sender {
    
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Processing" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles: nil];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    indicator.frame=CGRectMake(20, 50, 36, 36);
    
    [indicator startAnimating];
    
    [alertView setValue:indicator forKey:@"accessoryView"];
    [alertView show];
    
    
    
    //create user account
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    
    [ref createUser:_emailField.text  password:_passwordField.text
     
withValueCompletionBlock:^(NSError *error, NSDictionary *result)
     
     
     
     
     {
         
         
         
         
         
         
         if (error != nil) {
             
             // an error occurred while attempting login
             switch(error.code) {
                     
                     
                 case FAuthenticationErrorEmailTaken:
                     
                 {
                     
                     UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Email is already taken"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                     [AV show];
                     
                     [alertView dismissWithClickedButtonIndex:0 animated:YES];
                     
                     
                 }
                     
                     
                     // Handle invalid user
                     break;
                     
                 case FAuthenticationErrorInvalidEmail:
                     
                     
                 {
                     
                     UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Email is invalid"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                     [AV show];
                     
                     [alertView dismissWithClickedButtonIndex:0 animated:YES];
                     
                     
                 }
                     
                     
                     
                     
                     // Handle invalid email
                     
                     
                     
                     break;
                     
                     
                 case FAuthenticationErrorInvalidPassword:
                     
                 {
                     
                     UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Password is invalid"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                     [AV show];
                     
                     [alertView dismissWithClickedButtonIndex:0 animated:YES];
                     
                     
                 }
                     
                     
                     // Handle invalid password
                     break;
                     
                     
                 default:
                     
                     break;
                     
                     
             }
             
             
             
             
             
             
         } else{
             
             
             [alertView dismissWithClickedButtonIndex:0 animated:YES];
             
             
             
             //
             [self performSegueWithIdentifier:@"RegisterTwo" sender:sender];
             
             
                 
                 

                 
             }
             
             
             
         
             
             
        
             
             
             
         
         
         
         
     }];
    
    
    
    
    
}











- (BOOL)SignUpFireBool: (id) sender {
    
    
    
    
    if([ self.nameField.text length] < 3)
        
    {
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid workplace name"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
        return FALSE;
        
        
    }else if ( [ self.stateField.text length] < 2 ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid US state"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
        return FALSE;
        
    }else if ( [ self.cityField.text length] < 2 ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid US city"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
          return FALSE;
        
        
        
    }else if ( [ self.zipcodeField.text length] < 5  ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid US zipcode"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
         return FALSE;
        
        
    }else if ( [ self.recommendField.text length] < 2  ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter the recommend field either yes or no"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
           return FALSE;
        
        
    }else if (self.selectedBirthday == nil ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid from date - the date you started"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
        return FALSE;
        
        
    }else if (self.selectedBirthdayTwo == nil ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid to date - the date you left"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
          return FALSE;
        
        
    } else{
        
        
        
        

    }
    
    
    
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Processing" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles: nil];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    indicator.frame=CGRectMake(20, 50, 36, 36);
    
    [indicator startAnimating];
    
    [alertView setValue:indicator forKey:@"accessoryView"];
    [alertView show];
    
    
    
    
    //create user account
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    
    [ref createUser:_emailField.text  password:_passwordField.text
     
withValueCompletionBlock:^(NSError *error, NSDictionary *result)
     
     
     {
         
         
         if (error != nil) {
             
             // an error occurred while attempting login
             switch(error.code) {
                     
                     
                 case FAuthenticationErrorEmailTaken:
                     
                 {
                     
                     UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Email is already taken"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                     [AV show];
                     
                     [alertView dismissWithClickedButtonIndex:0 animated:YES];
                     
                     
                       break;
                     
                 }
                     
                     
                     // Handle invalid user
                   
                     
                 case FAuthenticationErrorInvalidEmail:
                     
                     
                 {
                     
                     UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Email is invalid"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                     [AV show];
                     
                     [alertView dismissWithClickedButtonIndex:0 animated:YES];
                     
                     
                     
                      break;
                     
                 }
                     
                     
                     
                     
                     // Handle invalid email
                     
                     
                     
                    
                     
                     
                 case FAuthenticationErrorInvalidPassword:
                     
                 {
                     
                     UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Password is invalid"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                     [AV show];
                     
                     [alertView dismissWithClickedButtonIndex:0 animated:YES];
                     
                     
                      break;
                     
                 }
                     
                     
                     // Handle invalid password
                     
                     
                     
                 default:
                     
                     break;
                     
                     
             }
             
             
             
             
         } else{
             
             
             
             
    
             
             
             self.count++;
             
             
             
             
             
             NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
             
             [dateformate setDateFormat:@"MM-dd-yyyy"];
             
             NSString *date_String  =[dateformate stringFromDate:[NSDate date]];
             
             
             NSDate *todaydateb = [dateformate dateFromString: date_String];// date with yyyy-MM-dd format
             
             
             NSTimeInterval since1970b = [todaydateb timeIntervalSince1970]; // January 1st 1970
             
             double result_fromb = since1970b * 1000;
             
             NSNumber *mylongitudeObjectb = [NSNumber numberWithDouble:result_fromb];
             
             
             self.comp_datecreated1 = mylongitudeObjectb;
             
             
             
             
             [ref authUser:_emailField.text password:_passwordField.text
              
              
       withCompletionBlock:^(NSError *error, FAuthData *authData) {
           
           
           if (error) {
               
               // There was an error logging in to this account
               
               
           } else {
               
               NSDictionary *newUser = @{
                                         @"password": _passwordField.text,
                                         @"name": _usernameField.text,
                                         @"email": _emailField.text ,
                                         @"job":@" ",
                                         @"linkedin":@" ",
                                         @"linkedin_id":@"",
                                         @"phonenumber": _phonenumberField.text,
                                         @"datecreated": mylongitudeObjectb,
                                         
                                         
                                         };
               
               [[[ref childByAppendingPath:@"users"]
                 childByAppendingPath:authData.uid] setValue:newUser];
               
               
               
               
               
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
               
               
               
               Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users"];
               
               
               
               
               
               
               
               NSString *test = authData.uid;
               
            
               
               Firebase *postRef = [ref2 childByAppendingPath: @"workplaces"];
               
               
               Firebase *post1Ref = [postRef childByAutoId];
               
               NSString *postId = post1Ref.key;
               
               
               
               
               NSDictionary *nickname = @{
                                          
                                          @"name":coname2,
                                          @"city":cocity2,
                                          @"recommend":corecommend2,
                                          @"state":costate2,
                                          @"zipcode":cozipcode,
                                          @"from":mylongitudeObject,
                                          @"to":mylongitudeObjecttwo,
                                          @"userid":test,
                                          @"workplaceid":postId,
                                          
                                          
                                          
                                          };
               
               
               [post1Ref setValue: nickname];
               
               
               
               
               
               
               
               
               
               
               
           }
           
           
       }];
             
             
             [alertView dismissWithClickedButtonIndex:0 animated:YES];
             
             
             
             //
             [self performSegueWithIdentifier:@"RegisterSegue" sender:sender];
             
             
             
             
             
         }
       
        
         
         
         
         
         
         
         
     }];
    
    
    
    
    
    
    
  
    
    
    return TRUE;
    
    

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
    
    
    
    
     
    
}


- (IBAction)pickerDateChangedTwo:(UIDatePicker *)sender {
    
    
    self.birthdayLabelTwo.text =  [self.dateFormatter stringFromDate:sender.date];
    
    
    
    
    self.selectedBirthdayTwo = sender.date;
    
    
    
    
    
    
}







- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}






- (void)viewDidDisappear:(BOOL)animated
{
    
    [super viewDidDisappear:animated];
    
    
    
    self.count = 0;
    
}









#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
// #warning Potentially incomplete method implementation.
    // Return the number of sections.
    
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
// #warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    return 6;
    
    
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
    
   
    if ([[segue identifier] isEqualToString:@"RegisterTwo"]) {
        
        
        
        RegisterTwoTableViewController *destViewController = segue.destinationViewController;
        
        destViewController.usernameFieldTwo = self.usernameField;
        
        destViewController.passwordFieldTwo = self.passwordField;
        
        destViewController.phonenumberFieldTwo = self.phonenumberField;
        
        destViewController.emailFieldTwo = self.emailField;
        
    }
    
    
    
    
    
    
    // Pass the selected object to the new view controller.
}



@end
