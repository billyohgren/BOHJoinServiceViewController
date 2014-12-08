//
//  BLVSignupViewController.m
//  BLVLoginSignUpViewController
//
//  Created by Billy on 07/12/14.
//  Copyright (c) 2014 Bloglovin. All rights reserved.
//

#import "BOHSignupViewController.h"

@interface BOHSignupViewController ()

@property (nonatomic, assign) BLVLoginSignupProvider provider;

@property (nonatomic, strong) UIButton               *facebookButton;
@property (nonatomic, strong) UIButton               *twitterButton;

@property (nonatomic, strong) UIButton               *emailButton;
@property (nonatomic, strong) UITextField            *nameField;
@property (nonatomic, strong) UITextField            *emailField;
@property (nonatomic, strong) UITextField            *passwordField;

@property (nonatomic, strong) UIButton               *tosButton;

@end

@implementation BOHSignupViewController

- (instancetype)initWithProvider:(BLVLoginSignupProvider)provider {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Actions

- (void)facebookAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(signupViewController:didPerformAction:parameters:)]) {
        [self.delegate signupViewController:self didPerformAction:BLVLoginSignupActionSignupWithFacebook parameters:nil];
    }
}

- (void)twitterAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(signupViewController:didPerformAction:parameters:)]) {
        [self.delegate signupViewController:self didPerformAction:BLVLoginSignupActionSignupWithTwitter parameters:nil];
    }
}

- (void)emailAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(signupViewController:didPerformAction:parameters:)]) {
        NSDictionary *parameters = @{BLVLoginSignUpParameterName : self.nameField.text,
                                     BLVLoginSignUpParameterEmail : self.emailField.text,
                                     BLVLoginSignUpParameterPassword : self.passwordField.text};
        [self.delegate signupViewController:self didPerformAction:BLVLoginSignupActionSignupWithEmail parameters:parameters];
    }
}

@end
