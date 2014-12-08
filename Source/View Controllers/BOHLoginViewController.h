//
//  BLVLoginViewController.h
//  BLVLoginSignUpViewController
//
//  Created by Billy on 07/12/14.
//  Copyright (c) 2014 Bloglovin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BOHJoinServiceDefines.h"
#import "BOHJoinServiceOptions.h"

@class BOHLoginViewController;

@protocol BOHLoginViewControllerDelegate <NSObject>

- (void)loginViewController:(BOHLoginViewController *)vc didPerformAction:(BLVLoginSignupAction)action parameters:(NSDictionary *)parameters;

@end

@interface BOHLoginViewController : UIViewController

- (instancetype)initWithProvider:(BLVLoginSignupProvider)provider options:(BOHJoinServiceOptions *)options;

@property (nonatomic, weak) id<BOHLoginViewControllerDelegate> delegate;

@end
