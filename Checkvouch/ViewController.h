//
//  ViewController.h
//  Mole
//
//  Created by Chris Mitchell on 2/1/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"



#import <Firebase/Firebase.h>




@interface ViewController : UIViewController <UIPageViewControllerDataSource>

- (IBAction)startWalkthrough:(id)sender;


@property (strong, nonatomic) UIPageViewController *pageViewController;

@property (strong, nonatomic) NSArray *pageTitles;

@property (strong, nonatomic) NSArray *pageTitlesTwo;

@property (strong, nonatomic) NSArray *pageTitlesThree;



@property (strong, nonatomic) NSArray *pageImages;


@end
