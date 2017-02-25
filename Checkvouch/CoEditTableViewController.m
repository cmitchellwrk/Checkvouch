//
//  CoEditTableViewController.m
//  Mole
//
//  Created by Chris Mitchell on 3/15/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import "CoEditTableViewController.h"

#import "Company.h"



@interface CoEditTableViewController ()




@property NSDateFormatter *dateFormatter;



@property NSDateFormatter *dateFormatterTwo;


@property NSDate *selectedBirthday;


@property (weak, nonatomic) NSString *zip_value;



@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSArray *pickerArray;



@property (strong, nonatomic) IBOutlet UIPickerView *picker2;
@property (strong, nonatomic) NSArray *picker2Array;


@property (strong, nonatomic) IBOutlet UIPickerView *picker3;
@property (strong, nonatomic) NSArray *picker3Array;




@property (weak, nonatomic) IBOutlet UITextField *textFieldHowLong;
@property (weak, nonatomic) IBOutlet UITextField *textFieldWhatYear;



@end






@implementation CoEditTableViewController


@synthesize detailItem = _detailItem;


@synthesize nameField = _nameField;
@synthesize cityField = _cityField;
@synthesize stateField = _stateField;
@synthesize zipcodeField = _zipcodeField;
@synthesize recommendField = _recommendField;

@synthesize fromField = _fromField;
@synthesize toField = _toField;


@synthesize ovalField = _ovalField;





- (void)setDetailItem:(id)detailItem {
    
    
    _detailItem = detailItem;
    
    [self configureView];
    
    
    
}









- (IBAction)saveButton:(id)sender {
    
    
    if([self.nameField.text length] < 3){
        
        
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid company name"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
        //Step 1: Create a UIAlertController
        UIAlertController *myAlertController2 = [UIAlertController alertControllerWithTitle:@"Sorry"
                                                                                    message: @"Please enter a valid 1 company name."
                                                                             preferredStyle:UIAlertControllerStyleAlert                   ];
        
        //Step 2: Create a UIAlertAction that can be added to the alert
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 //Do some thing here, eg dismiss the alertwindow
                                 [myAlertController2 dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        
        //Step 3: Add the UIAlertAction ok that we just created to our AlertController
        [myAlertController2 addAction: ok];
        
        //Step 4: Present the alert to the user
       // [self presentViewController:myAlertController2 animated:YES completion:nil];
        
        
        
        
        
        
     
        
        
        
        
    }else if ( [self.cityField.text length] < 4 ){
        
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid city"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
       
        //Step 1: Create a UIAlertController
        UIAlertController *myAlertController2 = [UIAlertController alertControllerWithTitle:@"Sorry"
                                                                                    message: @"Please enter a valid city."
                                                                             preferredStyle:UIAlertControllerStyleAlert                   ];
        
        //Step 2: Create a UIAlertAction that can be added to the alert
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 //Do some thing here, eg dismiss the alertwindow
                                 [myAlertController2 dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        
        //Step 3: Add the UIAlertAction ok that we just created to our AlertController
        [myAlertController2 addAction: ok];
        
        //Step 4: Present the alert to the user
       // [self presentViewController:myAlertController2 animated:YES completion:nil];
        
        
        
        
        
        
        
    }else if ( [ self.stateField.text length] < 2  ){
        
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid state"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
        //Step 1: Create a UIAlertController
        UIAlertController *myAlertController2 = [UIAlertController alertControllerWithTitle:@"Sorry"
                                                                                    message: @"Please enter a valid state."
                                                                             preferredStyle:UIAlertControllerStyleAlert                   ];
        
        //Step 2: Create a UIAlertAction that can be added to the alert
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 //Do some thing here, eg dismiss the alertwindow
                                 [myAlertController2 dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        
        //Step 3: Add the UIAlertAction ok that we just created to our AlertController
        [myAlertController2 addAction: ok];
        
        //Step 4: Present the alert to the user
       // [self presentViewController:myAlertController2 animated:YES completion:nil];
        
        
        
        
        
        
        
        
    }else if ( [ self.zipcodeField.text length] < 5  ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid US zipcode"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
        //Step 1: Create a UIAlertController
        UIAlertController *myAlertController2 = [UIAlertController alertControllerWithTitle:@"Sorry"
                                                                                    message: @"Please enter a valif US zipcode."
                                                                             preferredStyle:UIAlertControllerStyleAlert                   ];
        
        //Step 2: Create a UIAlertAction that can be added to the alert
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 //Do some thing here, eg dismiss the alertwindow
                                 [myAlertController2 dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        
        //Step 3: Add the UIAlertAction ok that we just created to our AlertController
        [myAlertController2 addAction: ok];
        
        //Step 4: Present the alert to the user
       // [self presentViewController:myAlertController2 animated:YES completion:nil];
        
        
        
        
        
        
        
        
        
    }else if ( [ self.recommendField.text length] < 1  ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter yes or no for this one"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
        //Step 1: Create a UIAlertController
        UIAlertController *myAlertController2 = [UIAlertController alertControllerWithTitle:@"Sorry"
                                                                                    message: @"Please enter the recomendation."
                                                                             preferredStyle:UIAlertControllerStyleAlert                   ];
        
        //Step 2: Create a UIAlertAction that can be added to the alert
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 //Do some thing here, eg dismiss the alertwindow
                                 [myAlertController2 dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        
        //Step 3: Add the UIAlertAction ok that we just created to our AlertController
        [myAlertController2 addAction: ok];
        
        //Step 4: Present the alert to the user
       // [self presentViewController:myAlertController2 animated:YES completion:nil];
        
        
        
        
        
     
        
        
        
    } else{
        
        
        [self performSegueWithIdentifier:@"saveCoEditInput" sender:self];
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
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
        self.fromField.text = [self.pickerArray objectAtIndex:row];
    }
    
    else if (pickerView == self.picker2){
        self.recommendField.text = [self.picker2Array objectAtIndex:row];
    }
    
    else if (pickerView == self.picker3){
        self.toField.text = [self.picker3Array objectAtIndex:row];
    }
    
    
}





- (void)configureView {
    
    if (self.detailItem && [self.detailItem isKindOfClass:[Company class]]) {
        
        self.nameField.text = [self.detailItem name];
      
        self.ovalField.text = [self.detailItem idd];
        
        self.cityField.text = [self.detailItem city];
        
        self.stateField.text = [self.detailItem statte];
        
        
        
        
        
       
        
        int cost2 =[[self.detailItem zipcode]intValue];
        
        
          self.zipcodeField.text  =    [NSString stringWithFormat:@"%d",cost2];
        
        
        
     
        
        
                
        
        self.recommendField.text = [self.detailItem recommend];
        
        self.fromField.text = [self.detailItem coOne];
        self.toField.text = [self.detailItem coTwo];
        
        
      
        
    } }








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
    
    self.dateLabel.text = [self.dateFormatter stringFromDate:defaultDate];
    self.dateLabel.textColor = [ UIColor whiteColor];
    
    self.dateLabelTo.text = [self.dateFormatter stringFromDate:defaultDate];
    self.dateLabelTo.textColor = [ UIColor whiteColor];
    
    
    
    
    
    
        
    
}







- (IBAction)datePickerChanged:(UIDatePicker *)sender

{
    
    
self.dateLabel.text =  [self.dateFormatter stringFromDate:sender.date];
    
     self.dateone = sender.date;
    
      
    
    
}


- (IBAction)datePickerChangedTwo:(UIDatePicker *)sender

{
    
    
    self.dateLabelTo.text =  [self.dateFormatter stringFromDate:sender.date];
    
    self.datetwo = sender.date;
    
    
    
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    self.tableView.allowsSelection = NO;
    
    
    [[self navigationController].navigationBar setBarTintColor:[UIColor colorWithRed:(1.0/255.0) green:(12.0/255.0) blue:(22.0/255.0) alpha:1.0]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
       self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    
       self.tableView.backgroundView = tempImageView;
  
    
    
    
    self.picker3Array  = [[NSArray alloc] initWithObjects:@"1990", @"1991", @"1992", @"1993", @"1994", @"1995", @"1996", @"1997", @"1998", @"1999", @"2000", @"2001", @"2002", @"2003", @"2004", @"2005", @"2006", @"2007", @"2008", @"2009", @"2010", @"2011", @"2012", @"2013",@"2014", @"2015",@"2016", nil];                          
                          
    self.picker2Array  = [[NSArray alloc] initWithObjects: @"Yes", @"No", @"Contact Me", nil];
    
    
    self.pickerArray  = [[NSArray alloc] initWithObjects:@"Buildings & land rights(e.g.offices)", @"Fixed equipment & software(e.g.computers)", @"Light factory equipment(e.g. lift trucks)", @"Office equipment(e.g. desks)", @"Office supplies(e.g. paper)", @"Maintenance & repair items(e.g. paint)", @"Maintenance & repair services(e.g. computer repair)", @"Business advisory services(e.g. legal, consulting)",  nil];
    
    
    
    
    self.picker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    self.picker2 = [[UIPickerView alloc] initWithFrame:CGRectZero];
    self.picker3 = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    
    
    [self attachPickerToTextField:self.fromField :self.picker];
    [self attachPickerToTextField:self.recommendField :self.picker2];
    [self attachPickerToTextField:self.toField  :self.picker3];
    
    
    
    
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
    
    
    self.fromField.backgroundColor = [UIColor clearColor];
    
    
    self.fromField.layer.cornerRadius=8.0f;
    self.fromField.layer.masksToBounds=YES;
    self.fromField.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.fromField.layer.borderWidth= 1.0f;
    
    
    self.toField.backgroundColor = [UIColor clearColor];
    
    
    self.toField.layer.cornerRadius=8.0f;
    self.toField.layer.masksToBounds=YES;
    self.toField.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.toField.layer.borderWidth= 1.0f;
    
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    
  
    
   
    
    
    
    
    [self configureView];
    
    
    
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.tableView addGestureRecognizer:gestureRecognizer];
    
    
    
    
}




- (void)hideKeyboard
{
    [self.view endEditing:YES];
}



    
    
    
    
    


- (IBAction)didchZip:(id)sender {
    
    [[CLGeocoder new] geocodeAddressString:self.zipcodeField.text  completionHandler:^(NSArray *placemarks, NSError *error) {
        if (placemarks.count) {
            CLPlacemark *placemark = placemarks.firstObject;
            
            NSString *city = placemark.locality;
            NSString *state = placemark.administrativeArea;
            
            self.stateField.text = state;
            self.cityField.text = city;
            
            
            
            
        }
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source






- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    
    
    
    
    return 1;
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
       
    return 9;
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
