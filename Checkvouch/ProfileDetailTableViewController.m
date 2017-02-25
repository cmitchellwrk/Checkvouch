//
//  ProfileDetailTableViewController.m
//  Mole
//
//  Created by Chris Mitchell on 2/15/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import "ProfileDetailTableViewController.h"
#import "Profile.h"


//#import <Parse/Parse.h>

#import <Firebase/Firebase.h>




@interface ProfileDetailTableViewController ()

//@property (nonatomic) PFUser *currentUser;


@end

@implementation ProfileDetailTableViewController



@synthesize detailItem = _detailItem;

@synthesize passwordField = _passwordField;
@synthesize usernameField = _usernameField;
@synthesize emailField = _emailField;
@synthesize phoneNumberField = _phoneNumberField;

@synthesize ageField = _ageField;
@synthesize occupationField = _occupationField;
@synthesize linkedinField = _linkedinField;





- (void)setDetailItem:(id)detailItem {
    
   
        
    
    _detailItem = detailItem;
        
        [self configureView];
    
        
  
    
    
}






- (void)configureView {
    
    if (self.detailItem && [self.detailItem isKindOfClass:[Profile class]]) {
        
        
        self.usernameField.text = [self.detailItem username];
       
        self.passwordField.text = [self.detailItem password];
        
        
        self.phoneNumberField.text = [self.detailItem phonenumber];
        self.emailField.text = [self.detailItem email];
        
        self.occupationField.text =  [self.detailItem  occupation];
        
        
        self.linkedinField.text =  [self.detailItem linkedin];    }

     
     }







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
    
    
    
    
    
    
    
    
    

    
    
}




- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self configureView];
    
  
    
    [self.tableView reloadData];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
   
    
    
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    
    return 1;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    
    return 5;
    
    
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
