//
//  BLVLoginSignUpViewController.h
//  BLVLoginSignUpViewController
//
//  Created by Billy on 07/12/14.
//  Copyright (c) 2014 Bloglovin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BOHJoinServiceDefines.h"
#import "BOHJoinServiceOptions.h"


@class BOHJoinServiceViewController;

@protocol BOHJoinServiceViewControllerDelegate <NSObject>

- (void)joinServiceViewController:(BOHJoinServiceViewController *)vc performedAction:(BLVLoginSignupAction)action parameters:(NSDictionary *)parameters;

@end

@interface BOHJoinServiceViewController : UIViewController

@property (nonatomic, weak) id<BOHJoinServiceViewControllerDelegate> delegate;

/**
    Initialize with one or more login providers.
 */
- (instancetype)initWithProvider:(BLVLoginSignupProvider)provider options:(BOHJoinServiceOptions *)options;

/**
    Whether or not to show a loader on top of the current screen.
 */
- (void)showLoader:(BOOL)show;

/**
    Use this to provide login or signup feedback to the user on top of the current screen.
 */
- (void)displayAlertWithTitle:(NSString *)title message:(NSString *)message;

@end
