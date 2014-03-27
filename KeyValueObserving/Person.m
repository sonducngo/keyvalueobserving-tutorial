//
//  Person.m
//  KeyValueObserving
//
//  Created by Son Ngo on 3/24/14.
//  Copyright (c) 2014 Son Ngo. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)fullName {
  return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

// override the keyPathsForValuesAffectingValueForKey method to notify any observers for the "fullName" keyPath
+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
  NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
  
  if ([key isEqual:@"fullName"]) {
    NSArray *affectingKeys = @[@"lastName", @"firstName"];
    keyPaths = [keyPaths setByAddingObjectsFromArray:affectingKeys];
  }
  
  return keyPaths;
}

@end
