//
//  MainMessagesFTableViewController.m
//  Checka
//
//  Created by Chris Mitchell on 3/3/16.
//  Copyright (c) 2016 Chris Mitchell. All rights reserved.
//

#import "MainMessagesFTableViewController.h"




#import "MainMessageUserViewController.h"


#import "MainMessageUserFViewController.h"


#import "MainMessagesUserProfileTableViewController.h"

#import "Profile.h"



@interface MainMessagesFTableViewController ()

@end



@implementation MainMessagesFTableViewController




@synthesize queryusername;



- (void)configureViewTwo {
    
    
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    if (ref.authData) {
        
        
        
        NSString *idd = ref.authData.uid;
        
       
        
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
        
        
        [[[ref  queryOrderedByKey] queryEqualToValue: idd]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             
             self.queryusername =  snapshot.value[@"name"];
             
             
             
             
             Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com" ];
             
             [[[ref2  queryOrderedByKey] queryEqualToValue:@"messages"]
              
              observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot2) {
             
                  
                                 NSMutableArray *_locationstwo = [[NSMutableArray alloc] init];
                  
                  NSMutableArray *_locationsthree = [[NSMutableArray alloc] init];
                  
                  
                  
                  
                  for (FDataSnapshot* childSnap in snapshot2.children) {
                      
                      
                    
                      if (  [childSnap.value[@"retrieveFromUserid"] isEqualToString: idd ]  ){
                          
                         
                          
                          
                          Profile *friend = [[Profile alloc] init];
                          friend.username =  childSnap.value[@"sendToUser"];
                          friend.password =   childSnap.value[@"sendToUserId"];
                          friend.email = @"<Organization>";
                          friend.phonenumber = @"<Phone Number>";
                          friend.occupation = @"<Organization>";
                          friend.linkedin = @"<Phone Number>";
                         
                          
                          
                          NSString *sendto =childSnap.value[@"sendToUser"];
                          
                          
                          
                          [_locationstwo addObject:sendto];
                          
                          [_locationsthree addObject:friend];
                          
                          
                        
                          
                          
                     
             NSOrderedSet *orderedSettwo = [NSOrderedSet orderedSetWithArray:_locationsthree];
                          
                          
                          
                          
                          self.allUsers = orderedSettwo.array;
                          
                          
                          [self.tableView reloadData];
                          
                          
                          
                          
                      }
                      
                      
                      
                      
                      
                  }
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
              }];
             
             
             
             
             
             
             
             
             
         }];
        
        
        
    } else {
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
}








- (void)viewDidLoad {
    
    
 [super viewDidLoad];
    
    
    self.tableView.allowsSelection = NO;
    
    
    
    
    [  self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                    forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    
    
    
    
    
    self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    
    
    
    
    
    self.tableView.backgroundView = tempImageView;
    
    
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    
  
    [self configureViewTwo];
    
    
    
    
    
    
    
    
    
}













- (void)didReceiveMemoryWarning {
    
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}




#pragma mark - Table view data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
//#warning Potentially incomplete method implementation.
    
    
    // Return the number of sections.
    return 1;
    
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
//#warning Incomplete method implementation.
    
    
     return self.allUsers.count;
    
   
    
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecipeCell" forIndexPath:indexPath];
    
    
    
  
    
    Profile *userprofile = [self.allUsers objectAtIndex:indexPath.row];
    
    
    
    cell.textLabel.textColor = [UIColor whiteColor];
    
    cell.backgroundColor = [UIColor clearColor];
    
    
    
    
    
    cell.textLabel.text = userprofile.username;
    
    
    
    
    
    
    return cell;
    
    
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


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    if ([[segue identifier] isEqualToString:@"MainMessageUser"]) {
        
        
        
        
        MainMessageUserFViewController *destViewController = segue.destinationViewController;
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        
        
        Profile *gg  = [self.allUsers objectAtIndex:indexPath.row];
        
        
        
        
       destViewController.messageto_username =  gg.username;
        
      
        
        
    } else if  ([[segue identifier] isEqualToString:@"MainMessageUserProfile"]) {
        
        
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        
        
        MainMessagesUserProfileTableViewController *destViewController = segue.destinationViewController;
        
        
       
        
        Profile *gg  = [self.allUsers objectAtIndex:indexPath.row];
        
        destViewController.messageusername = gg.username;
        
        destViewController.messageuserid = gg.password;
        
               
    }
    
    
    
    
    
}











@end
