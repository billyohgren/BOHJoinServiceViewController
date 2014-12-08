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

@property (nonatomic, assign) BOHJoinServiceProvider  provider;
@property (nonatomic, strong) BOHJoinServiceOptions   *options;

@property (nonatomic, strong) BOHSignupViewController *signupViewController;
@property (nonatomic, strong) BOHLoginViewController  *loginViewController;

@property (nonatomic, strong) UIImageView             *appImageView;
@property (nonatomic, strong) UIImageView             *backgroundImageView;

@property (nonatomic, strong) UIButton                *signupButton;
@property (nonatomic, strong) UIButton                *loginButton;
@property (nonatomic, strong) UIButton                *skipButton;

@property (nonatomic, strong) UIView                  *loaderView;

@end

@implementation BOHJoinServiceViewController

- (instancetype)initWithProvider:(BOHJoinServiceProvider)provider options:(BOHJoinServiceOptions *)options {
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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
    self.signupButton.frame = CGRectMake(30.f, 200.f, 60.f, 60.f);
    self.loginButton.frame = CGRectMake(300.f, 200.f, 60.f, 60.f);
    
}

- (void)layoutButtonsHorizontally {
    
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

#pragma mark - Public

- (void)showLoader:(BOOL)show {
    if (show) {
        [self startLoader];
    } else {
        [self stopLoader];
    }
}

- (void)displayAlertWithTitle:(NSString *)title message:(NSString *)message {
    //[[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:self otherButtonTitles:<#(NSString *), ...#>, nil]
}

#pragma mark - Loader

- (UIView *)loaderView {
    if (!_loaderView) {
        _loaderView = [[UIView alloc] initWithFrame:self.view.bounds];
        [_loaderView setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.5f]];
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        indicatorView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
        UIViewAutoresizingFlexibleRightMargin |
        UIViewAutoresizingFlexibleTopMargin |
        UIViewAutoresizingFlexibleBottomMargin;
        [indicatorView startAnimating];
        [indicatorView setCenter:_loaderView.center];
        [_loaderView addSubview:indicatorView];
        _loaderView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return _loaderView;
}

- (void)startLoader {
    if (self.loaderView.superview) {
        return;
    }
    self.loaderView.alpha = 0;
    self.loaderView.frame = self.navigationController.view.bounds;
    [self.navigationController.view addSubview:self.loaderView];
    [UIView animateWithDuration:0.3 animations:^{
        self.loaderView.alpha = 1.0f;
    } completion:^(BOOL finished) {
    }];
}

- (void)stopLoader {
    [UIView animateWithDuration:0.3 animations:^{
        self.loaderView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self.loaderView removeFromSuperview];
    }];
}

#pragma mark - Button actions

- (void)signupAction:(id)sender {
    self.signupViewController = [[BOHSignupViewController alloc] initWithProvider:self.provider options:self.options];
    self.signupViewController.delegate = self;
    [self.navigationController pushViewController:self.signupViewController animated:YES];
}

- (void)loginAction:(id)sender {
    self.loginViewController = [[BOHLoginViewController alloc] initWithProvider:self.provider options:self.options];
    self.loginViewController.delegate = self;
    [self.navigationController pushViewController:self.loginViewController animated:YES];
}

- (void)skipAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(joinServiceViewController:performedAction:parameters:)]) {
        [self.delegate joinServiceViewController:self
                                 performedAction:BOHJoinServiceActionSkip
                                      parameters:nil];
    }
}

#pragma mark - BLVSignupViewControllerDelegate

- (void)signupViewController:(BOHSignupViewController *)vc didPerformAction:(BOHJoinServiceAction)action parameters:(NSDictionary *)parameters{
    if (self.delegate && [self.delegate respondsToSelector:@selector(joinServiceViewController:performedAction:parameters:)]) {
        [self.delegate joinServiceViewController:self
                                 performedAction:action
                                      parameters:parameters];
    }
}

#pragma mark - BLVLoginViewControllerDelegate

- (void)loginViewController:(BOHSignupViewController *)vc didPerformAction:(BOHJoinServiceAction)action parameters:(NSDictionary *)parameters {
    if (self.delegate && [self.delegate respondsToSelector:@selector(joinServiceViewController:performedAction:parameters:)]) {
        [self.delegate joinServiceViewController:self
                                 performedAction:action
                                      parameters:parameters];
    }
}

@end
