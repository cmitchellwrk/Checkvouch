//
//  SearchJobsResultTableViewController.m
//  Checkvouch
//
//  Created by Chris Mitchell on 7/6/16.
//  Copyright © 2016 Chris Mitchell. All rights reserved.
//

#import "SearchJobsResultTableViewController.h"

@interface SearchJobsResultTableViewController ()

@end

@implementation SearchJobsResultTableViewController



@synthesize tableData;

@synthesize  tableDictionary;



@synthesize teststring1;


@synthesize teststring2;


@synthesize teststring3;


@synthesize teststring4;





- (void)configureViewTwo {
    
        
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
    
    
    
    
    
    [[[ref  queryOrderedByKey] queryEqualToValue:@"jobs"]
     
     observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
         
         
         
         NSMutableArray *_locationstwo = [[NSMutableArray alloc] init];
         
         
         
         for (FDataSnapshot* childSnap in snapshot.children) {
             
             
             if ( (  [ childSnap.value[@"catagory"] isEqualToString:self.teststring1])  &&  ([childSnap.value[@"state"] isEqualToString:self.teststring3]) )
                 
                 
             
             
             
             {
             
                 
                 
                 
             Job *newLocation = [[Job alloc] init];
             
             newLocation.catagory = childSnap.value[@"catagory"];
             newLocation.city = childSnap.value[@"city"];
             newLocation.company =   childSnap.value[@"company"];
             newLocation.descript =  childSnap.value[@"descript"];
             newLocation.jobid = childSnap.value[@"jobid"];
             newLocation.postfrom =  childSnap.value[@"postfrom"];
             newLocation.salary =  childSnap.value[@"salary"];
             newLocation.state = childSnap.value[@"state"];
             newLocation.title =  childSnap.value[@"title"];
             newLocation.type =  childSnap.value[@"type"];
             newLocation.zipcode = childSnap.value[@"zipcode"];
             
             
                         
             
             
                 
             [_locationstwo addObject:newLocation];
             
             
             
                 self.tableData = _locationstwo;
                 
                 
                 
             [self.tableView reloadData];
             
                 
                 
                 
            }
             
             
             
         }
         
        
         
         
     }];
    
    
    
    
    
    
    
    
    
}
















- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

       
    
    
    [  self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                    forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    
    
    
    self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    
    
    
    self.tableView.backgroundView = tempImageView;
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    
    
    
    
    
    
    self.tableData = [[NSMutableArray alloc] init];
    
    
    
    [self configureViewTwo];
    
    
    
    
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
  
   // return 0;
    
    return [self.tableData count];
    
    
    
    
}




- (IBAction)cancelSearchJobs:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelSearchJobs"]) {
        
        
        
    } }





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   

    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
   cell.textLabel.textColor = [UIColor whiteColor];
    
   cell.backgroundColor = [UIColor clearColor];
    
    
    
    Job* chatMessage = [ self.tableData objectAtIndex:indexPath.row];
    
  
    
    
    cell.textLabel.text =  chatMessage.title;
    
    
    
    // Configure the cell...
    
    return cell;
    
    
    
    
}







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

    
    if ([[segue identifier] isEqualToString:@"JobSearchDetail"]) {
        
    
        
        
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    
    Job *selectrowjob = [self.tableData objectAtIndex:indexPath.row];
    
        
       
    
    JobSearchDetailTableViewController *destViewController = segue.destinationViewController;
    
    destViewController.job_id = selectrowjob.jobid;
    
    destViewController.postfrom_id = selectrowjob.postfrom;
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

        
        
    }
    
    


}




@end
