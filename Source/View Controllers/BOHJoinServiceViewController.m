//
//  BLVLoginSignUpViewController.m
//  BLVLoginSignUpViewController
//
//  Created by Billy on 07/12/14.
//  Copyright (c) 2014 Bloglovin. All rights reserved.
//

#import "BOHJoinServiceViewController.h"

// View controllers
#import "BOHSignupViewController.h"
#import "BOHLoginViewController.h"

@interface BOHJoinServiceViewController ()
<
    BOHSignupViewControllerDelegate,
    BOHLoginViewControllerDelegate
>

@property (nonatomic, strong) BOHSignupViewController *signupViewController;
@property (nonatomic, strong) BOHLoginViewController  *loginViewController;

@property (nonatomic, strong) UIImageView             *appImageView;
@property (nonatomic, strong) UIImageView             *backgroundImageView;

@property (nonatomic, strong) UIButton                *signupButton;
@property (nonatomic, strong) UIButton                *loginButton;
@property (nonatomic, strong) UIButton                *skipButton;

@property (nonatomic, assign) BLVLoginSignupProvider  provider;

@end

@implementation BOHJoinServiceViewController

- (instancetype)initWithProvider:(BLVLoginSignupProvider)provider options:(BOHJoinServiceOptions *)options {
    self = [super init];
    if (self) {
        _provider = provider;
        _options = options;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    if (self.options.mainScreenOptions.appImage) {
        self.appImageView = [[UIImageView alloc] initWithImage:self.options.mainScreenOptions.appImage];
    }
    
    if (self.options.mainScreenOptions.backgroundImage) {
        self.backgroundImageView = [[UIImageView alloc] initWithImage:self.options.mainScreenOptions.backgroundImage];
    }
    
    self.signupButton = [[UIButton alloc] init];
    [self.signupButton addTarget:self action:@selector(signupAction:) forControlEvents:UIControlEventTouchUpInside];
    self.signupButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.signupButton];
    
    self.loginButton = [[UIButton alloc] init];
    [self.loginButton addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    self.loginButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.loginButton];
    
    if (self.options.mainScreenOptions.allowSkipLoginSignUp) {
        self.skipButton = [[UIButton alloc] init];
        [self.skipButton addTarget:self action:@selector(skipAction:) forControlEvents:UIControlEventTouchUpInside];
        self.skipButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:self.skipButton];
    }

    [self setupStyle];
    [self layoutButtons:self.options.mainScreenOptions.buttonLayout];
}

#pragma mark - Setup

- (void)setupStyle {
    self.view.backgroundColor = self.options.mainScreenOptions.backgroundColor;
    [self.signupButton setTitle:self.options.mainScreenOptions.signUpButtonTitle forState:UIControlStateNormal];
    [self.loginButton setTitle:self.options.mainScreenOptions.logInButtonTitle forState:UIControlStateNormal];
    if (self.options.mainScreenOptions.allowSkipLoginSignUp) {
       [self.skipButton setTitle:self.options.mainScreenOptions.skipButtonTitle forState:UIControlStateNormal];
    }
}

#pragma mark - Layout

- (void)layoutButtons:(BLVLoginSignupButtonLayout)layout {
    switch (layout) {
        case BLVLoginSignupButtonLayoutHorizontal:{
            [self layoutButtonsHorizontally];
        }break;
        case BLVLoginSignupButtonLayoutVertical:{
            [self layoutButtonsVertically];
        }
        default:
            break;
    }
}

- (void)layoutButtonsVertically {
    
    
}

- (void)layoutButtonsHorizontally {
    NSDictionary *views = [self autoLayoutViewsDictionary];
        
    NSArray *constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[signupButton(100)]"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:views];
    
    NSArray *constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[signupButton(100)]"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:views];
    
    [self.signupButton addConstraints:constraint_H];
    [self.signupButton addConstraints:constraint_V];
}

- (NSDictionary *)autoLayoutViewsDictionary {
    NSMutableDictionary *views = [NSMutableDictionary dictionaryWithObjectsAndKeys:self.signupButton,@"signupButton",
                                  self.loginButton, @"loginButton",
                                  nil];
    
    if (self.options.mainScreenOptions.allowSkipLoginSignUp) {
        [views setObject:self.skipButton forKey:@"skipButton"];
    }
    
    return views;
}

#pragma mark - Button actions

- (void)signupAction:(id)sender {
    self.signupViewController = [[BOHSignupViewController alloc] initWithProvider:self.provider];
    self.signupViewController.delegate = self;
    [self.navigationController pushViewController:self.signupViewController animated:YES];
}

- (void)loginAction:(id)sender {
    self.loginViewController = [[BOHLoginViewController alloc] initWithProvider:self.provider];
    self.loginViewController.delegate = self;
    [self.navigationController pushViewController:self.loginViewController animated:YES];
}

- (void)skipAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(joinServiceViewController:performedAction:parameters:)]) {
        [self.delegate joinServiceViewController:self
                                 performedAction:BLVLoginSignupActionSkip
                                      parameters:nil];
    }
}

#pragma mark - BLVSignupViewControllerDelegate

- (void)signupViewController:(BOHSignupViewController *)vc didPerformAction:(BLVLoginSignupAction)action parameters:(NSDictionary *)parameters{
    if (self.delegate && [self.delegate respondsToSelector:@selector(joinServiceViewController:performedAction:parameters:)]) {
        [self.delegate joinServiceViewController:self
                                 performedAction:action
                                      parameters:parameters];
    }
}

#pragma mark - BLVLoginViewControllerDelegate

- (void)loginViewController:(BOHSignupViewController *)vc didPerformAction:(BLVLoginSignupAction)action parameters:(NSDictionary *)parameters {
    if (self.delegate && [self.delegate respondsToSelector:@selector(joinServiceViewController:performedAction:parameters:)]) {
        [self.delegate joinServiceViewController:self
                                 performedAction:action
                                      parameters:parameters];
    }
}

@end
