//
//  MainMessageUserViewController.m
//  Mole
//
//  Created by Chris Mitchell on 10/23/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//
#import "MainMessageUserViewController.h"

#import "MainMessageUserReplyViewController.h"



@interface MainMessageUserViewController ()

@property (weak, nonatomic) IBOutlet UILabel *friendsNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *userText;




@property (weak, nonatomic) IBOutlet UIImageView *userImage;



@property (nonatomic) NSArray *messageArray;
@property (nonatomic) NSMutableArray *messageArrayMut;




@property (nonatomic) NSString *messageUsername;
@property (nonatomic) UIRefreshControl *refreshControl;
@property (nonatomic) UIImagePickerController *picker;
@property (nonatomic) UIImage *image;
@property (nonatomic) NSData *imageData;
@property (nonatomic) NSIndexPath *imagePath;

@end

@implementation MainMessageUserViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    self.tableView.contentInset = UIEdgeInsetsMake(50.0, 0.0, 0.0, 0.0);
    
    
    self.userText.backgroundColor = [UIColor clearColor];
    
    self.tableView.allowsSelection = NO;
    
   
    
    
    [[self navigationController].navigationBar setTintColor:[UIColor colorWithRed:(245.0/255.0) green:(30.0/255.0) blue:(119.0/255.0) alpha:1.0]];
    
    
  
    
    [  self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                    forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    
    
    self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"piVms8T.jpg"]];
    
    
    
    
    
    self.tableView.backgroundView = tempImageView;
    
    
    
    
        
    
    
    
    self.messageArray = [[NSMutableArray alloc] init];
   
    
    
    self.messageArrayMut = [[NSMutableArray alloc] init];
    
    
    
    
    self.messageUsername = self.messageto_username;
    
    self.friendsNameLabel.text = self.messageUsername;
    
   
    
       
    
        
    
    
}











- (void) doSomethingWhenTimeIsUpTen {
    
    
    
    
    
}





- (void) doSomethingWhenTimeIsUpThree:(NSTimer*)t {
    
    
    
   
   
        
        
        if(self.messageArrayMut.count > 0){
            
            
        
            
            [self.messageArrayMut removeObjectAtIndex:(0)];
            
            
            
            
            
            [self.tableView reloadData];
            
            
            
            
            
            
            
        }
        
        
        
        
    
    
    
    
    
    
}




- (void)viewDidDisappear:(BOOL)animated {
 
 
    [self.messageArrayMut removeAllObjects];
    
    [self.tableView reloadData];
    
    
   
    
    
    
}








////////////////////////////////// Message //////////////////////////////////













////////////////////////////////// Table //////////////////////////////////

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}





-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageArrayMut.count;
    
    
    
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    
    cell.backgroundColor = [UIColor clearColor];
    
    
    
    
    
    return cell;
}







// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    if ([[segue identifier] isEqualToString:@"MainMessageUserReply"]) {
        
        
        [self.messageArrayMut removeAllObjects];
        
        
        MainMessageUserReplyViewController *destViewController = segue.destinationViewController;
        
            
        destViewController.messageto_username = self.messageUsername;
        
        
        
    }

}


@end
