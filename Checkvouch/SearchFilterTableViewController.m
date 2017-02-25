//
//  SearchFilterTableViewController.m
//  Mole
//
//  Created by Chris Mitchell on 4/4/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import "SearchFilterTableViewController.h"


#import "SearchCompTableViewController.h"

#import "SearchDateTableViewController.h"



@interface SearchFilterTableViewController ()<StateSelectionDelegate,  VCAddPersonDelegateDate>


@property (weak, nonatomic) IBOutlet UILabel *bugRatingLabel;

@property (weak, nonatomic) IBOutlet UILabel *bugRatingLabelTwo;


@property (strong, nonatomic) IBOutlet UILabel *bugRatingLabelDate;

@property (strong, nonatomic) IBOutlet UILabel *bugRatingLabelDateTwo;


@end

@implementation SearchFilterTableViewController






 
 
 
 











- (void)savePersonDetailsTwo:(NSDate *)person Date:(NSDate *)persontwo{
    
   
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
  //  [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    
    
    NSString *formatedDate = [dateFormatter stringFromDate:person];
    
    NSString *formatedDateTwo = [dateFormatter stringFromDate:persontwo];
    
    self.bugRatingLabelDate.text = formatedDate;
    
    self.bugRatingLabelDateTwo.text = formatedDateTwo;
    
    
    [self.delegatethree returnToHomeAfterSavingDataThree:person Two:persontwo];
    
    
    
    [self.tableView reloadData];
    
    
    
}









#pragma mark - State Selection Delegate
-(void)selectedState:(NSString *)state Two:(NSString*)statetwo
{
    
  
    
    self.bugRatingLabel.text = state;
    self.bugRatingLabelTwo.text = statetwo;
   
   
    
    
    [self.delegate returnToHomeAfterSavingData:self.bugRatingLabel.text ZipandName:self.bugRatingLabelTwo.text];
    
    
    
    [self.tableView reloadData];
}









- (void)viewDidLoad {
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
    
    
    
    
   
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
// #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
// #warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
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
    
    
   

    if ([[segue identifier] isEqualToString:@"SearchCompanies"]) {
        
     
        
       SearchCompTableViewController *destViewController = segue.destinationViewController;
        destViewController.comp_three = self.comp_two;
       
        [[segue destinationViewController] setDelegate:self];
        
        
        
    } else if ( [[segue identifier] isEqualToString:@"SearchDate"] ){
        
     
        
        SearchDateTableViewController *controller = [[[segue destinationViewController] viewControllers] objectAtIndex:0];
        
        controller.delegatedate = self;
        
        
        
    }else if ( [[segue identifier] isEqualToString:@"SearchDateTwo"] ){
        
       
        
        SearchDateTableViewController *controller = [[[segue destinationViewController] viewControllers] objectAtIndex:0];
        
        controller.delegatedate = self;
        
        
        
    }


}


@end
