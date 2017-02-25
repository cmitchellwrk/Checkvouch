//
//  MessageViewController.m
//  TalkToMe
//
//  Created by Anthony Williams on 11/27/14.
//  Copyright (c) 2014 Anthony Williams. All rights reserved.
//

#import "MessageUserViewController.h"




#import "Message.h"



#import <Firebase/Firebase.h>




@interface MessageUserViewController ()

@property (weak, nonatomic) IBOutlet UILabel *friendsNameLabel;

@property (weak, nonatomic) IBOutlet UITextField *userText;




@property (weak, nonatomic) IBOutlet UIImageView *userImage;


@property (nonatomic) NSArray *messageArray;
@property (nonatomic) NSMutableArray *messageArrayMut;





@property (strong, nonatomic) NSString *message_currentusername;

@property (nonatomic) NSString *messageUsernameidd;
@property (nonatomic) NSString *currentloggedinuser;

@property (nonatomic) NSString *sendtouserid;


@property (nonatomic) NSString *messageUsername;
@property (nonatomic) UIRefreshControl *refreshControl;
@property (nonatomic) UIImagePickerController *picker;
@property (nonatomic) UIImage *image;
@property (nonatomic) NSData *imageData;
@property (nonatomic) NSIndexPath *imagePath;

@end

@implementation MessageUserViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.tableView.contentInset = UIEdgeInsetsMake(150.0, 0.0, 0.0, 0.0);
    
    self.tableView.allowsSelection = NO;
    
    
    
    self.userText.backgroundColor = [UIColor clearColor];
    
    
    self.userText.layer.cornerRadius=8.0f;
    self.userText.layer.masksToBounds=YES;
    self.userText.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.userText.layer.borderWidth= 1.0f;
    
    
    
    [[self navigationController].navigationBar setTintColor:[UIColor colorWithRed:(245.0/255.0) green:(30.0/255.0) blue:(119.0/255.0) alpha:1.0]];
    
 
       
    
    
    
    self.messageArray = [[NSMutableArray alloc] init];
    
    
    
    self.messageArrayMut = [[NSMutableArray alloc] init];
    
    
    
   
    
    
   
    
    
    self.messageUsername = self.messageto_username;
    
    self.friendsNameLabel.text = self.messageUsername;
    
   
    

    
    
    self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
   
    
    
    
    self.tableView.backgroundView = tempImageView;
    
    
   
    
   
    
    
    
    
    [  self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                    forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    
    
  
    //add background
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"piVms8T.jpg"]];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
   
    
    
    
   
    
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.tableView addGestureRecognizer:gestureRecognizer];
    
    
    // Initialize the refresh control.
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.tableView addSubview:self.refreshControl];
    
    self.refreshControl.backgroundColor = [UIColor blueColor];
    
    self.refreshControl.tintColor = [UIColor greenColor];
    [self.refreshControl addTarget:self
                            action:@selector(reloadTable)
                  forControlEvents:UIControlEventValueChanged];
    
    
}


- (void) hideKeyboard {
 
    
    [self.userText resignFirstResponder];
   
    
   
    
    
}

- (void)reloadTable
{
    // End the refreshing
    if (self.refreshControl) {
        [self.refreshControl beginRefreshing];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM d, h:mm a"];
        NSString *title = [NSString stringWithFormat:@"Last update: %@", [formatter stringFromDate:[NSDate date]]];
        NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor blackColor]
                                                                    forKey:NSForegroundColorAttributeName];
        NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];
        self.refreshControl.attributedTitle = attributedTitle;
        
        [self.refreshControl endRefreshing];
    }
    
    
  
    
    [self.tableView reloadData];
    
    
    
}






-(void)viewDidAppear:(BOOL)animated
{
    
    
    
    
}





- (void) doSomethingWhenTimeIsUpThree:(NSTimer*)t {
    
   
    
    if(self.messageArrayMut.count > 0 ){
        
        
        [self.messageArrayMut removeObjectAtIndex:(0)];
        
        
        
        [self.tableView reloadData];
        
        
        
    } else {
        
        [self.myTimer invalidate];
        self.myTimer = nil;
        
        
    }
    
}











////////////////////////////////// Message //////////////////////////////////







- (IBAction)sendMessageFirebase:(id)sender
{
    
    NSString *usertextproxy = self.userText.text;
    
    self.userText.text =  @" ";
    
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/"];
    
    
    
    if (ref.authData) {
        
        
             NSString *test = ref.authData.uid;
        
        
        
        
        Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com" ];
        
        
        
        
        [[[ref2  queryOrderedByKey] queryEqualToValue:@"users"]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             
             for (FDataSnapshot* childSnap in snapshot.children) {
                 
                 NSString *snapkey = childSnap.key;
                 
                 
                 
                 if (  [ snapkey isEqualToString: test]     ){
                     
                     self.currentloggedinuser = childSnap.value[@"name"];
                     
                     
                     
                     
                     
                 }
                 
                 
                 
                 
                 if([childSnap.value[@"name"]isEqualToString: self.messageUsername]){
                     
                     
                     self.messageUsernameidd =childSnap.key;
                     
                     
                     
                 }
                 
                 
                 
                 
                 
                 
             }
             
             
             
             Firebase *postRef = [ref childByAppendingPath: @"messages"];
             
             
             Firebase *post1Ref = [postRef childByAutoId];
             
             NSString *postId = post1Ref.key;
             
             
             NSDictionary *nickname = @{
                                        
                                        
                                        @"objectid":postId,
                                        @"retrieveFromUser":@"n/a",
                                        @"retrieveFromUserid":self.messageUsernameidd,
                                        @"sendToUser":self.currentloggedinuser,
                                        @"sendToUserId":test,
                                        @"userMessage":usertextproxy,
                                        
                                       
                                        
                                        
                                        
                                        };
             
             
             
             [post1Ref setValue: nickname];
             
             
             
             
             
             
             
             
             
             
             
             
         }];
        
        
        
        
        
        
        
        
        
        
    } else {
        
        
        
        
        
        
    }
    
    
    
    NSString *test = ref.authData.uid;
    
    
    Message *newLocation = [[Message alloc] init];
    
    newLocation.objectid =  @"n/a";
    
    newLocation.retrievFromUser = self.messageUsername;
    
    newLocation.retrieveFromUserid = test;
    
    newLocation.sendToUser = self.message_currentusername;
    
    newLocation.userMessage =  usertextproxy;
    
    
    
    
    
    
    [self.messageArrayMut addObject:(newLocation)];
    
    
    [self.tableView reloadData];
    
    
    
    [NSTimer scheduledTimerWithTimeInterval:10.0
                                     target:self
                                   selector:@selector(doSomethingWhenTimeIsUpPost:)
                                   userInfo:nil
                                    repeats:NO];
    
    
    
    
    [self.tableView reloadData];
    
    
    
    
    
}












- (void) doSomethingWhenTimeIsUpPost:(NSTimer*)t {
    
    
    if(self.messageArrayMut.count > 0 ){
        
        
        [self.messageArrayMut removeObjectAtIndex:(0)];
        
        
        [self.tableView reloadData];
        
        
        
    } else {
        
        
        
        
        
        [self.myTimer invalidate];
        self.myTimer = nil;
        
        
    }
    
    
    
    
}













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
    
    
    
    Message *message = [self.messageArrayMut objectAtIndex:indexPath.row];
    
    cell.textLabel.text = message.userMessage;
    
    
   
    
    
    
    
    
    
    return cell;
}






 
 


@end
