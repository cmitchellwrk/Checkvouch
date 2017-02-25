//
//  SearchMasFTableViewController.m
//  Checka
//
//  Created by Chris Mitchell on 2/20/16.
//  Copyright (c) 2016 Chris Mitchell. All rights reserved.
//

#import "SearchMasFTableViewController.h"




#import  "Company.h"

#import "SearchFilterTableViewController.h"

#import "SearchCompTableViewController.h"

#import <StoreKit/StoreKit.h>

#import <Foundation/Foundation.h>



@interface SearchMasFTableViewController ()<DTEditDelegate,  DTEditDelegateThree>


@end



@implementation SearchMasFTableViewController




@synthesize tableData;



@synthesize  tableDictionary;

@synthesize comp_name;
@synthesize  comp_zip;

@synthesize  comp_datefrom;
@synthesize  comp_dateto;

@synthesize  comp_datefrom_two;
@synthesize  comp_dateto_two;

@synthesize lastview;

@synthesize paidornot;




- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    
    
   
    
    [  self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                    forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    
    
    
    self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    
    
    
    self.tableView.backgroundView = tempImageView;
    
      
    
    self.view.backgroundColor = [UIColor clearColor];
    
   
    
    comp_name = @"";
    comp_zip = @"";
    
    
    comp_datefrom_two = nil;
    
    comp_dateto_two = nil;
    

    
    
    
    
}











- (void)configureViewTwo {
    
    
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    if (ref.authData) {
        
        
        
        Firebase *ref22 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
        
        
        [[[ref22  queryOrderedByKey] queryEqualToValue: ref.authData.uid]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
            
             
             
             self.lastview   = snapshot.value[@"lastview"];
             
             self.paidornot = snapshot.value[@"paidornot"];
             
                          
             
             
             
             
         }];
        
        
        
        
        
        if( (comp_name.length !=0) && (comp_zip.length !=0) && (comp_datefrom_two == nil) && (comp_dateto_two==nil )) {
            
            
            Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users/workplaces" ];
            
            
           [  [[ref2 queryOrderedByChild:@"name"] queryEqualToValue:comp_name]
             
            
             observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
                 
                 
                 
                 
                 
                         
                 
                         
                 
                 
                 
                 
              
                 
                 [self.tableData addObject:snapshot.value];
                 
                 
            
                 
                 
                 
                 
                 
             }];
            
            
            
            
            
            
            
            
            
        }else  {
            
            
           
            
         
            
            
            
            Firebase *ref3 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users/workplaces" ];
            
            
            [ref3 observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
                
                
                
                
                
                
                
                
                
                
                [self.tableData addObject:snapshot.value];
                
                
                
            }];
            
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
         } else {
        
        
        
            
        
    }
    
    
    
    
    
    
    
    
}






















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(void)returnToHomeAfterSavingData:(NSString *)infoString ZipandName:(NSString*) infostringtwo{
    
    
    
    
    comp_name= infoString;
    comp_zip = infostringtwo;
    
  
    
}






-(void)returnToHomeAfterSavingDataThree:(NSDate *)infoString Two:(NSDate*)infostringtwo{
    
    
    
    
    comp_datefrom_two = infoString;
    comp_dateto_two = infostringtwo;
    
    
    
    
}



- (void)viewDidDisappear:(BOOL)animated
{
    
    [super viewDidDisappear:animated];
    
   
    
      [self.tableData removeAllObjects];
    
    
    
    
    
}





- (void)viewWillAppear:(BOOL)animated {
    
   
    
    self.tableData = [[NSMutableArray alloc] init];
    
     [self configureViewTwo];
    
   
    [self.tableView reloadData];
    
    
    
}









- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    
    [  self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                    forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    
    
    
    self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    
    
    
    self.tableView.backgroundView = tempImageView;
    
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    
    
   
    
     [self configureViewTwo];
    
    
    
    
  
    
    
    
   [self.tableView reloadData];
    
    
    
    
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
    
    cell.textLabel.textColor = [UIColor whiteColor];
    
    cell.backgroundColor = [UIColor clearColor];
    
    
    
     NSDictionary* chatMessage = [ self.tableData objectAtIndex:indexPath.row];
    
    
    cell.textLabel.text =  chatMessage[@"name"];
    
    
    // Configure the cell...
    
    return cell;
    
    
    
    
    
    
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
 
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    
    
    [self performSegueWithIdentifier:@"GoToDetailSegue" sender:cell];
    
    
    
        
    
    
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



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
    if ([[segue identifier] isEqualToString:@"SearchFilter"]) {
        
        
        
        SearchFilterTableViewController *destViewController = segue.destinationViewController;
        
        
        
        destViewController.delegate = self;
        
        
        destViewController.delegatethree = self;
        
        [[segue destinationViewController] setDelegate:self];
        
        
        
        
    } else   if ([[segue identifier] isEqualToString:@"GoToDetailSegue"]) {
        
        
        
        UserDetailMessageTableViewController *destViewController = segue.destinationViewController;
        
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        
        NSDictionary *object = [self.tableData objectAtIndex:indexPath.row];
        
        
        
        
        
           destViewController.comp_id = object[@"workplaceid"];
        
        
           destViewController.comp_userid =  object[@"userid"];
        
    
        
        
        
        
        
    }
    
    
    
    
    
}






@end
