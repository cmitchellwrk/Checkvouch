//
//  OpenJobsTableViewController.m
//  Checkvouch
//
//  Created by Chris Mitchell on 7/4/16.
//  Copyright © 2016 Chris Mitchell. All rights reserved.
//

#import "OpenJobsTableViewController.h"


#import <Firebase/Firebase.h>


@interface OpenJobsTableViewController ()

@end

@implementation OpenJobsTableViewController



@synthesize tableData;

@synthesize  tableDictionary;






- (IBAction)cancelAddJobTab:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelAddJobTab"]) {
        
        
        
    } }








- (IBAction)saveJobInsert:(UIStoryboardSegue *)segue {
    

    
    if ([[segue identifier] isEqualToString:@"saveJobInsert"]) {
        
        
        EnterJobTableViewController *editController = [segue sourceViewController];
        
        NSString *catagory = editController.textField.text;
        
    
        
        NSString *cocompany = editController.textField2.text;
        NSString *cocompany2 = [cocompany lowercaseString];
        
        
        NSString *cojobtitle = editController.textField3.text;
        NSString *cojobtitle2 = [cojobtitle lowercaseString];
        
        
        
        NSString *cocity = editController.textField4.text;
        NSString *cocity2 = [cocity lowercaseString];
        
        
        
        
        NSString *costate = editController.textField5.text;
       
        
        
        NSString *cozipcode = editController.textField6.text;
       
        
        NSString *cojobtype = editController.textField7.text;
      
     
        
        NSString *cosalary = editController.textField8.text;
     
        
      
        
        
        NSString *codescript = editController.descr.text;
        
        
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users"];
        

        
        
            
            NSString *test = ref.authData.uid;
            
          
            
            Firebase *postRef = [ref childByAppendingPath: @"jobs"];
            
            
            Firebase *post1Ref = [postRef childByAutoId];
            
            NSString *postId = post1Ref.key;
            
            
            
            
            NSDictionary *nickname = @{
                                       
                                       
                                       @"catagory":catagory,
                                       @"city":cocity2,
                                       @"company":cocompany2,
                                       @"descript":codescript,
                                       @"postfrom":test,
                                       @"salary":cosalary,
                                       @"state":costate,
                                       @"title":cojobtitle2,
                                       @"type":cojobtype,
                                       @"zipcode":cozipcode,
                                       @"jobid":postId,
                                       
                                       };
            
            
            [post1Ref setValue: nickname];
        
    
        
    }

    
}






- (void)configureViewTwo {
    
    
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
   
        
    
        
        NSString *idd = ref.authData.uid;
        
        
        Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users"];
        
        
        
    
        
        [[[ref2  queryOrderedByKey] queryEqualToValue:@"jobs"]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             NSMutableArray *_locationstwo = [[NSMutableArray alloc] init];
            
             
             for (FDataSnapshot* childSnap in snapshot.children) {
                 
                 
                 if ( [childSnap.value[@"postfrom"] isEqualToString: idd] )
                     
                 {
                     
                
                     
                     
                     Job *newLocation = [[Job alloc] init];
                     
                     newLocation.catagory = childSnap.value[@"catagory"];
                     newLocation.city =  childSnap.value[@"city"];
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
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    
    
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





- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    [self configureViewTwo];
    
    [self.tableView reloadData];
    
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






- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
           }
    
 
    
    Job* myjobs = [ self.tableData objectAtIndex:indexPath.row];
    
    
    cell.textLabel.textColor = [UIColor whiteColor];
    
    cell.backgroundColor = [UIColor clearColor];
    
    
  
    
    
    cell.textLabel.text =  myjobs.title;
    
    // Configure the cell...
    
    
    
    return cell;
    
    
}





- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        
        Job* myjobs = [ self.tableData objectAtIndex:indexPath.row];
        
        
        NSString *jobid = myjobs.jobid;
        
        
        
        
        
        Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
        
        
        
        
        
        [[[ref2  queryOrderedByKey] queryEqualToValue:@"jobs"]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             
             
           
             
             
             
             for (FDataSnapshot* childSnap in snapshot.children) {
                 
                 
                 
                 if (   [ childSnap.value[@"jobid"] isEqualToString:jobid]   ){
                     
                     
                     
                     NSString *objectidd=   childSnap.value[@"jobid"];
                     
                   
                     
                     
                     Firebase *ref5 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users/jobs" ];
                     
                     
                     Firebase *usersRef = [ref5 childByAppendingPath: objectidd];
                     
                     
                     
                     [usersRef setValue:   NULL];
                     
                     
                     
                 }
                 
                 
                 
                 
             }
             
             
             // snapshot.key
             
             //
             
         }];
        
        
        
        
        
        
        
       
        
        [self.tableData removeObjectAtIndex:indexPath.row];
        
        [tableView reloadData];
        
        
        
        
        
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        
        
        
        
    }
    
    
    
    
    
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
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    if ([[segue identifier] isEqualToString:@"OpenJobDetail"]) {
        
        
        
        
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        
        Job *selectrowjob = [self.tableData objectAtIndex:indexPath.row];
        
        
        
        
        OpenJobsDetailTableViewController *destViewController = segue.destinationViewController;
        
        
        destViewController.job_id = selectrowjob.jobid;
        
        
        
               // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
}


@end
