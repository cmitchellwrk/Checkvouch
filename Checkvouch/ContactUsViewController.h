//
//  ContactUsViewController.h
//  Mole
//
//  Created by Chris Mitchell on 11/14/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>



#import <Firebase/Firebase.h>


@interface ContactUsViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextView *feedback;


- (IBAction)loginButton:(id)sender;



@end
