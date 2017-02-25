//
//  SearchDateTableViewController.m
//  Mole
//
//  Created by Chris Mitchell on 5/24/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import "SearchDateTableViewController.h"





@interface SearchDateTableViewController ()




@property NSDateFormatter *dateFormatter;



@property NSDateFormatter *dateFormatterTwo;






@property (assign) BOOL datePickerIsShowing;





@end






@implementation SearchDateTableViewController

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
    
    
     [self.datePicker setValue:[UIColor whiteColor] forKey:@"textColor"];
    
    [self.datePickerTwo setValue:[UIColor whiteColor] forKey:@"textColor"];
    
   
    
    [self setupBirthdayLabel];
    
    
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)setupBirthdayLabel {
    
    
    
    
    
    
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    
    self.dateFormatterTwo = [[NSDateFormatter alloc] init];
    
    
    [self.dateFormatter setDateFormat:@"MM-dd-yyyy"];
    
    [self.dateFormatterTwo setDateFormat:@"MM-dd-yyyy"];
    
    
    
    
    
    [self.dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    
    [self.dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    
    [self.dateFormatterTwo setDateStyle:NSDateFormatterMediumStyle];
    
    
    [self.dateFormatterTwo setTimeStyle:NSDateFormatterNoStyle];
    
    
    
    
    NSDate *defaultDate = [NSDate date];
    
    self.birthdayLabel.text = [self.dateFormatter stringFromDate:defaultDate];
    
    self.birthdayLabel.textColor = [ UIColor whiteColor];
    
    self.birthdayLabelTwo.text = [self.dateFormatter stringFromDate:defaultDate];
    self.birthdayLabelTwo.textColor = [UIColor whiteColor];
    
    
    
        
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}










#pragma mark - Action methods

- (IBAction)pickerDateChanged:(UIDatePicker *)sender {
    
    self.birthdayLabel.text =  [self.dateFormatter stringFromDate:sender.date];
    
   
    
    
    self.selectedBirthday = sender.date;
    
    
    
}


- (IBAction)pickerDateChangedTwo:(UIDatePicker *)sender {
    
    
    self.birthdayLabelTwo.text =  [self.dateFormatter stringFromDate:sender.date];
    
    
    
    
    self.selectedBirthdayTwo = sender.date;
    
    
    
    
    
    
}


- (IBAction)cancelPressed:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}



- (IBAction)savePressed:(UIBarButtonItem *)sender {
    
    
   
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    
    
    
    
    
    [self.delegatedate savePersonDetailsTwo:self.selectedBirthday Date:self.selectedBirthdayTwo];
    
    
    
    
  
    
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    
    
    
    
}



#pragma mark - Table view data source




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    

    
    // Return the number of sections.
    
    
    return 1;
    
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//  warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 4;
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
