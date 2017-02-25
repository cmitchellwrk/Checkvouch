//
//  CoDetailTableViewController.m
//  Mole
//
//  Created by Chris Mitchell on 3/15/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import "CoDetailTableViewController.h"

#import "Company.h"



#import "CoEditTableViewController.h"

#import "AddCoTableViewController.h"




@interface CoDetailTableViewController ()







@end

@implementation CoDetailTableViewController








@synthesize detailItem = _detailItem;



@synthesize nameLabel = _nameLabel;
@synthesize cityLabel = _cityLabel;
@synthesize statteLabel = _statteLabel;
@synthesize zipcodeLabel = _zipcodeLabel;
@synthesize recommendLabel = _recommendLabel;
@synthesize fromLabel = _fromLabel;
@synthesize toLabel = _toLabel;







- (IBAction)cancelCoDe:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelCoDe"]) {
        
        
        
        
        
    } }




- (IBAction)save:(UIStoryboardSegue *)segue {
    
    
    if ([[segue identifier] isEqualToString:@"saveCoEditInput"]) {
        
        CoEditTableViewController *editController = [segue sourceViewController];
        
        
        
        NSString *coname = editController.nameField.text;
        NSString *coname2 = [coname lowercaseString];
        
        NSString *cocity = editController.cityField.text;
        NSString *cocity2 = [cocity lowercaseString];
        
        NSString *costate = editController.stateField.text;
        NSString *costate2 = [costate lowercaseString];
        
        NSString *cozipcode = editController.zipcodeField.text;
        
        NSString *corecommend = editController.recommendField.text;
        NSString *corecommend2 = [corecommend lowercaseString];
        
        NSString *howlongworked = editController.fromField.text;
        
        NSString *whenyouleaved = editController.toField.text;
       
        
        NSString *eye = [editController.detailItem  compidd];
        
        
        
       
        [self.detailItem setName: coname2];
        
        [self.detailItem setCity: cocity2];
        
        [self.detailItem  setStatte: costate2];
        
        [self.detailItem  setZipcode: cozipcode];
        
        [self.detailItem setRecommend: corecommend2];
        
       [self.detailItem setCoOne: howlongworked];
     
        [self.detailItem setCoTwo: whenyouleaved];
        
        
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users"];
        
        
        if (ref.authData) {
            
        
            
            Firebase *usersRef = [ref childByAppendingPath: @"workplaces"];
            
            
            Firebase *hopperRef = [usersRef childByAppendingPath:eye];
            
            
            
        
        
        
        NSDictionary *nickname = @{
                                   
                                   @"name": coname2,
                                   @"city": cocity2,
                                   @"recommend": corecommend2,
                                   @"state": costate2,
                                   @"zipcode":cozipcode,
                                   @"catagory":howlongworked,
                                   @"yearyouleft":whenyouleaved
                                   
                                   
                                   
                                   };
        
        [hopperRef updateChildValues: nickname];
        
        
        
        [self.detailItem setName: coname];
        
        [self.detailItem setCity: cocity];
        
        [self.detailItem  setStatte: costate];
        
        [self.detailItem  setZipcode: cozipcode];
        
        [self.detailItem setRecommend: corecommend];
        
        [self.detailItem setCoOne: howlongworked];
        
        [self.detailItem setCoTwo: whenyouleaved];
        
        
        
        }
        
        
        
        
        
    }
    
    
    
        
        
    
    
    
    
    
    
    
    
}











- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


- (void)configureView {
    if (self.detailItem &&
        [self.detailItem isKindOfClass:[Company class]])
    {
       
        
        self.nameLabel.text =  [self.detailItem name];
        
        self.cityLabel.text = [self.detailItem city];
        
        self.statteLabel.text = [self.detailItem statte];
        
        
          int cost2 =[[self.detailItem zipcode]intValue];
        
     self.zipcodeLabel.text =    [NSString stringWithFormat:@"%d",cost2];
        
        
        
      self.recommendLabel.text = [self.detailItem recommend];
        
    
        
        self.fromLabel.text = [self.detailItem coOne];
        
        
               
        
        self.toLabel.text = [self.detailItem coTwo];
        
        
        
    }
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    self.tableView.allowsSelection = NO;
    
    
    [[self navigationController].navigationBar setBarTintColor:[UIColor colorWithRed:(1.0/255.0) green:(12.0/255.0) blue:(22.0/255.0) alpha:1.0]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    
    
    self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    
    
    
    self.tableView.backgroundView = tempImageView;
   
    
    self.view.backgroundColor = [UIColor clearColor];
    
    
    
   
    
   [self configureView];
    
    
}










- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    [self configureView];
    
    [self.tableView reloadData];
    
}




















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Table view data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 8;
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





// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
    
    if ([[segue identifier] isEqualToString:@"EditCompany"]) {
        
        
        UINavigationController *navController = [segue destinationViewController];
        CoEditTableViewController *SITViewController = (CoEditTableViewController *)([navController viewControllers][0]);
        
        SITViewController.detailItem = _detailItem;
        
        
        
    
        
               
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}





@end
