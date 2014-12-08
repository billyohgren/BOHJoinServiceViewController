//
//  BLVJoinOptions.h
//  BLVLoginSignUpViewController
//
//  Created by Billy on 07/12/14.
//  Copyright (c) 2014 Bloglovin. All rights reserved.
//

@import UIKit;
#import "BOHJoinServiceLayout.h"

@class BOHJoinServiceOptionsMainScreen;
@class BOHJoinServiceOptionsSignUpScreen;
@class BOHJoinServiceOptionsLogInScreen;

@interface BOHJoinServiceOptions : NSObject

@property (nonatomic, strong) BOHJoinServiceOptionsMainScreen *mainScreenOptions;
@property (nonatomic, strong) BOHJoinServiceOptionsSignUpScreen *signUpScreenOptions;
@property (nonatomic, strong) BOHJoinServiceOptionsLogInScreen *logInScreenOptions;

@end

@interface BOHJoinServiceOptionsMainScreen : NSObject

@property (nonatomic, assign) BOOL allowSkipLoginSignUp;

@property (nonatomic, strong) UIImage *appImage;
@property (nonatomic, strong) UIImage *backgroundImage;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, assign) BOOL showFacebookButtonOnMainScreen;
@property (nonatomic, strong) NSString *facebookButtonTitle;

@property (nonatomic, assign) BOOL showTwitterButtonOnMainScreen;
@property (nonatomic, strong) NSString *twitterButtonTitle;

@property (nonatomic, assign) BLVLoginSignupButtonLayout buttonLayout;

// Defaults to "Sign up".
@property (nonatomic, strong) NSString *signUpButtonTitle;
// Defaults to "Log In".
@property (nonatomic, strong) NSString *logInButtonTitle;
// Defaults to "Skip".
@property (nonatomic, strong) NSString *skipButtonTitle;

@end

@interface BOHJoinServiceOptionsSignUpScreen : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, strong) NSURL *TOSUrl;
@property (nonatomic, strong) NSString *TOSButtonTitle;

@property (nonatomic, strong) NSString *namePlaceholderText;
@property (nonatomic, strong) NSString *emailPlaceholderText;
@property (nonatomic, strong) NSString *passwordPlaceholderText;

@end

@interface BOHJoinServiceOptionsLogInScreen : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, strong) UIColor *tableViewBackgroundColor;

@property (nonatomic, strong) NSString *emailPlaceholderText;
@property (nonatomic, strong) NSString *passwordPlaceholderText;

@property (nonatomic, strong) NSString *forgotPasswordButtonTitle;
@property (nonatomic, strong) NSString *forgotPasswordAlertTitle;
@property (nonatomic, strong) NSString *forgotPasswordAlertMessage;
@property (nonatomic, strong) NSString *forgotPasswordAlertSendButtonTitle;
@property (nonatomic, strong) NSString *forgotPasswordAlertCancelButtonTitle;

@end
