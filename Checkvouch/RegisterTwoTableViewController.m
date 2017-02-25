//
//  RegisterTwoTableViewController.m
//  Checkvouch
//
//  Created by Chris Mitchell on 11/9/16.
//  Copyright © 2016 Chris Mitchell. All rights reserved.
//

#import "RegisterTwoTableViewController.h"

@interface RegisterTwoTableViewController ()



@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSArray *pickerArray;



@property (strong, nonatomic) IBOutlet UIPickerView *picker2;
@property (strong, nonatomic) NSArray *picker2Array;


@property (strong, nonatomic) IBOutlet UIPickerView *picker3;
@property (strong, nonatomic) NSArray *picker3Array;




@property (weak, nonatomic) IBOutlet UITextField *textFieldCoName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCoZip;

@property (weak, nonatomic) IBOutlet UITextField *textFieldCoCity;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCoState;


@property (weak, nonatomic) IBOutlet UITextField *textFieldHowLong;
@property (weak, nonatomic) IBOutlet UITextField *textFieldWhatYear;

@property (weak, nonatomic) IBOutlet UITextField *textFieldRecommend;



@end



@implementation RegisterTwoTableViewController




@synthesize usernameFieldTwo = _usernameField;
@synthesize passwordFieldTwo = _passwordField;
@synthesize emailFieldTwo =    _emailField;
@synthesize phonenumberFieldTwo = _phonenumberField;




@synthesize comp_datecreated1;




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.allowsSelection = NO;
    
    [[self navigationController].navigationBar setTintColor:[UIColor colorWithRed:(245.0/255.0) green:(30.0/255.0) blue:(119.0/255.0) alpha:1.0]];
    
    
    self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    
    
    self.tableView.backgroundView = tempImageView;
    
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    
    
    
    [[self navigationController].navigationBar setBarTintColor:[UIColor colorWithRed:(1.0/255.0) green:(12.0/255.0) blue:(22.0/255.0) alpha:1.0]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    
   
    
    
    
    self.pickerArray  = [[NSArray alloc] initWithObjects:@"1990", @"1991", @"1992", @"1993", @"1994", @"1995", @"1996", @"1997", @"1998", @"1999", @"2000", @"2001", @"2002", @"2003", @"2004", @"2005", @"2006", @"2007", @"2008", @"2009", @"2010", @"2011", @"2012", @"2013",@"2014", @"2015",@"2016", nil];
    
    
    self.picker2Array  = [[NSArray alloc] initWithObjects: @"Yes", @"No", @"Contact Me", nil];
    
    
    self.picker3Array  = [[NSArray alloc] initWithObjects:@"Buildings & land rights(e.g.offices)", @"Fixed equipment & software(e.g.computers)", @"Light factory equipment(e.g. lift trucks)", @"Office equipment(e.g. desks)", @"Office supplies(e.g. paper)", @"Maintenance & repair items(e.g. paint)", @"Maintenance & repair services(e.g. computer repair)", @"Business advisory services(e.g. legal, consulting)",  nil];
    
    
    
    
    self.picker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    self.picker2 = [[UIPickerView alloc] initWithFrame:CGRectZero];
    self.picker3 = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    
    
    [self attachPickerToTextField:self.textFieldWhatYear :self.picker];
    [self attachPickerToTextField:self.textFieldRecommend :self.picker2];
    [self attachPickerToTextField:self.textFieldHowLong :self.picker3];
    
    
    
    self.textFieldCoName.backgroundColor = [UIColor clearColor];
    
    
    self.textFieldCoName.layer.cornerRadius=8.0f;
    self.textFieldCoName.layer.masksToBounds=YES;
    self.textFieldCoName.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textFieldCoName.layer.borderWidth= 1.0f;
    
    self.textFieldCoZip.backgroundColor = [UIColor clearColor];
    
    
    self.textFieldCoZip.layer.cornerRadius=8.0f;
    self.textFieldCoZip.layer.masksToBounds=YES;
    self.textFieldCoZip.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textFieldCoZip.layer.borderWidth= 1.0f;
    
    
    self.textFieldCoCity.backgroundColor = [UIColor clearColor];
    
    
    self.textFieldCoCity.layer.cornerRadius=8.0f;
    self.textFieldCoCity.layer.masksToBounds=YES;
    self.textFieldCoCity.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textFieldCoCity.layer.borderWidth= 1.0f;
    
    
    self.textFieldCoState.backgroundColor = [UIColor clearColor];
    
    
    self.textFieldCoState.layer.cornerRadius=8.0f;
    self.textFieldCoState.layer.masksToBounds=YES;
    self.textFieldCoState.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textFieldCoState.layer.borderWidth= 1.0f;
    
    
    self.textFieldHowLong.backgroundColor = [UIColor clearColor];
    
    
    self.textFieldHowLong.layer.cornerRadius=8.0f;
    self.textFieldHowLong.layer.masksToBounds=YES;
    self.textFieldHowLong.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textFieldHowLong.layer.borderWidth= 1.0f;
    
    
    self.textFieldWhatYear.backgroundColor = [UIColor clearColor];
    
    
    self.textFieldWhatYear.layer.cornerRadius=8.0f;
    self.textFieldWhatYear.layer.masksToBounds=YES;
    self.textFieldWhatYear.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textFieldWhatYear.layer.borderWidth= 1.0f;
    
    
    self.textFieldRecommend.backgroundColor = [UIColor clearColor];
    
    
    self.textFieldRecommend.layer.cornerRadius=8.0f;
    self.textFieldRecommend.layer.masksToBounds=YES;
    self.textFieldRecommend.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textFieldRecommend.layer.borderWidth= 1.0f;
    
    
    
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.tableView addGestureRecognizer:gestureRecognizer];
    
    
    
    
}




- (void)hideKeyboard
{
    [self.view endEditing:YES];
}





- (IBAction)SignUpFire: (id) sender {
    
    //int count1 = 0;
    
    
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
         

             
             if([ self.textFieldCoName.text length] < 3)
                 
             {
                 
                 UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid  company name"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                 [AV show];
                 
                 
                 
                 
             }else if ( [ self.textFieldCoZip.text length] < 5  ){
                 
                 UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid US zipcode"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                 [AV show];
                 
                 
                 
                 
                 
                 
             } else{
                 
                 
                 
                 
                 
                 NSString *coname = self.textFieldCoName.text;
                 NSString *coname2 = [coname lowercaseString];
                 
                 
                 NSString *cozip = self.textFieldCoZip.text;
                 NSString *cozip2 = [cozip lowercaseString];
                 
                 
                
                 NSString *cocity = self.textFieldCoCity.text;
                 NSString *cocity2 = [cocity lowercaseString];
                 
                 
                 NSString *costate = self.textFieldCoState.text;
                 NSString *costate2 = [costate lowercaseString];
                 
                 

                 NSString *corecommend = self.textFieldRecommend.text;
                 NSString *corecommend2 = [corecommend lowercaseString];
                 
                 
                 
                 NSString *cohowlongworked = self.textFieldHowLong.text;
                
                 
                 NSString *coyearleft = self.textFieldWhatYear.text;
                 
                                
                 
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
                                                @"zipcode":cozip2,
                                                @"catagory":cohowlongworked,
                                                @"yearyouleft":coyearleft,
                                                @"userid":test,
                                                @"workplaceid":postId,
                                                
                                                
                                                
                                                };
                     
                     
                     [post1Ref setValue: nickname];
                     
                     
                     
                 } else {
                     
                     
                     
                 }
                 
                 
                 
                 
             }
            
             
             
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
               
               // There was an error logging in to this account
               
               // NSLog(@"error ");
               
               
           } else {
               
               NSDictionary *newUser = @{
                                         @"password": _passwordField.text,
                                         @"name": _usernameField.text,
                                         @"email": _emailField.text ,
                                         @"job":@" ",
                                         @"linkedin":@" ",
                                         @"linkedin_id":@"",
                                         @"phonenumber": _phonenumberField.text,
                                         @"datecreated": mylongitudeObject
                                         
                                         
                                         
                                         };
               
               [[[ref childByAppendingPath:@"users"]
                 childByAppendingPath:authData.uid] setValue:newUser];
               
               
               [alertView dismissWithClickedButtonIndex:0 animated:YES];
               
               
               [self performSegueWithIdentifier:@"RegisterSegue" sender:sender];
               
               
           }
           
           
       }];
             
             
             
         
         // User is logged in
         
     
     
     
     }];
    
    
    
    
    
    
    
    
}







- (BOOL)SignUpFireBool: (id) sender {
    
    
    
    
    if([ self.textFieldCoName.text length  ] < 3)
        
    {
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid workplace name"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
       return FALSE;
        
        
        
        
    }else if ( [ self.textFieldCoZip.text length ] < 5  ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid US zipcode"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
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
               
               
               
               
               NSString *coname = self.textFieldCoName.text;
               NSString *coname2 = [coname lowercaseString];
               
               
               NSString *cozip = self.textFieldCoZip.text;
               NSString *cozip2 = [cozip lowercaseString];
               
               
               
               NSString *cocity = self.textFieldCoCity.text;
               NSString *cocity2 = [cocity lowercaseString];
               
               
               NSString *costate = self.textFieldCoState.text;
               NSString *costate2 = [costate lowercaseString];
               
               
               
               NSString *corecommend = self.textFieldRecommend.text;
               NSString *corecommend2 = [corecommend lowercaseString];
               
               
               
               NSString *cohowlongworked = self.textFieldHowLong.text;
               
               
               NSString *coyearleft = self.textFieldWhatYear.text;
               
               
               
               
               
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
                                          @"zipcode":cozip2,
                                          @"catagory":cohowlongworked,
                                          @"yearyouleft":coyearleft,
                                          @"userid":test,
                                          @"workplaceid":postId,
                                          
                                          
                                         
                                          
                                          };
               
               
               [post1Ref setValue: nickname];
               
               
               
               
               
               
               
               
               
           }
           
           
       }];
             
             
         
         
         
         
         [self performSegueWithIdentifier:@"RegisterSegue" sender:sender];
         
         
         
         
         
         int64_t delayInSeconds = 10.0;
         dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
         dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
             [alertView dismissWithClickedButtonIndex:alertView.cancelButtonIndex animated:YES];
         });
         
         
         
         
     }];
    
    
    
    
    
    
    
    
    
    
    return TRUE;
    //
    
    
}


- (IBAction)didchZip:(id)sender {
   
    [[CLGeocoder new] geocodeAddressString:self.textFieldCoZip.text completionHandler:^(NSArray *placemarks, NSError *error) {
        if (placemarks.count) {
            CLPlacemark *placemark = placemarks.firstObject;
            
            NSString *city = placemark.locality;
            NSString *state = placemark.administrativeArea;
            
            self.textFieldCoState.text = state;
            self.textFieldCoCity.text = city;
            
                     
            
        }
    }];
    
}





- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}



- (void)attachPickerToTextField: (UITextField*) textField :(UIPickerView*) picker{
    picker.delegate = self;
    picker.dataSource = self;
    
    textField.delegate = self;
    textField.inputView = picker;
    
}





- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.picker){
        return self.pickerArray.count;
    }
    else if (pickerView == self.picker2){
        return self.picker2Array.count;
    }
    else if (pickerView == self.picker3){
        return self.picker3Array.count;
    }
    return 0;
}





-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    if (pickerView == self.picker){
        return [self.pickerArray objectAtIndex:row];
    }
    else if (pickerView == self.picker2){
        return [self.picker2Array objectAtIndex:row];
        
    }else if (pickerView == self.picker3){
        return [self.picker3Array objectAtIndex:row];
    }
    return @"???";
    
    
}




- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    if (pickerView == self.picker){
        self.textFieldWhatYear.text = [self.pickerArray objectAtIndex:row];
    }
    
    else if (pickerView == self.picker2){
        self.textFieldRecommend.text = [self.picker2Array objectAtIndex:row];
    }
    
    else if (pickerView == self.picker3){
        self.textFieldHowLong.text = [self.picker3Array objectAtIndex:row];
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
