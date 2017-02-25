//
//  PageContentViewController.m
//  Checkyours
//
//  Created by Chris Mitchell on 4/30/16.
//  Copyright (c) 2016 Chris Mitchell. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
    
   // self.backgroundImageView.contentMode =  UIViewContentModeScaleToFill;
    
    self.titleLabel.text = self.titleText;
    
    self.titleLabelTwo.text = self.titleTextTwo;
    
    self.titleLabelThree.text = self.titleTextThree;
    
    
    
    
    // self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    //  self.titleLabel.numberOfLines = 0;
    
    
    
    // Do any additional setup after loading the view.
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
