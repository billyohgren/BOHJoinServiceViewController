//
//  BLVSignupViewController.m
//  BLVLoginSignUpViewController
//
//  Created by Billy on 07/12/14.
//  Copyright (c) 2014 Bloglovin. All rights reserved.
//

#import "BOHSignupViewController.h"
#import "BOHJoinServiceCell.h"

@interface BOHSignupViewController ()
<
    UITableViewDataSource,
    UITableViewDelegate,
    UITextFieldDelegate,
    UIGestureRecognizerDelegate
>

@property (nonatomic, strong) UITableView            *tableView;

@property (nonatomic, strong) BOHJoinServiceCell     *nameCell;
@property (nonatomic, strong) BOHJoinServiceCell     *emailCell;
@property (nonatomic, strong) BOHJoinServiceCell     *passwordCell;

@property (nonatomic, assign) BLVLoginSignupProvider provider;
@property (nonatomic, strong) BOHJoinServiceOptions  *options;

@property (nonatomic, strong) UIButton               *facebookButton;
@property (nonatomic, strong) UIButton               *twitterButton;

@property (nonatomic, strong) UIButton               *emailButton;

@property (nonatomic, strong) UIButton               *tosButton;

@end

@implementation BOHSignupViewController

- (instancetype)initWithProvider:(BLVLoginSignupProvider)provider options:(BOHJoinServiceOptions *)options {
    self = [super init];
    if (self) {
        _provider = provider;
        _options = options;
        self.title = _options.signUpScreenOptions.title;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = self.options.logInScreenOptions.tableViewBackgroundColor;
    [self.view addSubview:self.tableView];
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
        NSDictionary *parameters = @{BLVLoginSignUpParameterName : self.nameCell.textField.text,
                                     BLVLoginSignUpParameterEmail : self.emailCell.textField.text,
                                     BLVLoginSignUpParameterPassword : self.passwordCell.textField.text};
        [self.delegate signupViewController:self didPerformAction:BLVLoginSignupActionSignupWithEmail parameters:parameters];
    }
}

@end
