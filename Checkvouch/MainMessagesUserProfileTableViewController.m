
    
//
//  MainMessagesUserProfileTableViewController.m
//  Mole
//
//  Created by Chris Mitchell on 11/1/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import "MainMessagesUserProfileTableViewController.h"



@interface MainMessagesUserProfileTableViewController ()

@end

@implementation MainMessagesUserProfileTableViewController





@synthesize username = _username;

@synthesize email= _email;

@synthesize occupation = _occupation;

@synthesize linkedin= _linkedin;



@synthesize linkedin_idd = _linkedin_idd;








- (IBAction)viewMemberProfileButtonClicked {
    
    
    
    
    
    DeeplinkSuccessBlock success = ^(NSString *returnState) {
       
        
        
    };
    DeeplinkErrorBlock error = ^(NSError *error, NSString *returnState) {
        
        
        
    };
    
    NSString *memberId = self.linkedin_idd;
    
    
    [[LISDKDeeplinkHelper sharedInstance] viewOtherProfile:memberId withState:@"viewMemberProfileButton" showGoToAppStoreDialog:YES success:success error:error];
    
    
    
    
    
    
}







- (IBAction)sync:(id)sender {
    
    
    
    [LISDKSessionManager createSessionWithAuth:[NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION, LISDK_EMAILADDRESS_PERMISSION, nil]
                                         state:@"some state"
                        showGoToAppStoreDialog:YES
                                  successBlock:^(NSString *returnState) {
                                      
                                    
                                      
                                      LISDKSession *session = [[LISDKSessionManager sharedInstance] session];
                                      
                                      
                                      
                                      NSMutableString *text = [[NSMutableString alloc] initWithString:[session.accessToken description]];
                                      
                                      [text appendString:[NSString stringWithFormat:@"state=\"%@\"",returnState]];
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      [self performSegueWithIdentifier:@"SyncLinkedinMainMessage" sender:self];
                                      
                                      
                                      
                                      
                                      
                                      
                                  }
                                    errorBlock:^(NSError *error) {
                                        
                                        
                                        
                                    }
     ];
    
    
    
    
    
    
    
    
    
    
    
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
    
    
    
    
    
    
    
    
   
    
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    if (ref.authData) {
        
        
        
       //  NSString *idd = ref.authData.uid;
        
        
        Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
        
        
        [[[ref2  queryOrderedByKey] queryEqualToValue:self.messageuserid]
         
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
         
             
             
              _username.text   = snapshot.value[@"name"];
            
             
               _email.text  = snapshot.value[@"email"];
             
              _occupation.text = snapshot.value[@"job"];
             
             // self.age.text =  snapshot.value[@"age"];
             
             _linkedin.text =  snapshot.value[@"linkedin"];
             
             
              _linkedin_idd  =  snapshot.value[@"linkedin_id"];
             
             
         }];
        
        
        
    } else {
        
        
        
        [self performSegueWithIdentifier:@"CancelLogout" sender:self];
        
        
        
        
    }
    
    
    
    
    
    
    
        
    
    
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
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
    return 5;
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
    
    
    if ([[segue identifier] isEqualToString:@"SyncLinkedinMainMessage"]) {
        
        
                
        LinkedinViewController *destViewController = segue.destinationViewController;
        destViewController.linked_idvalFour = self.linkedin_idd;
        
        
        
        
    }
}





@end
