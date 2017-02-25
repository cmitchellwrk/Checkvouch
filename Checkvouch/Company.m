//
//  Company.m
//  Mole
//
//  Created by Chris Mitchell on 3/22/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import "Company.h"

@implementation Company



@synthesize idd = _idd;
@synthesize compidd = _compidd;
@synthesize name = _name;
@synthesize statte = _statte;
@synthesize city = _city;
@synthesize zipcode = _zipcode;
@synthesize recommend = _recommend;
@synthesize coOne = _coOne;
@synthesize coTwo = _coTwo;




-(NSComparisonResult)compare:(id)otherObject {
    
    if ([otherObject isKindOfClass:[self class]]) {
        Company *otherBug = (Company *)otherObject;
        return [self.name compare:otherBug.name];
    }
    
    else return NSOrderedAscending;
}

 


@end
