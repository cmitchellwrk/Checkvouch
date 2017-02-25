//
//  PageContentViewController.h
//  Checkyours
//
//  Created by Chris Mitchell on 4/30/16.
//  Copyright (c) 2016 Chris Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@property (weak, nonatomic) IBOutlet UILabel *titleLabelTwo;


@property (weak, nonatomic) IBOutlet UILabel *titleLabelThree;



@property NSUInteger pageIndex;


@property NSString *titleText;



@property NSString *titleTextTwo;



@property NSString *titleTextThree;



@property NSString *imageFile;


@end
