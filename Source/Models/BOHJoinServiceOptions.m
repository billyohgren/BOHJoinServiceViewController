//
//  BLVJoinOptions.m
//  BLVLoginSignUpViewController
//
//  Created by Billy on 07/12/14.
//  Copyright (c) 2014 Bloglovin. All rights reserved.
//

#import "BOHJoinServiceOptions.h"

@implementation BOHJoinServiceOptions

- (BOHJoinServiceOptionsMainScreen *)mainScreenOptions {
    if (!_mainScreenOptions) {
        _mainScreenOptions = [[BOHJoinServiceOptionsMainScreen alloc] init];
    }
    return _mainScreenOptions;
}

- (BOHJoinServiceOptionsSignUpScreen *)signUpScreenOptions {
    if (!_signUpScreenOptions) {
        _signUpScreenOptions = [[BOHJoinServiceOptionsSignUpScreen alloc] init];
    }
    return _signUpScreenOptions;
}

- (BOHJoinServiceOptionsLogInScreen *)logInScreenOptions {
    if (!_logInScreenOptions) {
        _logInScreenOptions = [[BOHJoinServiceOptionsLogInScreen alloc] init];
    }
    return _logInScreenOptions;
}

@end

@implementation BOHJoinServiceOptionsMainScreen

- (NSString *)title {
    if (!_title) {
        _title = NSLocalizedString(@"", @"Main screen default title");
    }
    return _title;
}

- (UIColor *)backgroundColor {
    if (!_backgroundColor) {
        _backgroundColor = [UIColor whiteColor];
    }
    return _backgroundColor;
}

- (NSString *)facebookButtonTitle {
    if (!_facebookButtonTitle) {
        _facebookButtonTitle = NSLocalizedString(@"Connect with Facebook", @"Main screen default Facebook button title");
    }
    return _facebookButtonTitle;
}

- (NSString *)twitterButtonTitle {
    if (!_twitterButtonTitle) {
        _twitterButtonTitle = NSLocalizedString(@"Connect with Twitter", @"Main screen default Twitter button title");
    }
    return _twitterButtonTitle;
}

- (NSString *)signUpButtonTitle {
    if (!_signUpButtonTitle) {
        _signUpButtonTitle = NSLocalizedString(@"Sign Up", @"Main screen default Sign Up button title");
    }
    return _signUpButtonTitle;
}

- (NSString *)logInButtonTitle {
    if (!_logInButtonTitle) {
        _logInButtonTitle = NSLocalizedString(@"Log In", @"Main screen default Log In button title");
    }
    return _logInButtonTitle;
}

- (NSString *)skipButtonTitle {
    if (!_skipButtonTitle) {
        _skipButtonTitle = NSLocalizedString(@"Skip", @"Main screen default Skip button title");
    }
    return _skipButtonTitle;
}

@end

@implementation BOHJoinServiceOptionsSignUpScreen : NSObject

- (NSString *)title {
    if (!_title) {
        _title = NSLocalizedString(@"Sign Up", @"Sign Up screen default title");
    }
    return _title;
}

- (UIColor *)backgroundColor {
    if (!_backgroundColor) {
        _backgroundColor = [UIColor whiteColor];
    }
    return _backgroundColor;
}

- (NSString *)namePlaceholderText {
    if (!_namePlaceholderText) {
        _namePlaceholderText = NSLocalizedString(@"Name", @"Sign Up default name placeholder");
    }
    return _namePlaceholderText;
}

- (NSString *)emailPlaceholderText {
    if (!_emailPlaceholderText) {
        _emailPlaceholderText = NSLocalizedString(@"Email", @"Sign Up default email placeholder");
    }
    return _emailPlaceholderText;
}

- (NSString *)passwordPlaceholderText {
    if (!_passwordPlaceholderText) {
        _passwordPlaceholderText = NSLocalizedString(@"Password", @"Sign Up default password placeholder");
    }
    return _passwordPlaceholderText;
}

@end

@implementation BOHJoinServiceOptionsLogInScreen : NSObject

- (NSString *)title {
    if (!_title) {
        _title = NSLocalizedString(@"Log In", @"Log In screen default title");
    }
    return _title;
}

- (UIColor *)backgroundColor {
    if (!_backgroundColor) {
        _backgroundColor = [UIColor whiteColor];
    }
    return _backgroundColor;
}

- (UIColor *)tableViewBackgroundColor {
    if (!_tableViewBackgroundColor) {
        _tableViewBackgroundColor = [UIColor grayColor];
    }
    return _tableViewBackgroundColor;
}

- (NSString *)emailPlaceholderText {
    if (!_emailPlaceholderText) {
        _emailPlaceholderText = NSLocalizedString(@"Email", @"Log In default email placeholder");
    }
    return _emailPlaceholderText;
}

- (NSString *)passwordPlaceholderText {
    if (!_passwordPlaceholderText) {
        _passwordPlaceholderText = NSLocalizedString(@"Password", @"Log In default password placeholder");
    }
    return _passwordPlaceholderText;
}

- (NSString *)forgotPasswordButtonTitle {
    if (!_forgotPasswordButtonTitle) {
        _forgotPasswordButtonTitle = NSLocalizedString(@"Forgot password?", @"Log In default forgot password title");
    }
    return _forgotPasswordButtonTitle;
}

- (NSString *)forgotPasswordAlertTitle {
    if (!_forgotPasswordAlertTitle) {
        _forgotPasswordAlertTitle = NSLocalizedString(@"Forgot password", @"Log In default forgot password alert title");
    }
    return _forgotPasswordAlertTitle;
}

- (NSString *)forgotPasswordAlertMessage {
    if (!_forgotPasswordAlertMessage) {
        _forgotPasswordAlertMessage = NSLocalizedString(@"Enter your email and we will send you a new password.", @"Log In default forgot password alert message");
    }
    return _forgotPasswordAlertMessage;
}

- (NSString *)forgotPasswordAlertSendButtonTitle {
    if (!_forgotPasswordAlertSendButtonTitle) {
        _forgotPasswordAlertSendButtonTitle = NSLocalizedString(@"Send", @"Log In default forgot password send button title");
    }
    return _forgotPasswordAlertSendButtonTitle;
}

- (NSString *)forgotPasswordAlertCancelButtonTitle {
    if (!_forgotPasswordAlertCancelButtonTitle) {
        _forgotPasswordAlertCancelButtonTitle = NSLocalizedString(@"Cancel", @"Log In default forgot password cancel button title");
    }
    return _forgotPasswordAlertCancelButtonTitle;
}

@end
