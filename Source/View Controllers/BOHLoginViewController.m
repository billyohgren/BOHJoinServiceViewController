//
//  BLVLoginViewController.m
//  BLVLoginSignUpViewController
//
//  Created by Billy on 07/12/14.
//  Copyright (c) 2014 Bloglovin. All rights reserved.
//

#import "BOHLoginViewController.h"

@interface BOHLoginViewController ()

@property (nonatomic, assign) BLVLoginSignupProvider provider;

@property (nonatomic, strong) UIButton               *facebookButton;
@property (nonatomic, strong) UIButton               *twitterButton;

@property (nonatomic, strong) UIButton               *emailButton;
@property (nonatomic, strong) UITextField            *emailField;
@property (nonatomic, strong) UITextField            *passwordField;

@end

@implementation BOHLoginViewController

- (instancetype)initWithProvider:(BLVLoginSignupProvider)provider {
    self = [super init];
    if (self) {
        _provider = provider;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Button Actions 

- (void)facebookAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginViewController:didPerformAction:parameters:)]) {
        [self.delegate loginViewController:self didPerformAction:BLVLoginSignupActionLoginWithFacebook parameters:nil];
    }
}

- (void)twitterAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginViewController:didPerformAction:parameters:)]) {
        [self.delegate loginViewController:self didPerformAction:BLVLoginSignupActionLoginWithTwitter parameters:nil];
    }
}

- (void)emailAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginViewController:didPerformAction:parameters:)]) {
        NSDictionary *parameters = @{BLVLoginSignUpParameterEmail : self.emailField.text,
                                     BLVLoginSignUpParameterPassword : self.passwordField};
        [self.delegate loginViewController:self didPerformAction:BLVLoginSignupActionLoginWithEmail parameters:parameters];
    }
}


@end
