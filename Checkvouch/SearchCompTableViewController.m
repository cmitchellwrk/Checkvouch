//
//  SearchCompTableViewController.m
//  Mole
//
//  Created by Chris Mitchell on 4/5/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import "SearchCompTableViewController.h"


@interface SearchCompTableViewController (){
    
    
       NSIndexPath *selectedIndex;
    
    
   
    
}


@end

@implementation SearchCompTableViewController


@synthesize teststring2;




@synthesize tableData;

@synthesize collation;

@synthesize outerArray;

@synthesize indexTitlesArray;

@synthesize arraytwo;











#pragma mark - Table view methods

-(void)configureSectionData {
    
    NSUInteger sectionTitlesCount = [collation.sectionTitles count];
    
    self.outerArray = [NSMutableArray arrayWithCapacity:sectionTitlesCount];
    
    for (NSUInteger index = 0; index < sectionTitlesCount; index++) {
        
        NSMutableArray *array = [NSMutableArray array];
        
        [self.outerArray addObject:array];
        
    }
    
    
    
     self.tableDataThird = [[NSMutableArray alloc] init];
    
    Company *newLocation = [[Company alloc] init];
    
    newLocation.idd = @"111";
    
    newLocation.compidd = @"111";
    newLocation.name = @"test1";
    newLocation.statte = @"state1";
    newLocation.city = @"111";
    newLocation.zipcode = @"111";
    newLocation.recommend = @"111";
    newLocation.coOne = @"111";
    newLocation.coTwo =  @"111";
    
    
    
    // Add this question to the locations array
    [self.tableDataThird addObject:newLocation];
    
    Company *newLocation2 = [[Company alloc] init];
    
    newLocation2.idd = @"211";
    
    newLocation2.compidd = @"211";
    newLocation2.name = @"best1";
    newLocation2.statte = @"state1";
    newLocation2.city = @"211";
    newLocation2.zipcode = @"211";
    newLocation2.recommend = @"111";
    newLocation2.coOne = @"111";
    newLocation2.coTwo =  @"111";
    
    [self.tableDataThird addObject:newLocation2];
    
    
    
    
    
    for (Company *nameString in self.tableData) {
        
        
        
        NSInteger sectionNumber = [collation sectionForObject:nameString collationStringSelector:@selector(name)];
        
        NSMutableArray *sectionNames = [outerArray objectAtIndex:sectionNumber];
        
        [sectionNames addObject:nameString];
        
       
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}









- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // [self start];
    
   // [self viewDidLoad] ;
    
    
    [self.tableView reloadData];
    
    
}





- (void)configureViewThree {
    
    
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    if (ref.authData) {
        
        
        
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
        
        
        
        
        
        [[[ref  queryOrderedByKey] queryEqualToValue:@"workplaces"]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             
             
             
             NSMutableArray *_locationstwo = [[NSMutableArray alloc] init];
             
             
             
             
             for (FDataSnapshot* childSnap in snapshot.children) {
                 
                 
                 Company *newLocation = [[Company alloc] init];
                 
                 newLocation.idd = childSnap.value[@"userid"]  ;
                 
                 newLocation.compidd =  childSnap.value[@"workplaceid"] ;
                 newLocation.name =   childSnap.value[@"name"] ;
                 newLocation.statte =  childSnap.value[@"state"] ;
                 newLocation.city = childSnap.value[@"city"]  ;
                 newLocation.zipcode =  childSnap.value[@"zipcode"] ;
                 newLocation.recommend =  childSnap.value[@"recommend"] ;
                 newLocation.coOne = childSnap.value[@"howlongworked"]  ;
                 newLocation.coTwo =  childSnap.value[@"yearyouleft"] ;
                 
                 
                
                 
                 // Add this question to the locations array
                 [_locationstwo addObject:newLocation];
                 
                 self.tableData = _locationstwo;
                 
                 
                
                 
                 
             }
             
                         self.collation = [UILocalizedIndexedCollation currentCollation];
             
             [self configureSectionData];
             
             
         }];
        
        
        
    } else {
        
        
        
       
        
        
    }
    
    
    
    
    
    
    
}



- (void)viewDidLoad {
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [super viewDidLoad];
    
    
    
       
    
    [[self navigationController].navigationBar setTintColor:[UIColor colorWithRed:(245.0/255.0) green:(30.0/255.0) blue:(119.0/255.0) alpha:1.0]];
    
   
    
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
    
    
    
    
    [self configureViewThree];
    
    





    





    
    
    
    
    
    
    
    
    
    
    
    
    
}











- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    
    
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}








- (void)didReceiveMemoryWarning {
    
    
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}








#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
   
   
    return [self.collation.sectionTitles count];
    
  
    
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    
    
    
    
    NSArray *innerArray = [self.outerArray objectAtIndex:section];
    return [innerArray count];
    
    
    
}






- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    cell.textLabel.textColor = [UIColor whiteColor];
    
    cell.backgroundColor = [UIColor clearColor];
    
    
    
    
    // Configure the cell...
    
    
    
    // Get the inner array for this section
    
    NSArray *innerArray = [self.outerArray objectAtIndex:indexPath.section];
    
    
    
    Company *comtwo =  [innerArray objectAtIndex:indexPath.row];
    
   
    
    
    
    cell.textLabel.text = comtwo.name;
    cell.detailTextLabel.text = comtwo.zipcode;
    
    
    
    
    
    
    //checkmark 1a
  
    cell.accessoryType = [indexPath isEqual:selectedIndex] ?UITableViewCellAccessoryCheckmark :
    
    UITableViewCellAccessoryNone;
    
    
    
    
    
    
    
    
    
    return cell;
    
    
}




- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    
    
    return self.collation.sectionTitles;
    
}





- (NSInteger)tableView:(UITableView *)tableView
sectionForSectionIndexTitle:(NSString *)title
               atIndex:(NSInteger)index
{
    
    
    return [self.collation sectionForSectionIndexTitleAtIndex:index];
    
    
}


 





-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    NSArray *innerArray = [self.outerArray objectAtIndex:indexPath.section];
    
    
    
   Company *comtwo =  [innerArray objectAtIndex:indexPath.row];
    
    
    
    
    [self.delegate selectedState: comtwo.name Two: comtwo.zipcode];
    
    
    
    
    NSIndexPath * prevIndexPath = selectedIndex;
    
   selectedIndex = indexPath;
    
  
    
    [tableView reloadData];
    
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
    
    
    if ([[segue identifier] isEqualToString:@"SearchTest"]) {
        
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSArray *innerArray = [self.outerArray objectAtIndex:indexPath.section];
        
        
        
        Company *comtwo =  [innerArray objectAtIndex:indexPath.row];
        
        
        self.comp_three= comtwo.name;
        
        
        
        
        
    }
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
}





@end
