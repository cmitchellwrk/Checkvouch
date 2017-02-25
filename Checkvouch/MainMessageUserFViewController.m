//
//  MainMessageUserFViewController.m
//  Checka
//
//  Created by Chris Mitchell on 3/6/16.
//  Copyright (c) 2016 Chris Mitchell. All rights reserved.
//

#import "MainMessageUserFViewController.h"


#import "MainMessageUserViewController.h"

#import "MainMessageUserReplyViewController.h"



#import "Message.h"


#import <Firebase/Firebase.h>



@interface MainMessageUserFViewController ()

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




@implementation MainMessageUserFViewController



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
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    
    
    
    
    
    self.tableView.backgroundView = tempImageView;
    
    
    
    
    
    
    
    
    self.messageArray = [[NSMutableArray alloc] init];
    
    
    
    self.messageArrayMut = [[NSMutableArray alloc] init];
    
    
    
    
    self.messageUsername = self.messageto_username;
    
    self.friendsNameLabel.text = self.messageUsername;
    
    
    [self refreshFire];
    
    
    
    
    
    
    
}











- (void) doSomethingWhenTimeIsUpTen {
    
    
    
    
    
}





- (void) doSomethingWhenTimeIsUpThree:(NSTimer*)t {
    
    
    
    
    
    
    
    if(self.messageArrayMut.count > 0){
        
        
      
        
        [self.messageArrayMut removeObjectAtIndex:(0)];
        
        
        
        
        
        [self.tableView reloadData];
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
}







-(void)refreshFire

{
    //  Create a query for all message object by the current user
   
    
    
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    if (ref.authData) {
        
      
        
        
        
        NSString *idd = ref.authData.uid;
        
        
        
    
    
    
    
    
    
    Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com" ];
    
    
    
       
    
        [[[ref2  queryOrderedByKey] queryEqualToValue:@"messages"]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             NSMutableArray *_locationstwo = [[NSMutableArray alloc] init];
             
             
             
             
             for (FDataSnapshot* childSnap in snapshot.children) {
                 
                 
                 if ( (  [ childSnap.value[@"retrieveFromUserid"] isEqualToString: idd]   ) && (  [ childSnap.value[@"sendToUser"] isEqualToString:self.messageUsername ] )){
                     
                     
                     
                     
                     Message *newLocation = [[Message alloc] init];
                     
                     newLocation.objectid = childSnap.value[@"objectid"]  ;
                     
                     newLocation.retrievFromUser =  childSnap.value[@"retrieveFromUser"] ;
                     
                     newLocation.retrieveFromUserid =   childSnap.value[@"retrieveFromUserid"] ;
                     
                     newLocation.sendToUser = childSnap.value[@"SendToUser"];
                     
                     
                     
                     newLocation.userMessage =  childSnap.value[@"userMessage"] ;
                     
                     
                     
                     // Add this question to the locations array
                     [_locationstwo addObject:newLocation];
                     
                     
                     
                     
                     
                 }
                 
                 
                 
                 
             }
             
             
             
             
             
             
             
             
             
             
             
             self.messageArrayMut = _locationstwo;
             
             
             
             [self.tableView reloadData];
             
             
             
             
            
             Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com" ];
             
             
                
                  
             
             
             
             [[[ref  queryOrderedByKey] queryEqualToValue:@"messages"]
              
              observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
                  
             
             
                 
                  
                  
                  
                  for (FDataSnapshot* childSnap in snapshot.children) {
                   
                      
                      
                      if (   [ childSnap.value[@"retrieveFromUserid"] isEqualToString: idd]   ){
                          
            
                          
                      NSString *objectidd=   childSnap.value[@"objectid"];
                          
                     
                          
                          
                          Firebase *ref5 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/messages" ];
                          
                          
                          Firebase *usersRef = [ref5 childByAppendingPath: objectidd];
                       
                          
                             [usersRef setValue:   NULL];
                          
                          
                      
                      }
                      
                      
                      
                      
                  }
                  
                  
                  
              }];
             
             
             
             
             
         }];
        
        
        
        
    
        self.myTimer =      [NSTimer scheduledTimerWithTimeInterval:15.0
                                                             target:self
                                                           selector:@selector(doSomethingWhenTimeIsUpThree:)
                                                           userInfo:self
                                                            repeats:YES];
        
        
        
        
        
        
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
    
    
    
    Message *message = [self.messageArrayMut objectAtIndex:indexPath.row];
    
    
        
    cell.textLabel.text = message.userMessage;
    
   
    
    
    
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
        
        destViewController.message_currentusername = self.currentuser_username;
        
        
        
    }
    
}







@end
