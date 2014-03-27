//
//  ViewController.h
//  KeyValueObserving
//
//  Created by Son Ngo on 3/24/14.
//  Copyright (c) 2014 Son Ngo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;

@end
