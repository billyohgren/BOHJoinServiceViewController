//
//  BLVLoginSignupDataTypes.h
//  BLVLoginSignUpViewController
//
//  Created by Billy on 07/12/14.
//  Copyright (c) 2014 Bloglovin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BLVLoginSignupProvider) {
    BLVLoginSignupProviderEmail     = (1 << 0),
    BLVLoginSignupProviderFacebook  = (1 << 1),
    BLVLoginSignupProviderTwitter   = (1 << 2)
};

typedef NS_ENUM(NSInteger, BLVLoginSignupAction) {
    BLVLoginSignupActionLoginWithEmail,
    BLVLoginSignupActionLoginWithFacebook,
    BLVLoginSignupActionLoginWithTwitter,
    BLVLoginSignupActionLoginForgotPassword,
    BLVLoginSignupActionSignupWithEmail,
    BLVLoginSignupActionSignupWithFacebook,
    BLVLoginSignupActionSignupWithTwitter,
    BLVLoginSignupActionSkip
};

/**
 Parameter dictionary keys
 */
extern NSString *const BLVLoginSignUpParameterEmail;
extern NSString *const BLVLoginSignUpParameterName;
extern NSString *const BLVLoginSignUpParameterPassword;