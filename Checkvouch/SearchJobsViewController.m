//
//  SearchJobsViewController.m
//  Checkvouch
//
//  Created by Chris Mitchell on 7/3/16.
//  Copyright © 2016 Chris Mitchell. All rights reserved.
//

#import "SearchJobsViewController.h"

#import "SearchJobsResultTableViewController.h"

#import "JobSearchDetailTableViewController.h"



@interface SearchJobsViewController ()


@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSArray *pickerArray;

@property (strong, nonatomic) IBOutlet UIPickerView *picker2;
@property (strong, nonatomic) NSArray *picker2Array;







@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textField2;

@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UITextField *textField4;






@end

@implementation SearchJobsViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.pickerArray  = [[NSArray alloc] initWithObjects:@"accounting", @"admin/office", @"architecture/engineering",
                         @"art/media/design", @"biotech/science", @"business/management",@"customer service", @"education", @"food/beverage/hosp",@"general labor", @"government", @"human resources",
                         @"legal/paralegal", @"manufacturing", @"marketing/pr/ad",@"medical/health", @"non-profit", @"rea; estate",@"retail/wholesale", @"sales/biz dev", @"salon/spa/fitness",@"security", @"skilled trade/ craft", @"architecture/engineering",@"technology", @"technical support", @"transportation",
                         @"tv/film/video", @"web/info design", @"writing/editing",
                         
                         nil];
    
    
    self.picker2Array  = [[NSArray alloc] initWithObjects:@"Alabama", @"Alaska", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"Florida", @"Georgia", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky", @"Louisiana", @"Maine", @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota", @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Ohio", @"Oklahoma", @"Oregon", @"Pennsylvania", @"Rhode Island", @"South Carolina", @"South Dakota", @"Tennessee", @"Texas", @"Utah", @"Vermont", @"Virginia", @"Washington", @"West Virginia", @"Wisconsin", @"Wyoming", nil];
    
    
    
    
    
    
    
    
    self.picker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    self.picker2 = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    
    
    
    
    [self attachPickerToTextField:self.textField :self.picker];
    
    
   [self attachPickerToTextField:self.textField3 :self.picker2];
    
    
    [[self navigationController].navigationBar setBarTintColor:[UIColor colorWithRed:(1.0/255.0) green:(12.0/255.0) blue:(22.0/255.0) alpha:1.0]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
    
    //add background
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"piVms8T.jpg"]];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    self.view.contentMode = UIViewContentModeScaleAspectFit;
    
    
    
    self.textField.backgroundColor = [UIColor clearColor];
    
    
    self.textField.layer.cornerRadius=8.0f;
    self.textField.layer.masksToBounds=YES;
    self.textField.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.textField.layer.borderWidth= 1.0f;
    
    
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
    
    
    
    
    
}







- (IBAction)saveJobNotification:(UIStoryboardSegue *)segue {
    
    
    
    
    if ([[segue identifier] isEqualToString:@"saveJobNotification"]) {
        
        
        
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
        
        
        
        
        
        NSString *idd = ref.authData.uid;
        
        
        
        
        JobSearchDetailTableViewController *editController = [segue sourceViewController];
        
        
        
        NSString *cojobid = editController.job_id;
       
        
        NSString *copostfrom = editController.postfrom_id;
        
        
        NSString *coreplyjobid = idd;
        
       
        NSString *cocatagory = editController.catagoryLabel.text;
        
        
        NSString *cocity = editController.cityLabel.text;
        
        NSString *cocompany = editController.companyLabel.text;
        
        NSString *cosalary = editController.salaryLabel.text;
        
        
        NSString *costate = editController.stateLabel.text;
        
        NSString *cotitle = editController.typeLabel.text;
        
        
        NSString *cotype = editController.typeLabel.text;
        
        
        NSString *cozipcode = editController.zipcodeLabel.text;
        
       
        
        Firebase *ref3 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
        
        
        
        if (ref3.authData) {
            
            
            
            
            
           
            
            Firebase *postRef = [ref childByAppendingPath: @"jobnotifications"];
            
            
            Firebase *post1Ref = [postRef childByAutoId];
            
            NSString *postId = post1Ref.key;
            
            
            NSDictionary *nickname = @{
                                       
                                       @"jobid": cojobid,
                                       @"jobpostfromid": copostfrom,
                                       @"jobwantreplyid":coreplyjobid,
                                       @"notificationspostid": postId,
                                       @"catagory": cocatagory,
                                       @"city": cocity,
                                       @"company": cocompany,
                                       @"salary": cosalary,
                                       @"state": costate,
                                       @"title": cotitle,
                                       @"type": cotype,
                                       @"zipcode": cozipcode,
                                       
                                    
                                       };
            
            
            [post1Ref setValue: nickname];
            
            
            
            
            
            
        } else {
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
}









- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    
    
    // your code goes here...
    [self.textField resignFirstResponder];
    [self.textField2 resignFirstResponder];
    [self.textField3 resignFirstResponder];
    [self.textField4 resignFirstResponder];
    
    //[self.descr resignFirstResponder];
    
}



- (void)attachPickerToTextField: (UITextField*) textField :(UIPickerView*) picker{
    picker.delegate = self;
    picker.dataSource = self;
    
    textField.delegate = self;
    textField.inputView = picker;
    
}


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
    
    return @"???";
    
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    if (pickerView == self.picker){
        self.textField.text = [self.pickerArray objectAtIndex:row];
    }
    else if (pickerView == self.picker2){
        self.textField3.text = [self.picker2Array objectAtIndex:row];
    }
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}










#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"SearchJobs"]) {
        
        
        
        
        UINavigationController *navController = [segue destinationViewController];
        SearchJobsResultTableViewController *SITViewController = (SearchJobsResultTableViewController *)([navController viewControllers][0]);
        
        
        SITViewController.teststring1 = self.textField.text;
        
        SITViewController.teststring2 = self.textField2.text;
        
        
        SITViewController.teststring3 = self.textField3.text;
        
        
        SITViewController.teststring4 = self.textField4.text;
        
               
        
        
    }
    
    
    
    
    
}


@end
