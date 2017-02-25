//
//  Message.h
//  Checka
//
//  Created by Chris Mitchell on 3/6/16.
//  Copyright (c) 2016 Chris Mitchell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject






@property (copy, nonatomic) NSString *objectid;

@property (copy, nonatomic) NSString *retrievFromUser;


@property (copy, nonatomic) NSString *retrieveFromUserid;

@property (copy, nonatomic) NSString *sendToUser;

@property (copy, nonatomic) NSString *userMessage;





@end
