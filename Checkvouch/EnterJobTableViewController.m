//
//  EnterJobTableViewController.m
//  Checkvouch
//
//  Created by Chris Mitchell on 7/3/16.
//  Copyright © 2016 Chris Mitchell. All rights reserved.
//

#import "EnterJobTableViewController.h"

@interface EnterJobTableViewController ()

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSArray *pickerArray;

@property (strong, nonatomic) IBOutlet UIPickerView *picker2;
@property (strong, nonatomic) NSArray *picker2Array;


@property (strong, nonatomic) IBOutlet UIPickerView *picker3;
@property (strong, nonatomic) NSArray *picker3Array;

@property (strong, nonatomic) IBOutlet UIPickerView *picker4;
@property (strong, nonatomic) NSArray *picker4Array;


@property (strong, nonatomic) IBOutlet UIPickerView *picker5;
@property (strong, nonatomic) NSArray *picker5Array;







@end

@implementation EnterJobTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
    self.textField.backgroundColor = [UIColor clearColor];
    
    
    self.textField.layer.cornerRadius=8.0f;
    self.textField.layer.masksToBounds=YES;
    self.textField.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textField.layer.borderWidth= 1.0f;
    
    
    self.textField1.backgroundColor = [UIColor clearColor];
    
    
    self.textField1.layer.cornerRadius=8.0f;
    self.textField1.layer.masksToBounds=YES;
    self.textField1.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textField1.layer.borderWidth= 1.0f;
    
    
    self.textField2.backgroundColor = [UIColor clearColor];
    
    
    self.textField2.layer.cornerRadius=8.0f;
    self.textField2.layer.masksToBounds=YES;
    self.textField2.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textField2.layer.borderWidth= 1.0f;
    
    
    self.textField3.backgroundColor = [UIColor clearColor];
    
    
    self.textField3.layer.cornerRadius=8.0f;
    self.textField3.layer.masksToBounds=YES;
    self.textField3.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textField3.layer.borderWidth= 1.0f;
    
    
    
    self.textField4.backgroundColor = [UIColor clearColor];
    
    
    self.textField4.layer.cornerRadius=8.0f;
    self.textField4.layer.masksToBounds=YES;
    self.textField4.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textField4.layer.borderWidth= 1.0f;
    
    
    
    self.textField5.backgroundColor = [UIColor clearColor];
    
    
    self.textField5.layer.cornerRadius=8.0f;
    self.textField5.layer.masksToBounds=YES;
    self.textField5.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textField5.layer.borderWidth= 1.0f;
    
    
    self.textField6.backgroundColor = [UIColor clearColor];
    
    
    self.textField6.layer.cornerRadius=8.0f;
    self.textField6.layer.masksToBounds=YES;
    self.textField6.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textField6.layer.borderWidth= 1.0f;
    
    
    
    self.textField7.backgroundColor = [UIColor clearColor];
    
    
    self.textField7.layer.cornerRadius=8.0f;
    self.textField7.layer.masksToBounds=YES;
    self.textField7.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textField7.layer.borderWidth= 1.0f;
    
    
    self.textField8.backgroundColor = [UIColor clearColor];
    
    
    self.textField8.layer.cornerRadius=8.0f;
    self.textField8.layer.masksToBounds=YES;
    self.textField8.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textField8.layer.borderWidth= 1.0f;
    
    
    self.descr.backgroundColor = [UIColor clearColor];
    
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    
    
    self.tableView.allowsSelection = NO;
    
    
    self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    
    
    
    self.tableView.backgroundView = tempImageView;
    
    self.view.backgroundColor = [UIColor clearColor];
    
    
    
    [[self navigationController].navigationBar setBarTintColor:[UIColor colorWithRed:(1.0/255.0) green:(12.0/255.0) blue:(22.0/255.0) alpha:1.0]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    
    
    
    
    self.pickerArray  = [[NSArray alloc] initWithObjects:@"accounting", @"admin/office", @"architecture/engineering",
                         @"art/media/design", @"biotech/science", @"business/management",@"customer service", @"education", @"food/beverage/hosp",@"general labor", @"government", @"human resources",
                         @"legal/paralegal", @"manufacturing", @"marketing/pr/ad",@"medical/health", @"non-profit", @"rea; estate",@"retail/wholesale", @"sales/biz dev", @"salon/spa/fitness",@"security", @"skilled trade/ craft", @"architecture/engineering",@"technology", @"technical support", @"transportation",
                         @"tv/film/video", @"web/info design", @"writing/editing",
                         
                         nil];
    
    
    self.picker2Array  = [[NSArray alloc] initWithObjects:@"Alabama", @"Alaska", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"Florida", @"Georgia", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky", @"Louisiana", @"Maine", @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota", @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Ohio", @"Oklahoma", @"Oregon", @"Pennsylvania", @"Rhode Island", @"South Carolina", @"South Dakota", @"Tennessee", @"Texas", @"Utah", @"Vermont", @"Virginia", @"Washington", @"West Virginia", @"Wisconsin", @"Wyoming", nil];
    
    
                          
                          
    self.picker3Array  = [[NSArray alloc] initWithObjects:@"13-15", @"16-19", @"20-29", @"30-39", @"40-49", @"50-59", @"60-69", @"70-79", @"80-89", @"90-99", @"100-110", @"over 110", nil];
    
    
    self.picker4Array  = [[NSArray alloc] initWithObjects: @"Full-Time", @"Part-Time", @"Contract", nil];
    
    
    
    self.picker5Array  = [[NSArray alloc] initWithObjects:@"$30K-$35K/year", @"$35K-$40K/year", @"40K-$45K/year", @"45K-$50K/year", @"50K-$55K/year",@"55K-$60K/year",@"60K-$65K/year", @"65K-$70K/year", @"70K-$75K/year", @"75K-$80K/year", @"80K-$85K/year", @"85K-$90K/year", @"90K-$95K/year", @"95K-$100K/year", @"100K-$105K/year", @"105K-$110K/year", @"110K-$115K/year", @"115K-$120K/year" , @"120K-$125K/year", @"125K-$130K/year", @"130K-$135K/year" , @"135K-$140K/year", @"140K-$145K/year", @"145K-$150K/year", @"150K-$155K/year", @"155K-$160K/year", @"160K-$165K/year", @"165K-$170K/year", @"170K-$175K/year", @"175K-$180K/year", @"180K-$185K/year", @"185K-$190K/year",@"190K-$195K/year" , @"195K-$200K/year" , @"over $200K/year", nil];
    
    
    
    
    
    self.picker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    self.picker2 = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
  
    
    self.picker4 = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    self.picker5 = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    
    
    
    
    [self attachPickerToTextField:self.textField :self.picker];
    
    
    [self attachPickerToTextField:self.textField5 :self.picker2];
    
    
  
    
    
    [self attachPickerToTextField:self.textField7 :self.picker4];
    
    [self attachPickerToTextField:self.textField8 :self.picker5];
    

    
    
    
    self.tableView.allowsSelection = NO;
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
    
}







- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    
    
    // your code goes here...
    [self.textField resignFirstResponder];
    [self.textField2 resignFirstResponder];
    [self.textField3 resignFirstResponder];
    [self.textField4 resignFirstResponder];
    [self.textField5 resignFirstResponder];
    [self.textField6 resignFirstResponder];
    [self.textField7 resignFirstResponder];
    [self.textField8 resignFirstResponder];
    
    [self.descr resignFirstResponder];
    
}






- (void)attachPickerToTextField: (UITextField*) textField :(UIPickerView*) picker{
    picker.delegate = self;
    picker.dataSource = self;
    
    textField.delegate = self;
    textField.inputView = picker;
    
}







#pragma mark - Keyboard delegate stuff



// let tapping on the background (off the input field) close the thing
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.textField resignFirstResponder];
    [self.textField2 resignFirstResponder];
    
}






- (IBAction)saveButton:(id)sender {
    
    
    
    
    
       
    
    if([ self.textField2.text length] ==0)
        
    {
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid  company name"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
        
        
    }else if ( [ self.textField3.text length] ==0 ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid Job Title"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
       
        
        
        
    }else if ( [ self.textField4.text length] == 0  ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid US city"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
       
        
        
    }else if ( [ self.textField5.text length] == 0  ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid us state"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
      
        
        
    }else if ([self.textField6.text length] == 0 ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid us zipcode"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
        
        
    }else if ([self.textField7.text length] == 0 ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid job type"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
        
        
    }else if ([self.textField8.text length] == 0 ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a  salary"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
       
        
        
    }else if ([self.textField8.text length] == 0 ){
        
        UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid catagory"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [AV show];
        
        
        
    }else{
        
        
        Firebase *ref5 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
        
        
        
        
        
        
        NSString *idd = ref5.authData.uid;
        
        
        Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
        
        
        [[[ref2  queryOrderedByKey] queryEqualToValue: idd]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             
             
             
             NSString * linkedin_val =  snapshot.value[@"linkedin_id"];
             
             
             
             if ( linkedin_val.length == 0 ){
                 
                 
                 
                 [self performSegueWithIdentifier:@"EnterJobToLinkedin" sender:self];
                 
               
                 
                 
             } else{
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 [self performSegueWithIdentifier:@"saveJobInsert" sender:self];
                 
                 
             }
             
             
             
             
         }];
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
       
    
}






- (IBAction)cancelJobTabs:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelFirstViewJobTabSave"]) {
        
        
        
        
        
    } }








#pragma mark - Picker delegate stuff

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}





- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.picker){
        return self.pickerArray.count;
    }
    else if (pickerView == self.picker2){
        return self.picker2Array.count;
    }
    else if (pickerView == self.picker4){
        return self.picker4Array.count;
    }
    else if (pickerView == self.picker5){
        return self.picker5Array.count;
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
    }
    else if (pickerView == self.picker4){
        return [self.picker4Array objectAtIndex:row];
    }
    else if (pickerView == self.picker5){
        return [self.picker5Array objectAtIndex:row];
    }
    
    return @"???";
    
    
}






- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    if (pickerView == self.picker){
        self.textField.text = [self.pickerArray objectAtIndex:row];
    }
    else if (pickerView == self.picker2){
        self.textField5.text = [self.picker2Array objectAtIndex:row];
    }
    else if (pickerView == self.picker4){
        self.textField7.text = [self.picker4Array objectAtIndex:row];
    }
    else if (pickerView == self.picker5){
        self.textField8.text = [self.picker5Array objectAtIndex:row];
    }
    
    
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source






- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
// #warning Incomplete implementation, return the number of sections
    
    
    return 1;
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    
    
    return 10;
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
