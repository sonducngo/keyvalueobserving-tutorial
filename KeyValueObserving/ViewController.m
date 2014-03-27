//
//  ViewController.m
//  KeyValueObserving
//
//  Created by Son Ngo on 3/24/14.
//  Copyright (c) 2014 Son Ngo. All rights reserved.
//

// 1a
#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

// 1b
@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // 2
  self.person = [[Person alloc] init];
  
  // set delegates
  self.firstNameTextField.delegate = self;
  self.lastNameTextField.delegate  = self;
  
  // 3
  // observe "fullName" property changes to on Person instance using KVO
  [self.person addObserver:self
                forKeyPath:@"fullName"
                   options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                   context:nil];
}

// 4
#pragma mark - add observer methods
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  
  if ([keyPath isEqual:@"fullName"] && object == self.person) {
    NSString *old = (NSString *)[change objectForKey:@"old"];
    NSString *new = (NSString *)[change objectForKey:@"new"];
    NSString *message = [NSString stringWithFormat:@"Before: %@,\nAfter: %@", old, new];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Full Name Changed"
                               message:message
                              delegate:nil
                     cancelButtonTitle:@"OK"
                     otherButtonTitles:nil];
    [alert show];
    
    self.fullNameLabel.text = [NSString stringWithFormat:@"%@!", [self.person fullName]];
  }
}

// 5
#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
  return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
  if (textField == self.firstNameTextField) {
    self.person.firstName = textField.text;
  } else if (textField == self.lastNameTextField) {
    self.person.lastName = textField.text;
  }
}

@end
