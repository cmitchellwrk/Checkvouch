//
//  CoPFTableViewController.m
//  Checka
//
//  Created by Chris Mitchell on 2/12/16.
//  Copyright (c) 2016 Chris Mitchell. All rights reserved.
//

#import "CoPFTableViewController.h"



@interface CoPFTableViewController ()

@end




@implementation CoPFTableViewController




@synthesize tableData;

@synthesize  tableDictionary;





- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [[self navigationController].navigationBar setBarTintColor:[UIColor colorWithRed:(1.0/255.0) green:(12.0/255.0) blue:(22.0/255.0) alpha:1.0]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    
    
    self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    
    
    self.tableView.backgroundView = tempImageView;
    
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    
    
    self.tableData = [[NSMutableArray alloc] init];
    
    
    
    
    
        
    
    
    [self configureViewTwo];
    
    
    
    
    
    
    
    
    
}




- (IBAction)cancelAddCoo:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelAddCo"]) {
        
        
        
    } }






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (void)configureViewTwo {
    
    
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    if (ref.authData) {
        
        
        
        NSString *idd = ref.authData.uid;
        
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users/workplaces" ];
        
    
        
        
        
          [  [[ref queryOrderedByChild:@"userid"] queryEqualToValue: idd]
        
        
        
        
           observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
        
        
               
             
               [self.tableData addObject:snapshot.value];
               
               
               
               
               
               // Reload the table view so the new message will show up.
               [self.tableView reloadData];
               
             
             
                        
            
             
             
         }];
        
        
        
        
        
        
    } else {
        
        
        
        [self performSegueWithIdentifier:@"CancelLogout" sender:self];
        
        
       
    }
    
    
    
}








- (IBAction)saveinsert:(UIStoryboardSegue *)segue {
    
    
    
    
    if ([[segue identifier] isEqualToString:@"saveCoInsert"]) {
        
        
        
        
        
        
        
        AddCoTableViewController *editController = [segue sourceViewController];
        
        
        
        NSString *coname = editController.nameField.text;
        NSString *coname2 = [coname lowercaseString];
        
        NSString *cocity = editController.cityField.text;
        NSString *cocity2 = [cocity lowercaseString];
        
        NSString *costate = editController.stateField.text;
         NSString *costate2 = [costate lowercaseString];
        
        NSString *cozipcode = editController.zipcodeField.text;
        
        
        NSString *corecommend = editController.recommendField.text;
         NSString *corecommend2 = [corecommend lowercaseString];
        
        NSString *howlongworked = editController.textFieldHowLong.text;
     
        
        
        NSString *whatyear = editController.textFieldWhatYear.text;
       
        
        
      
        
        
        
        
        
        
        NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
        
       
        [dateFormat1 setDateFormat:@"MM-dd-yyyy"];
        
        
        
        
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users"];
        
        
        
        if (ref.authData) {
            
            
            
            
              NSString *test = ref.authData.uid;
            
            
            
            
            
            
                      
            
            
            
            
         
            
            Firebase *postRef = [ref childByAppendingPath: @"workplaces"];
           
            
            Firebase *post1Ref = [postRef childByAutoId];
           
            NSString *postId = post1Ref.key;
            
            
            NSDictionary *nickname = @{
                                       
                                       @"name": coname2,
                                       @"city": cocity2,
                                       @"recommend": corecommend2,
                                       @"state": costate2,
                                       @"zipcode":cozipcode,
                                       @"catagory":howlongworked,
                                       @"yearyouleft":whatyear,
                                       @"userid":test,
                                       @"workplaceid":postId,
                                       
                                       
                                       
                                       };
            
            
            [post1Ref setValue: nickname];
            
            
            
            
            
            
        } else {
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    


}









#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    

    return 1;
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

   
    return [self.tableData count];
    
    
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    
    
    NSDictionary* chatMessage = [ self.tableData objectAtIndex:indexPath.row];
    

    
    cell.textLabel.text =  chatMessage[@"name"];
    
    
    
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
        
        NSString *workplaceidd = chatMessage[@"workplaceid"];
        
        
        
        
        
        Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
        

        
        
        [[[ref2  queryOrderedByKey] queryEqualToValue:@"workplaces"]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             
             
             
             
             for (FDataSnapshot* childSnap in snapshot.children) {
                 
                 
                 
                 if (   [ childSnap.value[@"workplaceid"] isEqualToString: workplaceidd]   ){
                     
                     
                     
                     NSString *objectidd=   childSnap.value[@"workplaceid"];
                     
                     
                     Firebase *ref5 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users/workplaces" ];
                     
                     
                     Firebase *usersRef = [ref5 childByAppendingPath: objectidd];
                     
                     
                     [usersRef setValue:   NULL];
                     
                     
                     
                     
                 }
                 
                 
                 
                 
             }
             
             
             
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
    
    
    if ([[segue identifier] isEqualToString:@"companyDetail"]) {
        
        
        UINavigationController *navController = [segue destinationViewController];
        
        CoDetailTableViewController *SITViewController = (CoDetailTableViewController *)([navController viewControllers][0]);
        
        
        
        
        
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSDictionary *object = [self.tableData objectAtIndex:indexPath.row];
        
        
        
        
        
        Company *newLocation = [[Company alloc] init];
        
        newLocation.compidd = object[@"workplaceid"];
        
        
        newLocation.idd =  object[@"userid"];
        
        
        
        newLocation.name = object[@"name"];
        
        
        newLocation.statte = object[@"state"];
        
        
        newLocation.city = object[@"city"];
        
        
        newLocation.zipcode = object[@"zipcode"];
        
        
        newLocation.recommend =object[@"recommend"];
        
        
        
        

        newLocation.coOne = object[@"catagory"];
        
        
        
              
        
        
        newLocation.coTwo = object[@"yearyouleft"];
        
        
        
        
        
        
        SITViewController.detailItem = newLocation;
        
        
        
    }
    
    
    
    
    
    
    
}


@end
