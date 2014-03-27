//
//  Person.h
//  KeyValueObserving
//
//  Created by Son Ngo on 3/24/14.
//  Copyright (c) 2014 Son Ngo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

- (NSString *)fullName;

@end
