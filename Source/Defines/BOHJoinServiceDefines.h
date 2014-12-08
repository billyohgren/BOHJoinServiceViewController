//
//  BLVLoginSignupDataTypes.h
//  BLVLoginSignUpViewController
//
//  Created by Billy on 07/12/14.
//  Copyright (c) 2014 Bloglovin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BOHJoinServiceProvider) {
    BOHJoinServiceProviderEmail     = (1 << 0),
    BOHJoinServiceProviderFacebook  = (1 << 1),
    BOHJoinServiceProviderTwitter   = (1 << 2)
};

typedef NS_ENUM(NSInteger, BOHJoinServiceAction) {
    BOHJoinServiceActionLoginWithEmail,
    BOHJoinServiceActionLoginWithFacebook,
    BOHJoinServiceActionLoginWithTwitter,
    BOHJoinServiceActionLoginForgotPassword,
    BOHJoinServiceActionSignupWithEmail,
    BOHJoinServiceActionSignupWithFacebook,
    BOHJoinServiceActionSignupWithTwitter,
    BOHJoinServiceActionSkip
};

typedef NS_ENUM(NSInteger, BOHJoinServiceSectionType) {
    BOHJoinServiceSectionTypeFacebook,
    BOHJoinServiceSectionTypeTwitter,
    BOHJoinServiceSectionTypeEmail
};

typedef NS_ENUM(NSInteger, BOHJoinServiceRowType) {
    BOHJoinServiceRowTypeFacebookButton,
    BOHJoinServiceRowTypeTwitterButton,
    BOHJoinServiceRowTypeEmailLoginButton,
    BOHJoinServiceRowTypeEmailSignupButton,
    BOHJoinServiceRowTypeName,
    BOHJoinServiceRowTypeEmail,
    BOHJoinServiceRowTypePassword
};

/**
 Parameter dictionary keys
 */
extern NSString *const BLVLoginSignUpParameterEmail;
extern NSString *const BLVLoginSignUpParameterName;
extern NSString *const BLVLoginSignUpParameterPassword;