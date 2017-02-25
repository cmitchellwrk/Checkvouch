//
//  CoDetailTableViewController.h
//  Mole
//
//  Created by Chris Mitchell on 3/15/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <Firebase/Firebase.h>

@interface CoDetailTableViewController : UITableViewController 



{
    
    NSURLConnection *postConnection;
    
    
    
}





@property (strong, nonatomic) id detailItem;


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *statteLabel;
@property (weak, nonatomic) IBOutlet UILabel *zipcodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *recommendLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *toLabel;




- (IBAction)cancelCoDe:(UIStoryboardSegue *)sender;





 -(IBAction)save: (UIStoryboardSegue *) sender;




@end
