//
//  JobNotifyDetailTableViewController.m
//  Checkvouch
//
//  Created by Chris Mitchell on 7/10/16.
//  Copyright © 2016 Chris Mitchell. All rights reserved.
//

#import "JobNotifyDetailTableViewController.h"

@interface JobNotifyDetailTableViewController ()

@end

@implementation JobNotifyDetailTableViewController


@synthesize jobwant_replyid;
@synthesize linkedinid;


@synthesize catagoryLabel = _catagoryLabel;
@synthesize companyLabel = _companyLabel;
@synthesize stateLabel = _stateLabel;
@synthesize cityLabel = _cityLabel;

@synthesize zipcodeLabel = _zipcodeLabel;
@synthesize typeLabel = _typeLabel;
@synthesize salaryLabel = _salaryLabel;

@synthesize descriptLabel = _descriptLabel;


@synthesize  postfrom_id;
@synthesize   jobnotifyid;

@synthesize   postfrom_id_username;

@synthesize  placeholder_currentusername;


@synthesize postfromidLabel = _postfromidLabel;
@synthesize placeholdercurrentusernameLabel = _placeholdercurrentusernameLabel;



-(void)pull_Companies_Three
{
    
    [_postfromidLabel setHidden:YES];
    
    [_placeholdercurrentusernameLabel setHidden:YES];
    
    
    
    Firebase *ref4 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    if (ref4.authData) {
        
        
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/jobnotifications" ];
        
        
        [[[ref  queryOrderedByKey] queryEqualToValue: jobnotifyid]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             _catagoryLabel.text =  snapshot.value[@"catagory"];
             
             _titleLabel.text = snapshot.value[@"title"];
             
             
             _companyLabel.text = snapshot.value[@"company"];
             
             _stateLabel.text = snapshot.value[@"state"];
             
             _cityLabel.text =  snapshot.value[@"city"];
             
             _zipcodeLabel.text = snapshot.value[@"zipcode"];
             
             
             _typeLabel.text = snapshot.value[@"type"];
             
             _salaryLabel.text = snapshot.value[@"salary"];
             
             
             
             
             

             
         }];
        
        
        
        
        Firebase *ref5 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
        
        
        [[[ref5  queryOrderedByKey] queryEqualToValue:  jobwant_replyid]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             self.postfrom_id_username = snapshot.value[@"name"];
             
             _postfromidLabel.text = snapshot.value[@"name"];
             
            
             
             
             
         }];
        
        
        Firebase *ref6 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
        
        
        [[[ref6  queryOrderedByKey] queryEqualToValue:ref6.authData.uid]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             
             
             _placeholdercurrentusernameLabel.text = snapshot.value[@"name"];
             
             
             
             
         }];
        
        Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
        
        
        [[[ref2  queryOrderedByKey] queryEqualToValue:jobwant_replyid]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
           
             
                         
             
             self.linkedinid = snapshot.value[@"linkedin_id"];
             
             
             
             
             
         }];
        
        
        
        
        
        
    } else {
        
        
        
        
    }
    
    
    
    
}







- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self pull_Companies_Three];
    
    
    
    [[self navigationController].navigationBar setTintColor:[UIColor colorWithRed:(245.0/255.0) green:(30.0/255.0) blue:(119.0/255.0) alpha:1.0]];
    
    
    [  self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                    forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
   
    
    self.tableView.allowsSelection = NO;
    
    
    
    self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    
    
    
    self.tableView.backgroundView = tempImageView;
    
    
    self.view.backgroundColor = [UIColor clearColor];
    
    
    
    [[self navigationController].navigationBar setBarTintColor:[UIColor colorWithRed:(1.0/255.0) green:(12.0/255.0) blue:(22.0/255.0) alpha:1.0]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    
    
    
    
    
}




- (IBAction)viewMemberProfileButtonClicked {
    
    
  
    
    
    DeeplinkSuccessBlock success = ^(NSString *returnState) {
        
        
        
        
    };
    DeeplinkErrorBlock error = ^(NSError *error, NSString *returnState) {
        
        
        
        
    };
    
    
    
    
    NSString *memberId = self.linkedinid;
    
    
    
    [[LISDKDeeplinkHelper sharedInstance] viewOtherProfile:memberId withState:@"viewMemberProfileButton" showGoToAppStoreDialog:YES success:success error:error];
    
    
    
}




- (IBAction)sync:(id)sender {
    
    
    
    [LISDKSessionManager createSessionWithAuth:[NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION, LISDK_EMAILADDRESS_PERMISSION, nil]
                                         state:@"some state"
                        showGoToAppStoreDialog:YES
                                  successBlock:^(NSString *returnState) {
                                      
                                     ;
                                      
                                      LISDKSession *session = [[LISDKSessionManager sharedInstance] session];
                                      
                                     
                                      
                                      NSMutableString *text = [[NSMutableString alloc] initWithString:[session.accessToken description]];
                                      
                                      [text appendString:[NSString stringWithFormat:@"state=\"%@\"",returnState]];
                                      
                                      
                                      
                                      
                                      [self performSegueWithIdentifier:@"SyncLinkedinJobs" sender:self];
                                      
                                      
                                      
                                      
                                      
                                      
                                  }
                                    errorBlock:^(NSError *error) {
                                        
                                        
                                       
                                    }
     ];
    
    
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

#//warning Incomplete implementation, return the number of sections
   
    return 1;
    
    
    
    
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    //#warning Incomplete implementation, return the number of rows
    
    return 12;
    
    
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
    
    
    
    
   
    
    if ([[segue identifier] isEqualToString:@"JobNotifyDetail"]) {
        
        
        
        
        
        
        
        JobNotifyMessageViewController *destViewController = segue.destinationViewController;
        
        
        destViewController.messageto_username = _postfromidLabel.text;
        
        
        destViewController.message_currentusername = _placeholdercurrentusernameLabel.text;
        
        
        
        
        
        
        
        
    } else if([[segue identifier] isEqualToString:@"SyncLinkedinJobs"]){
        
        
        LinkedinViewController *destViewController = segue.destinationViewController;
        
        
        destViewController.linked_idvalThree = self.linkedinid;
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
}


@end
