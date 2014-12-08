//
//  BLVSignupViewController.h
//  BLVLoginSignUpViewController
//
//  Created by Billy on 07/12/14.
//  Copyright (c) 2014 Bloglovin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BOHJoinServiceDefines.h"
#import "BOHJoinServiceOptions.h"

@class BOHSignupViewController;

@protocol BOHSignupViewControllerDelegate <NSObject>

- (void)signupViewController:(BOHSignupViewController *)vc didPerformAction:(BOHJoinServiceAction)action parameters:(NSDictionary *)parameters;

@end

@interface BOHSignupViewController : UIViewController

- (instancetype)initWithProvider:(BOHJoinServiceProvider)provider options:(BOHJoinServiceOptions *)options;

@property (nonatomic, weak) id<BOHSignupViewControllerDelegate> delegate;

@end
