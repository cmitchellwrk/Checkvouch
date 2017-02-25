//
//  ProfileTableViewController.h
//  Mole
//
//  Created by Chris Mitchell on 2/1/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "DeleteProfileViewController.h"


#import <Firebase/Firebase.h>




@interface ProfileTableViewController : UITableViewController{
    
    
    NSURLConnection *postConnection;
    
    NSMutableArray *json;
    

    
    
}





@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *password;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *phonenumber;
@property (weak, nonatomic) IBOutlet UILabel *occupation;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *linkedin;






@property (nonatomic, strong) NSString *teststring2;











-(BOOL)save: (UIStoryboardSegue *) sender;



- (IBAction)cancel:(UIStoryboardSegue *)sender;




@end
