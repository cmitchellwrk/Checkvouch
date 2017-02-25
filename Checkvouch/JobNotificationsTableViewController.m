//
//  JobNotificationsTableViewController.m
//  Checkvouch
//
//  Created by Chris Mitchell on 7/10/16.
//  Copyright © 2016 Chris Mitchell. All rights reserved.
//

#import "JobNotificationsTableViewController.h"

#import "JobNotifyDetailTableViewController.h"



@interface JobNotificationsTableViewController ()

@end

@implementation JobNotificationsTableViewController






@synthesize tableData;

@synthesize  tableDictionary;




- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

   
   // self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] //forKey:NSForegroundColorAttributeName];
    
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






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (void)configureViewTwo {
    
    
    
    
    
    Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/jobnotifications" ];
    
    
      NSString *idd = ref2.authData.uid;
    
  
    
    
    
    [  [[ref2 queryOrderedByChild:@"jobpostfromid"] queryEqualToValue:idd]
     
     
     observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
         
         
        
         
         
         [self.tableData addObject:snapshot.value];
         
         
         
         [self.tableView reloadData];
         
         
     }];
    
    
    
    
    
    
    
    
    
    
}






#pragma mark - Table view data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
//#warning Incomplete implementation, return the number of sections
    
    
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
//#warning Incomplete implementation, return the number of rows
    
  //  return 0;
    return [self.tableData count];
    
 
    
    
}









- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    
    
    NSDictionary* chatMessage = [ self.tableData objectAtIndex:indexPath.row];
    
    
    cell.textLabel.textColor = [UIColor whiteColor];
    
    cell.backgroundColor = [UIColor clearColor];
    
    
    
    
    
    cell.textLabel.text =  chatMessage[@"title"];
    
    
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
        
        
        
        
        NSDictionary* chatMessage = [ self.tableData objectAtIndex:indexPath.row];
        
        NSString *notifyididd = chatMessage[@"notificationspostid"];
        
        
        
        
        
        Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com" ];
        
        
        
       
        
        
        [[[ref2  queryOrderedByKey] queryEqualToValue:@"jobnotifications"]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             
             
             
             
             for (FDataSnapshot* childSnap in snapshot.children) {
                 
                 
                 
                 if (   [ childSnap.value[@"notificationspostid"] isEqualToString: notifyididd]   ){
                     
                     
                     
                     NSString *objectidd=   childSnap.value[@"notificationspostid"];
                     
                    
                     
                     
                     Firebase *ref5 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/jobnotifications" ];
                     
                     
                     Firebase *usersRef = [ref5 childByAppendingPath: objectidd];
                     
                     
                     [usersRef setValue:   NULL];
                     
                     
                     
                 }
                 
                 
                 
                 
             }
             
             
             
             //
             
         }];
        
        
        
        
        
        
        
     
        
        [self.tableData removeObjectAtIndex:indexPath.row];
        
        [tableView reloadData];
        
        
        
        
        
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        
        
        
        
        
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
    
    
    if ([[segue identifier] isEqualToString:@"JobNotifyDetail"]) {
        
        
        
        
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        
        NSDictionary *selectrowjob = [self.tableData objectAtIndex:indexPath.row];
        
        
        
        
        
        JobNotifyDetailTableViewController *destViewController = segue.destinationViewController;
        
        destViewController.jobnotifyid = selectrowjob[@"notificationspostid"];
        
        
     
        
        destViewController.jobwant_replyid = selectrowjob[@"jobwantreplyid"];
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        
        
    }
    
    
    
    
    
}


@end
