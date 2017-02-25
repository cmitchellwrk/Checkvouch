//
//  ProfileTableViewController.m
//  Mole
//
//  Created by Chris Mitchell on 2/1/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import "ProfileTableViewController.h"
#import "ProfileDetailTableViewController.h"

#import "Profile.h"
#import "MasterViewController.h"






@interface ProfileTableViewController ()



@end



@implementation ProfileTableViewController





@synthesize username = _username;
@synthesize password = _password;
@synthesize email= _email;
@synthesize phonenumber= _phonenumber;
@synthesize occupation = _occupation;
@synthesize age= _age;
@synthesize linkedin= _linkedin;






@synthesize teststring2;








- (IBAction)cancel:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelInput"]) {
    } }











- (void)configureView {
    
    
       
    
    NSDictionary *info = [json objectAtIndex:0];
    
    self.username.text = [info objectForKey:@"Username"];
    
    
  
    
    self.password.text= [info objectForKey:@"Password"];
    
    
    
    
    
    self.email.text = [info objectForKey:@"Email"];
    
    
    self.phonenumber.text = [info objectForKey:@"Phonenumber"];
    
    
    self.age.text = [info objectForKey:@"Age"];
    
    
       self.occupation.text =  [info objectForKey:@"occupation"];
    
    
    self.linkedin.text = [info objectForKey:@"LinkedIn"];
    
}






- (void)configureViewTwo {
    
    
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
    
    
    if (ref.authData) {
        
        
        
        
        NSString *idd = ref.authData.uid;
        
        
        Firebase *ref22 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
        
        
        [[[ref22  queryOrderedByKey] queryEqualToValue: idd]
         
         observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
             
             
             
             self.username.text   = snapshot.value[@"name"];
             
             self.email.text = snapshot.value[@"email"];
             
             
             
             self.phonenumber.text =  snapshot.value[@"phonenumber"];
             
             self.occupation.text =  snapshot.value[@"job"];
             
             
             self.linkedin.text =  snapshot.value[@"linkedin"];
             
         }];
        
        
        
    } else {
        
        
        
        [self performSegueWithIdentifier:@"CancelLogout" sender:self];
        
        
        // No user is signed in
        
        
    }
    
    
    
    
    
    
    
    
    
    
}


-(void) getData:(NSData *) data{
    
    NSError *error;
    
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    
    
}


-(void) start {
    
    
    NSString *strURL = [NSString stringWithFormat:@"http://localhost/MoleProfile.php?userName=%@", teststring2];
    
    NSURL *url = [NSURL URLWithString:strURL];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    [self getData:data];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
       
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.opaque = NO;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue8.jpg"]];
    
  
    
    self.tableView.backgroundView = tempImageView;
   
    
    self.view.backgroundColor = [UIColor clearColor];
    
   
    
    [[self navigationController].navigationBar setBarTintColor:[UIColor colorWithRed:(1.0/255.0) green:(12.0/255.0) blue:(22.0/255.0) alpha:1.0]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
 
    
    
    [self configureViewTwo];
  
    
    
}






- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    [self configureViewTwo];
    
    [self.tableView reloadData];
    
}












- (BOOL)save:(UIStoryboardSegue *)segue {
    
    
    if ([[segue identifier] isEqualToString:@"saveInput"]) {
        
       
        
      
        
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
        
        
        
        
        if (ref.authData) {
           
            
            
            
            ProfileDetailTableViewController *editController = [segue sourceViewController];
            
            
            NSString *idd = ref.authData.uid;
        
        
            Firebase *usersRef = [ref childByAppendingPath: @"users"];
            
            
            Firebase *hopperRef = [usersRef childByAppendingPath: idd];

            
            
            
            
            NSString *firstname = editController.usernameField.text;
            NSString *firstname2 = [firstname lowercaseString];
            
            
            NSString *email = editController.emailField.text;
            NSString *phonenumber = editController.phoneNumberField.text;
            
            NSString *occupation= editController.occupationField.text;
           // NSString *age = editController.ageField.text;
            NSString *linkedin = editController.linkedinField.text;
            
        
            
            
            
            Firebase *ref22 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
            
            
            [[[ref22  queryOrderedByKey] queryEqualToValue: idd]
             
             observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
                 
                 
                 
                 NSString *tee = snapshot.value[@"email"] ;
                 
                 NSString *too =  snapshot.value[@"password"] ;
                 
                 
                 
                 
                 
                 Firebase *ref100 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
                 
                 
                 
                 [ref100 changeEmailForUser:tee  password:too
                  
                  
                  
                  
                                 toNewEmail:email withCompletionBlock:^(NSError *error) {
                                     
                                     if (error) {
                                         
                                                                                
                                         // There was an error processing the request
                                         
                                     } else {
                                         
                                         // Email changed successfully
                                         
                                     }
                                 }];
                 
                 
                 
                 
                 
             }];
            
            
            
            
            
            
            
            
            
            
            
            
            if([firstname length] < 5){
                
                
                
                UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Username must be at least 5 characters"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                [AV show];
                
                return FALSE;
                
                
                
                
            }else if ( [email length] < 8 ){
                
                
                UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid email"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                [AV show];
                
                return FALSE;
                
                
                
            }else if ( [ occupation length] < 4  ){
                
                
                UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid occupation"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                [AV show];
                
                return FALSE;
                
                
                
                
        
                
            }else if ( [ linkedin length] < 1  ){
                
                UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter your linkedin name"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                [AV show];
                
                return FALSE;
                
                
                
            }else if ( [ phonenumber length] < 12  ){
                
                UIAlertView * AV = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please enter a valid phone number and incude the dashes"  delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                [AV show];
                
                return FALSE;
                
                
                
            }
            
            
            NSDictionary *nickname = @{
                                       
                                       @"name": firstname2,
                                       @"email": email,
                                       @"phonenumber": phonenumber,
                                       @"job":occupation,
                                       @"linkedin":linkedin
                                       
                                       
                                       };
            
            [hopperRef updateChildValues: nickname];
          
            
            
            
            
            
            
            
            
        } else {
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
    }

    return true;
    

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
    return 7;
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

///*
//#pragma mark - Navigation


// In a storyboard-based application, you will often want to do a little preparation before navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([[segue identifier] isEqualToString:@"ProfileEditSegue"]) {
        
        
     
        
        
        // Create a new location object and set its props to JsonElement properties
        Profile *newLocation = [[Profile alloc] init];
        
        newLocation.username = self.username.text;
        
      //  newLocation.password = self.password.text;
        
        newLocation.email = self.email.text;
        
        newLocation.phonenumber = self.phonenumber.text;
        
        newLocation.occupation = self.occupation.text;
        
      //  newLocation.age = self.age.text;
        
        newLocation.linkedin = self.linkedin.text;
        
        
        
        
        UINavigationController *navController = [segue destinationViewController];
        ProfileDetailTableViewController *SITViewController = (ProfileDetailTableViewController *)([navController viewControllers][0]);
        
        SITViewController.detailItem = newLocation;
        
        
        
    } else if ([[segue identifier] isEqualToString:@"ProfileDeleteSegue"]){
        
        
        
        
        
            //    DeleteProfileViewController *destViewController = segue.destinationViewController;
        
       // destViewController.currentUser = [PFUser currentUser];
        
        
        
        
        
        
        
    }
    
        
    
    }
    

    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 
    
 



//*/

@end
