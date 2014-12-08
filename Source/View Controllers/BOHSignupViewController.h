//
//  BLVSignupViewController.h
//  BLVLoginSignUpViewController
//
//  Created by Billy on 07/12/14.
//  Copyright (c) 2014 Bloglovin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BOHJoinServiceDefines.h"

@class BOHSignupViewController;

@protocol BOHSignupViewControllerDelegate <NSObject>

- (void)signupViewController:(BOHSignupViewController *)vc didPerformAction:(BLVLoginSignupAction)action parameters:(NSDictionary *)parameters;

@end

@interface BOHSignupViewController : UIViewController

- (instancetype)initWithProvider:(BLVLoginSignupProvider)provider;

@property (nonatomic, weak) id<BOHSignupViewControllerDelegate> delegate;

@end
