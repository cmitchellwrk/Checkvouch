//
//  OpenJobsDetailTableViewController.m
//  Checkvouch
//
//  Created by Chris Mitchell on 7/31/16.
//  Copyright © 2016 Chris Mitchell. All rights reserved.
//

#import "OpenJobsDetailTableViewController.h"

@interface OpenJobsDetailTableViewController ()

@end

@implementation OpenJobsDetailTableViewController



@synthesize catagoryLabel = _catagoryLabel;
@synthesize companyLabel = _companyLabel;
@synthesize stateLabel = _stateLabel;
@synthesize cityLabel = _cityLabel;

@synthesize zipcodeLabel = _zipcodeLabel;
@synthesize typeLabel = _typeLabel;
@synthesize salaryLabel = _salaryLabel;


@synthesize descriptLabelTwo = _descriptLabelTwo;


@synthesize  postfrom_id;
@synthesize   job_id;






-(void)pull_Companies_Three
{
    
    
    
    Firebase *ref4 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    if (ref4.authData) {
        
      ;
        
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users/jobs" ];
        
        
        [[[ref  queryOrderedByKey] queryEqualToValue: job_id]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             
             _catagoryLabel.text =  snapshot.value[@"catagory"];
             
             _titleLabel.text = snapshot.value[@"title"];
             
             
             _companyLabel.text = snapshot.value[@"company"];
             
             _stateLabel.text = snapshot.value[@"state"];
             
             _cityLabel.text =  snapshot.value[@"city"];
             
             _zipcodeLabel.text = snapshot.value[@"zipcode"];
             
             
             _typeLabel.text = snapshot.value[@"type"];
             
             _salaryLabel.text = snapshot.value[@"salary"];
             
          
             
             _descriptLabelTwo.text =snapshot.value[@"descript"];
             
             
             
             
             
             
         }];
        
        
        
        
        
        
               
        
        
        
        
        
    } else {
        
        
        
        
        
    }
    
    
    
    
}





- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.allowsSelection = NO;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    
    
    self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    
    
    
    self.tableView.backgroundView = tempImageView;
    
    
    self.view.backgroundColor = [UIColor clearColor];
    
    
    
    
    
    [[self navigationController].navigationBar setTintColor:[UIColor colorWithRed:(245.0/255.0) green:(30.0/255.0) blue:(119.0/255.0) alpha:1.0]];
    
    
    [  self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                    forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    
    

    
        
    
    [self pull_Companies_Three];
    
    
    
    
    
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
