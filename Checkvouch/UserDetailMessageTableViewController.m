//
//  UserDetailMessageTableViewController.m
//  Mole
//
//  Created by Chris Mitchell on 10/3/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import "UserDetailMessageTableViewController.h"





@interface UserDetailMessageTableViewController ()

@end



@implementation UserDetailMessageTableViewController

@synthesize  comp_id;
@synthesize   comp_userid;

@synthesize   linkedinid;

@synthesize   messageusername;



@synthesize username =  _username;
@synthesize company =  _company;
@synthesize companyzipcode = _companyzipcode;
@synthesize from = _from;
@synthesize to = _to;
@synthesize recommend = _recommend;
@synthesize occupation = _occupation;













-(void)pull_Companies_four
{
    
    
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    
        
        
        NSString *idd = ref.authData.uid;
        
        
        Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
        
        
        [[[ref2  queryOrderedByKey] queryEqualToValue: idd]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             self.occupation.text =  snapshot.value[@"job"];
             
             
          
             
             _username.text =  snapshot.value[@"name"];
 
             
             self.messageusername = snapshot.value[@"name"];
             
             
         
             
             
             self.linkedinid = snapshot.value[@"linkedin_id"];
             
             
             
             
             
         }];
        
        

    
    
}











-(void)pull_Companies_Three
{
    
    
    
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    if (ref.authData) {
        
        
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users/workplaces" ];
        
        
        [[[ref  queryOrderedByKey] queryEqualToValue:comp_id]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             
             _company.text = snapshot.value[@"name"];
             
             
             _companyzipcode.text = snapshot.value[@"zipcode"];
             
             _recommend.text = snapshot.value[@"recommend"];
             
             
             
           
             
             
            
             
          
             
             
             
             
             
             
             
             
             
         }];
        
        
        
        Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
        
        
        [[[ref2  queryOrderedByKey] queryEqualToValue: comp_userid]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             self.occupation.text =  snapshot.value[@"job"];
             
             
            
             
             _username.text =  snapshot.value[@"name"];
             
             
             self.messageusername = snapshot.value[@"name"];
             
             
             _occupation.text =  snapshot.value[@"job"];
             
             
             self.linkedinid = snapshot.value[@"linkedin_id"];
             
             
             
             
             
         }];
        
        
        
        
        
        
        
        

        
    } else {
        
        
        
        [self performSegueWithIdentifier:@"CancelLogout" sender:self];
        
        
        
        
    }
    
    
    
    
}





- (IBAction)cancelLinkedinTwo:(UIStoryboardSegue *)segue {
    
    if ([[segue identifier] isEqualToString:@"cancelLinkedinTwo"]) {
        
        
        
        
        
        
    } }

















- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.tableView.allowsSelection = NO;    
    
    [[self navigationController].navigationBar setTintColor:[UIColor colorWithRed:(245.0/255.0) green:(30.0/255.0) blue:(119.0/255.0) alpha:1.0]];
    
    
    self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    
    
    self.tableView.backgroundView = tempImageView;
    
    
   
    
    self.view.backgroundColor = [UIColor clearColor];
    
    
    
    [[self navigationController].navigationBar setBarTintColor:[UIColor colorWithRed:(1.0/255.0) green:(12.0/255.0) blue:(22.0/255.0) alpha:1.0]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    

    
    [self pull_Companies_Three];
    
    
  
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}






- (IBAction)viewMemberProfileButtonClicked {
    
    
    
 
    
    
    DeeplinkSuccessBlock success = ^(NSString *returnState) {
        
        
    
        
        
    };
    DeeplinkErrorBlock error = ^(NSError *error, NSString *returnState) {
        
        
     
        
        
        
    };
    
    
    
    
    NSString *memberId = self.linkedinid;
    
    
       
    [[LISDKDeeplinkHelper sharedInstance] viewOtherProfile:memberId withState:@"viewMemberProfileButton" showGoToAppStoreDialog:YES success:success error:error];
    
    
    
}





- (IBAction)syncTwo:(id)sender {

    
        
    
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    if (ref.authData) {
        
       
        
        
        
        NSString *idd = ref.authData.uid;
        
        
        Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
        
        
        [[[ref2  queryOrderedByKey] queryEqualToValue: idd]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             
           
             
             
              NSString * linkedin_val =  snapshot.value[@"linkedin_id"];
             
         
             
             
             if ( linkedin_val.length < 3){
                 
                
                 
                 [self performSegueWithIdentifier:@"verifyLinkedinMessage" sender:self];
                 
                 
             }else{
                 
                 
                 [self performSegueWithIdentifier:@"showMessage" sender:self];
                 
                 
                 
             }
        
             
    
             
             
         }];
        
        
        
        
        
        
        
    } else {
        
        
        
        [self performSegueWithIdentifier:@"CancelLogout" sender:self];
        
        
        // No user is signed in
        
        
    }
    
    
    
    
    
    
    
    
    
}









- (IBAction)syncTwoFirebase:(id)sender {
    
    
    
    
                [self performSegueWithIdentifier:@"showMessage" sender:self];
    
    
    
    
    
    
    
    
}





- (IBAction)sync:(id)sender {
    
    
    
    [LISDKSessionManager createSessionWithAuth:[NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION, LISDK_EMAILADDRESS_PERMISSION, nil]
                                         state:@"some state"
                        showGoToAppStoreDialog:YES
                                  successBlock:^(NSString *returnState) {
                                      
                                      
                                      LISDKSession *session = [[LISDKSessionManager sharedInstance] session];
                                     
                                  
                                     
                                      NSMutableString *text = [[NSMutableString alloc] initWithString:[session.accessToken description]];
                                     
                                      [text appendString:[NSString stringWithFormat:@"state=\"%@\"",returnState]];
                                    
                                      
                                      
                                  
                                      
                                      
                                      [self performSegueWithIdentifier:@"SyncLinkedin" sender:self];
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                  }
                                    errorBlock:^(NSError *error) {
                                       
                                        
                                      
                                    }
     ];
   
    
    
    
    
}




- (IBAction) syncFour:(id)sender {
    
    
    [LISDKSessionManager createSessionWithAuth:[NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION, LISDK_EMAILADDRESS_PERMISSION, nil]
                                         state:@"some state"
                        showGoToAppStoreDialog:YES
     
                                  successBlock:^(NSString *returnState) {
                                      
                                      
                                      
                                      LISDKSession *session = [[LISDKSessionManager sharedInstance] session];
                                      
                                      
                                      
                                      NSMutableString *text = [[NSMutableString alloc] initWithString:[session.accessToken description]];
                                      [text appendString:[NSString stringWithFormat:@"state=\"%@\"",returnState]];
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      [self performSegueWithIdentifier:@"SyncLinkedinSearch" sender:self];
                                      
                                      
                                      
                                      
                                  }
                                    errorBlock:^(NSError *error) {
                                        
                                        
                                        
                                        
                                        
                                    }
     ];
    
    
    
    
    
    
    
    
}





- (IBAction)backLinkedinMessage:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"backLinkedinMessage"]) {
        
        
        
        
        
        
    } }






- (IBAction)stopLinkedinMessage:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"stopLinkedinMessage"]) {
        
        
        
        
        
        
    } }





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
    
    
    // Return the number of rows in the section.
    return 9;
    
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([[segue identifier] isEqualToString:@"showMessage"]) {
        
    
          
        MessageUserViewController *destViewController = segue.destinationViewController;
        destViewController.messageto_username = messageusername;
        
        
        
        
    
    }else if([[segue identifier] isEqualToString:@"SyncLinkedinSearch"]){
        
        
        LinkedinViewController *destViewController = segue.destinationViewController;
        destViewController.linked_idvalTwo = self.linkedinid;
        
        
        
    }
    
}


@end
